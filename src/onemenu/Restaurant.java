package onemenu;

public class Restaurant {
	int id; 
	String name ;
	
	public Restaurant(){
		this.id = 0 ; 
		this.name =  "" ;
	}

	public int getID(){
		return this.id; 
	}
	
	public String getName(){
		return this.name ;
	}
	
	public void setID(int id){
		this.id = id ;
	}
	
	public void setName(String name){
		this.name = name ;
	}
}
