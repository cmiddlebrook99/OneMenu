package onemenu;

import java.sql.Date;
import java.util.Calendar;

public class Review {
	
	int reviewID ; 
	double starRating ; 
	String fullDescription ; 
	String author ;
	Date reviewDate ;
	String restName ; 
	String foodName; 
	public boolean belongsToCurrentUser; 
	
	public Review(){
		this.starRating = 0 ; 
		this.fullDescription = "No full review"; 
		this.author = "" ; 
	}
	
	public  int getReviewID(){
		return this.reviewID ; 
	}
	
	public void setReviewID(int reviewID){
		this.reviewID = reviewID ;
	}
	public  double getStarRating(){
		return this.starRating ;
	}
	
	public void setStarRating(double rating){
		this.starRating = Math.round(rating * 100.0) / 100.0 ;
	}
	public String getFullDescription(){
		return this.fullDescription ;
	}
	
	public void setFullDescription(String fullDescription){
		this.fullDescription = fullDescription ;
	}
	public  String getAuthor(){
		return this.author;
	}
	public void setAuthor(String author){
		 this.author = author ;
	}
	
	public void setDate(Date date){
		this.reviewDate  = date ;
	}
	
	public Date getDate(){
		return this.reviewDate ; 
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName ;
		
	}
	public String getFoodName(){
		return this.foodName ;
	}
	
	public String getRestaurantName(){
		return this.restName ;
	}
	public void setRestaurantName(String restName) {
		this.restName = restName ;
		
	}
}
