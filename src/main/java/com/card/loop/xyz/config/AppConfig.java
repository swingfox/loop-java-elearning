/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.config;

import com.mongodb.Mongo;
import com.mongodb.MongoClientOptions;
import com.mongodb.MongoClientOptions.Builder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.MongoClientFactoryBean;
import org.springframework.data.mongodb.core.MongoFactoryBean;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;

/**
 *
 * @author 
 */
@Configuration
public class AppConfig {

    /*
     * Factory bean that creates the com.mongodb.Mongo instance
     */
       public static String mongodb_host = "localhost";
    public static int mongodb_port = 27017;
    public static String UPLOAD_LO_PATH = "C:\\Users\\David\\Desktop\\Software Engineering\\loop-java-elearning\\uploads\\LO\\";
    public static String UPLOAD_LE_PATH = "C:\\Users\\David\\Desktop\\Software Engineering\\loop-java-elearning\\uploads\\LE\\";
    public static String UPLOAD_BASE_PATH = "C:\\Users\\David\\Desktop\\Software Engineering\\loop-java-elearning\\uploads\\";
    public static String INFORMATRON_URL = "http://192.168.254.101:8080";
    public static String LOOP_URL = "http://192.168.254.101:8080";
    public static String DATABASE_LOOP = "loop";
    public static String COLLECTION_LO = "lo";
    public static String COLLECTION_LE = "le";
    public static String COLLECTION_USER = "user";


       // MONGODB CONFIGURATION
    public static int connectionsPerHost = 40;
    public static int connectionTimeOut = 1000;
    
    @Bean
    public Mongo mongo() throws Exception {
          MongoClientFactoryBean mongo = new MongoClientFactoryBean();
          mongo.setSingleton(false);
          mongo.setHost(mongodb_host);
          mongo.setPort(mongodb_port);
          Builder builder = MongoClientOptions.builder();
          builder.connectionsPerHost(AppConfig.connectionsPerHost);
          builder.connectTimeout(AppConfig.connectionTimeOut);
          return mongo.getObject();
    }
    
    @Bean
    public MongoOperations mongoOps() throws Exception{
        Mongo mongo = mongo();
        return new MongoTemplate(mongo,AppConfig.DATABASE_LOOP);
    }
    
    @Bean
    public MongoOperations user() throws Exception{
        Mongo mongo = mongo();
        return new MongoTemplate(mongo,AppConfig.DATABASE_LOOP);
    }   
}
