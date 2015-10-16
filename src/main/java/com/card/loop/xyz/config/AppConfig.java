/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.MongoFactoryBean;

/**
 *
 * @author 
 */
@Configuration
public class AppConfig {

    /*
     * Factory bean that creates the com.mongodb.Mongo instance
     */
    public static String mongodb_host = "";
    public static int mongodb_port = 27017;
    public static String UPLOAD_LO_PATH = "C:\\Users\\aislinn.dell-PC\\Desktop\\loop-java-elearning\\uploads\\LO\\";
    public static String UPLOAD_LE_PATH = "C:\\Users\\aislinn.dell-PC\\Desktop\\loop-java-elearning\\uploads\\LE\\";
    public static String UPLOAD_BASE_PATH = "C:\\Users\\aislinn.dell-PC\\Desktop\\loop-java-elearning\\uploads\\";
    public static String INFORMATRON_URL = "http://192.168.254.101:8080";
    public static String LOOP_URL = "http://192.168.254.101:8080";

    public @Bean MongoFactoryBean mongo() {
          MongoFactoryBean mongo = new MongoFactoryBean();
          String address = "localhost";
          mongo.setHost(address);
          System.out.println("Mongodb set to :" + address);
          return mongo;
     }

}
