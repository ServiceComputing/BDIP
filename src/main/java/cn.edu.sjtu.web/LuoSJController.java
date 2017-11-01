package cn.edu.sjtu.web;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;

@Controller
public class LuoSJController {
    String driverName="com.mysql.jdbc.Driver";
    //String dbURL="jdbc:sqlserver://10.255.0.12:3306;DatabaseName=infomation";
    String dbURL="jdbc:mysql://10.255.0.12:3306/trojanD";
    String userName="root";
    String userPwd="hadoop928";
    Statement statement;
    Connection dbConn;
    private static final String whiteSpace = "sp";
    private static final String newline = "lm";
    private static final String inline = "in";
    private static final HashMap<String,String> stringMap = new HashMap<String, String>();

    static {
        stringMap.put("SessionTime","会话时间过长");
        stringMap.put("SYNRatio","SYN包占比过高");
        stringMap.put("PSHRatio","PSH包占比过高");
        stringMap.put("SmallRatio","小数据包占比过大");
        stringMap.put("CountRatio","上下行包数比例过高");
        stringMap.put("SizeRatio","上下行流量比例过高");
        stringMap.put("DNS","DNS次数过多");
    }


    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

    @RequestMapping(value = "/lsjQuery.do", method = RequestMethod.GET)
    public void luoSJQueryGet(HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException {
        StringBuilder sb = new StringBuilder(500);
        try {
            Class.forName(driverName);
            dbConn= DriverManager.getConnection(dbURL, userName, userPwd);
            statement = dbConn.createStatement();
            String sql = "SELECT * FROM target ORDER BY id  DESC LIMIT 10;";
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()){
                if (rs.getString("ONE_PERCENT").equals("") && rs.getString("TEN_PERCENT").equals("")){
                    continue;
                }
                sb.append(rs.getString("IP"));
                sb.append(whiteSpace);
                sb.append(rs.getString("TIME"));
                sb.append(whiteSpace);
                if (rs.getBoolean("KMEANS") == true){
                    sb.append("Kmeans模型 ");
                }
                if (rs.getBoolean("BISECT") == true){
                    sb.append("层次分类模型 ");
                }
                if (rs.getBoolean("GMM") == true){
                    sb.append("混合高斯模型 ");
                }
                sb.append(whiteSpace);
                String tmp;
                if ((tmp = rs.getString("ONE_PERCENT")).equals("")){
                    sb.append("无");
                }else{
                    String[] tmpArray = tmp.split(" ");
                    for (String insideTMP: tmpArray){
                        sb.append(stringMap.get(insideTMP));
                        sb.append(" ");
                    }
                }
                sb.append(whiteSpace);
                if ((tmp = rs.getString("TEN_PERCENT")).equals("")){
                    sb.append("无");
                }else{
                    String[] tmpArray = tmp.split(" ");
                    for (String insideTMP: tmpArray){
                        sb.append(stringMap.get(insideTMP));
                        sb.append(" ");
                    }
                }
                sb.append(whiteSpace);
                for (int i=3;i<15;i++){
                    sb.append(rs.getString(i));
                    sb.append(whiteSpace);
                }
                if (!rs.isLast()){
                    sb.append(newline);
                }
            }
            statement.close();
            dbConn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PrintStream out = new PrintStream(response.getOutputStream());
        response.setContentType("text/html;charSet=utf-8");
        out.print(sb.toString());
    }

    @RequestMapping(value = "/lsjQuery.do", method = RequestMethod.POST)
    public void luoSJQueryPost(HttpServletRequest request,
                              HttpServletResponse response) throws ServletException, IOException {
        // 检测是否为多媒体上传
        if (!ServletFileUpload.isMultipartContent(request)) {
            // 如果不是则停止
            PrintWriter writer = response.getWriter();
            writer.println("Error: 表单必须包含 enctype=multipart/form-data");
            writer.flush();
            return;
        }

        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // 设置临时存储目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);

        // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // 中文处理
        upload.setHeaderEncoding("UTF-8");

        // 构造临时路径来存储上传的文件
        // 这个路径相对当前应用的目录
        String uploadPath =  "/home/u928/lsj/TrojanD/rules.drl2";
        //String uploadPath =  "/home/jrj/928/rules.drl";

        // 如果目录不存在则创建

        try {
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);

            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        System.out.println(fileName);
                        String filePath = uploadPath;
                        File storeFile = new File(filePath);
                        // 在控制台输出文件的上传路径
                        System.out.println(filePath);
                        // 保存文件到硬盘
                        item.write(storeFile);
                        request.setAttribute("message",
                                "文件上传成功!");
                    }
                }
            }
        } catch (Exception ex) {
            request.setAttribute("message",
                    "错误信息: " + ex.getMessage());
        }
        PrintStream out = new PrintStream(response.getOutputStream());
        response.setContentType("text/html;charSet=utf-8");
        //out.print("success");
        // 跳转到 message.jsp
        //request.getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
    }
}
