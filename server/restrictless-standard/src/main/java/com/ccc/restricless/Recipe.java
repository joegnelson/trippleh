package com.ccc.restricless;

import java.util.Date;

public class Recipe {

	private String id;
	private String title;
	private String imageName;
	private String imageUrl;
	private String category;
	private String restrictions; //comma seperated list
	private String ingredients; //comma seperated List
	private String directions; //comma seperated List
	
	public Recipe(
			 String id,
			 String title,
			 String imageName,
			 String imageUrl,
			 String category,
			 String restrictions,
			 String ingredients, 
			 String directions
			)
	{
		 this.id=id;
		 this.title=title;
		 this.imageName=imageName;
		 this.imageUrl=imageUrl;
		 this.category=category;
		 this.restrictions=restrictions;
		 this.ingredients=ingredients; 
		 this.directions=directions;
	}
	public String toJson() {
		return "{ "
				+ jsonFormat("id",getId())
				+","+ jsonFormat("title",getTitle())
				+","+ jsonFormat("imageName",getImageName())
				+","+ jsonFormat("imageUrl",getImageUrl())
				+","+ jsonFormat("category",getCategory())
				+","+ jsonFormat("restrictions",getRestrictions())
				+","+ jsonFormat("ingredients",getIngredients())
				+","+ jsonFormat("directions",getDirections())
				+ "}";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRestrictions() {
		return restrictions;
	}
	public void setRestrictions(String restrictions) {
		this.restrictions = restrictions;
	}
	public String getIngredients() {
		return ingredients;
	}
	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}
	public String getDirections() {
		return directions;
	}
	public void setDirections(String directions) {
		this.directions = directions;
	}
	private String jsonFormat(String name,Date value) {
		return "\""+name+ "\": \""+value.toString()+ "\" ";
	}
	private String jsonFormat(String name,String value) {
		return "\""+name+ "\": \""+value+ "\" ";
	}

}
