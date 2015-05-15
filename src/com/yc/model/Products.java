package com.yc.model;

public class Products {
	
	private int transNumForTaobao;
	
	private String seller;
	
	private String nameOfGoods;
	
	private int shopcategory;
	
	private String path;
	
	private String quantity;
	

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public int getTransNumForTaobao() {
		return transNumForTaobao;
	}

	public void setTransNumForTaobao(int transNumForTaobao) {
		this.transNumForTaobao = transNumForTaobao;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getNameOfGoods() {
		return nameOfGoods;
	}

	public void setNameOfGoods(String nameOfGoods) {
		this.nameOfGoods = nameOfGoods;
	}

	public int getShopcategory() {
		return shopcategory;
	}

	public void setShopcategory(int shopcategory) {
		this.shopcategory = shopcategory;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
