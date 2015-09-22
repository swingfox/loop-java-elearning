/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.config;

import com.card.loop.xyz.model.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;

/**
 *
 * @author David
 */
public class TestClass {
    public static void main(String[] args) {

	// For XML
	//ApplicationContext ctx = new GenericXmlApplicationContext("SpringConfig.xml");

	// For Annotation
	ApplicationContext ctx = 
             new AnnotationConfigApplicationContext(AppConfig.class);
	MongoOperations mongoOperation = (MongoOperations) ctx.getBean("mongoTemplate");
        System.out.println("MONGO CONFIG");
	//User user = new User("mkyong", "password123");

	// save
	//mongoOperation.save(user);

	// now user object got the created id.
	//System.out.println("1. user : " + user);
    }
}
