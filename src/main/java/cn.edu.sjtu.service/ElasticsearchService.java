package cn.edu.sjtu.service;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.springframework.stereotype.Service;

import java.net.InetAddress;

@Service
public class ElasticsearchService {
    private TransportClient client;

    /**
     * @throws Exception
     */
    public void make_client() throws Exception
    {
        Settings settings = Settings.builder()
                .put("cluster.name", "elasticsearch")
                .build();
        client = new PreBuiltTransportClient(settings)
                .addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("10.255.0.10"), 9300));
        //System.out.println("Connected!");
    }

    public void close_client()
    {
        client.close();
    }

    public String apply_query ()
    {
        BoolQueryBuilder boolquerybuilder = QueryBuilders.boolQuery();
        boolquerybuilder.must(QueryBuilders.termQuery("_type", "dns_request"))
                .must(QueryBuilders.rangeQuery("@timestamp").from("2017-08-07T13:45:15").to("2017-08-08T13:46:15").timeZone("+08:00"));
        AggregationBuilder aggregationBuilder = AggregationBuilders.terms("selected_interval").field("srcIP").size(10);
        SearchResponse response = client.prepareSearch()
                .setSize(0).setFrom(0)
                .setQuery(boolquerybuilder)
                .addAggregation(aggregationBuilder)
                .execute().actionGet();
        return response.toString();
    }
}
