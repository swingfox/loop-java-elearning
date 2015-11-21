package com.loop.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

/*
 * MOCK DATABASE.
 * */
public class Database {
	
	private static final Database instance = new Database();
	private HashMap<String, LearningElement> db;
	private static long counter = 1;
	
	private Database() {
		db = new HashMap<>();
	}
	
	public static Database get() {
		return instance;
	}
	
	public void save(LearningElement element) {
		element.id = "FILEID" + counter++;
		db.put(element.id, element);
	}
	
	public LearningElement[] find(String searchKey) {
		Collection<LearningElement> elements = db.values();
		LearningElement[] results;
		
		if (!searchKey.equals("DEBUG")) {
			ArrayList<LearningElement>  matches = new ArrayList<>();
		
			for (LearningElement e : elements) {
				if (e.getTitle().startsWith(searchKey)) {
					matches.add(e);
				}
			}
			results = matches.toArray(new LearningElement[matches.size()]);
		} else {
			results = elements.toArray(new LearningElement[elements.size()]);
		}
		
		return results;
	}
	
	public LearningElement getElement(String id) {
		return db.get(id);
	}
	
	protected static class LearningElement {
		protected String title;
		protected String authorName;
		protected String description;
		protected String id;
		
		//DUMMIES
		protected String type = "Video";
		protected String publishingDate = "03/17/2016";
		protected String size = "87.12 MB";
		//DUMMIES
		
		/**
		 * @return the publishingDate
		 */
		public String getPublishingDate() {
			return publishingDate;
		}


		/**
		 * @return the size
		 */
		public String getSize() {
			return size;
		}


		/**
		 * @param size the size to set
		 */
		public void setSize(String size) {
			this.size = size;
		}


		/**
		 * @param publishingDate the publishingDate to set
		 */
		public void setPublishingDate(String publishingDate) {
			this.publishingDate = publishingDate;
		}


		/**
		 * @return the type
		 */
		public String getType() {
			return type;
		}


		/**
		 * @param type the type to set
		 */
		public void setType(String type) {
			this.type = type;
		}


		/**
		 * 
		 */
		public LearningElement() {
		}


		/**
		 * @param title
		 * @param authorID
		 * @param description
		 */
		public LearningElement(String title, String authorID, String description) {
			this.title = title;
			this.authorName = "Juan Dela Cruz";//authorID;
			this.description = description;
		}

		
		/**
		 * @return the title
		 */
		public String getTitle() {
			return title;
		}

		/**
		 * @param title the title to set
		 */
		public void setTitle(String title) {
			this.title = title;
		}

		/**
		 * @return the authorID
		 */
		public String getAuthorName() {
			return authorName;
		}

		/**
		 * @param authorID the authorID to set
		 */
		public void setAuthorName(String authorID) {
			this.authorName = authorID;
		}

		/**
		 * @return the description
		 */
		public String getDescription() {
			return description;
		}

		/**
		 * @param description the description to set
		 */
		public void setDescription(String description) {
			this.description = description;
		}

		/**
		 * @return the id
		 */
		public String getId() {
			return id;
		}

		/**
		 * @param id the id to set
		 */
		public void setId(String id) {
			this.id = id;
		}
		
	}

}
