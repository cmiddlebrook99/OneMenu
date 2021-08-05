package onemenu;

public class FoodItem {
	public int id ;
	String price ;
	String restaurant ;
	String name ; 
	String type; 
	String desc ;
	Double rating ;
	
	public FoodItem() {
		this.price = "" ;
		this.restaurant = ""; 
		this.name = "";
		this.type = "" ;
		this.desc = ""; 
	}
	
	public FoodItem(String price, String restaurant, String name, String type, String desc) {
		this.price = price ; 
		this.restaurant = restaurant  ; 
		this.name = name ; 
		this.type = type ; 
		this.desc = desc ; 
	}
	
	public String getPrice() {
		return this.price ;
	}
	public void setPrice(String price) {
		this.price = price  ;
	}
	public String getRestaurant() {
		return this.restaurant ;
	}
	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant ;
	}
	public String getName() {
		return this.name ;
	}
	public void setName(String name) {
		this.name = name ;
	}
	public String getFoodType() {
		return this.type ;
	}
	public void setFoodType(String type) {
		this.type = type ;
	}
	
	public String getDescription() {
		return this.desc ;
	}
	public void setDescription(String desc) {
		this.desc = desc ;
	}

	public void setRating(Double rating) {
		this.rating = Math.round(rating * 100.0) / 100.0;
		
	}
	public Double getRating(){
		return this.rating ; 
	}
}
