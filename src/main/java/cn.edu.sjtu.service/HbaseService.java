package cn.edu.sjtu.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

@Service
public class HbaseService {
    Map<String,String> cache = new Hashtable<String, String>();
    public String ScanHbase(String table_name,String column_family,String start_row,String end_row,String classification){
        String cacheKey = table_name + column_family + classification;
        String cacheValue = cache.get(cacheKey);
        if (cacheValue != null){
            return cacheValue;
        }
        BASE64Encoder encoder = new BASE64Encoder();
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpPut httpPut = new HttpPut("http://10.255.0.12:9969" + "/" + table_name + "/scanner");
        //httpPut.setURI(URI.create("/" + table_name + "/scanner"));
        Header header1 = new BasicHeader("Content-Type", "text/xml");
        Header header2 = new BasicHeader("Accept","application/json");
        httpPut.setHeader(header1);
        httpPut.setHeader(header2);
        String entity = "<Scanner startRow=\"" +  encoder.encode(start_row.getBytes()) + "\" endRow=\"" + encoder.encode(end_row.getBytes()) + "\" batch=\"256\">"
                + "<filter>{\"type\": \"FamilyFilter\",\"op\": \"EQUAL\", \"comparator\":{\"type\": \"BinaryComparator\",\"value\":\""
                + encoder.encode(column_family.getBytes()) + "\"}}</filter></Scanner>";
        try {
            StringEntity se = new StringEntity(entity);
            httpPut.setEntity(se);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        HttpResponse httpResponse = null;
        try {
            httpResponse = httpclient.execute(httpPut);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Header[] headerLocation = httpResponse.getHeaders("Location");
        System.out.println(headerLocation[0].toString());
        String location = headerLocation[0].toString().split(" ")[1].trim();
        HttpGet httpGet = new HttpGet(location);
        httpGet.setHeader(header1);
        httpGet.setHeader(header2);
        String webContent = "";
        try {
            httpResponse = httpclient.execute(httpGet);
            webContent = EntityUtils.toString(httpResponse.getEntity());
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (httpResponse.getStatusLine().getStatusCode() != 200){
            System.out.println("Wrong: Error message got");
            return null;
        }
        String result;
        result = ParseJson(webContent).get(classification).getAsString();
        cache.put(cacheKey,result);
        return result;
    }
    public JsonObject ParseJson(String input){
        JsonParser parse =new JsonParser();
        JsonObject json=(JsonObject) parse.parse(input);
        //System.out.println(json);
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            JsonElement jEle = json.get("Row");
            JsonArray jArray = (JsonArray)jEle;
            if (jEle.isJsonArray()){
                jArray = (JsonArray)jEle;
            }else{
                return null;
            }
            JsonObject jsonResult=new JsonObject();
            JsonArray tmpArray = (JsonArray)jArray.get(0).getAsJsonObject().get("Cell");
            System.out.println(new String(decoder.decodeBuffer("MTQ5MTIxMDAwMA==")));
            JsonArray jsonInside;
            for (JsonElement Jtmp:tmpArray){
                String tmp1 = Jtmp.getAsJsonObject().get("column").getAsString();
                String tmp2 = Jtmp.getAsJsonObject().get("$").getAsString();
                tmp1 = new String(decoder.decodeBuffer(tmp1)).split(":")[1];
                tmp2 = new String(decoder.decodeBuffer(tmp2));
                tmp2 = MakeStringJson(tmp2);
                StringBuilder tmpResult = new StringBuilder(200);
                jsonInside = (JsonArray)parse.parse(tmp2);
                //{"Alert":91,"Critical":180,"Warning":90}
                //[{"202.121.64.5":441438},{"202.121.244.200":112808},{"202.121.244.201":108296},{"101.7.8.9":83792},{"202.96.209.133":60468},{"202.120.2.101":40637},{"202.96.209.5":38479},{"210.35.68.7":37006},{"168.95.1.1":35730},{"180.168.255.18":35685}]
                for (JsonElement JtmpIndside: jsonInside){
                    Set<Map.Entry<String, JsonElement>> iter = JtmpIndside.getAsJsonObject().entrySet();
                    for (Map.Entry entry: iter){
                        tmpResult.append(entry.getKey());
                        tmpResult.append(',');
                        tmpResult.append(entry.getValue());
                        tmpResult.append(',');
                    }
                    //System.out.println(JtmpIndside.getAsJsonObject().entrySet());
                }
                tmp2 = tmpResult.deleteCharAt(tmpResult.lastIndexOf(",")).toString();
                jsonResult.addProperty(tmp1,tmp2);
            }
            return jsonResult;
            //System.out.println(new String(decoder.decodeBuffer("dG9wMTAtMWg6ZHN0")));
            //System.out.println(new String(decoder.decodeBuffer("W3siMjAyLjEyMS42NC41Ijo0NDE0Mzh9LHsiMjAyLjEyMS4yNDQuMjAwIjoxMTI4MDh9LHsiMjAyLjEyMS4yNDQuMjAxIjoxMDgyOTZ9LHsiMTAxLjcuOC45Ijo4Mzc5Mn0seyIyMDIuOTYuMjA5LjEzMyI6NjA0Njh9LHsiMjAyLjEyMC4yLjEwMSI6NDA2Mzd9LHsiMjAyLjk2LjIwOS41IjozODQ3OX0seyIyMTAuMzUuNjguNyI6MzcwMDZ9LHsiMTY4Ljk1LjEuMSI6MzU3MzB9LHsiMTgwLjE2OC4yNTUuMTgiOjM1Njg1fV0=")));
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    private String MakeStringJson(String input){
        if (input.charAt(0) != '['){
            return "[" + input + "]";
        }
        return input;
    }
}
