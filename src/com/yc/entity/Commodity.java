package com.yc.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.yc.entity.user.User;

@Entity
@DiscriminatorValue("commodity")
@JsonIgnoreProperties(value = { "storeOperator", "purchase", "storeRoom", "orderNumber", "imagePaths" })
public class Commodity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer commodityID;
	@Column(unique = true)
	private Integer transNumForTaobao;// 淘宝id
	@Column
	private String commItem;// 货号
	@Column
	private String barcodes;// 条形码
	@Column
	private String tpek;
	@Column
	private String color;// 颜色
	@Column
	private String size;// 尺码
	@Column
	private Integer quantity;// 数量
	@Column
	private Float weight;// 重量
	@Column
	private String nameOfGoods;// 货品名称
	@Column
	private Float price;// 价格
	@Column
	private Float money;// 金额
	@Column
	private String comment;// 评论
	@ManyToOne
	@JoinColumn(name = "store_user")
	private User storeOperator;// 库房操作员
	@ManyToOne
	@JoinColumn(name = "purchase_user")
	private User purchase;// 采购员
	@Column
	@Enumerated(EnumType.STRING)
	private OrderStatus status;// 状态
	@ManyToOne
	@JoinColumn(name = "storeRoom_id")
	private StoreRoom storeRoom;
	@ManyToOne
	@JoinColumn(name = "orderform_id")
	private OrderForm orderNumber;
	@OneToMany(mappedBy = "commodity")
	private List<ImagePath> imagePaths;

	public String getNameOfGoods() {
		return nameOfGoods;
	}

	public void setNameOfGoods(String nameOfGoods) {
		this.nameOfGoods = nameOfGoods;
	}

	public User getStoreOperator() {
		return storeOperator;
	}

	public void setStoreOperator(User storeOperator) {
		this.storeOperator = storeOperator;
	}

	public User getPurchase() {
		return purchase;
	}

	public void setPurchase(User purchase) {
		this.purchase = purchase;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public StoreRoom getStoreRoom() {
		return storeRoom;
	}

	public void setStoreRoom(StoreRoom storeRoom) {
		this.storeRoom = storeRoom;
	}

	public List<ImagePath> getImagePaths() {
		return imagePaths;
	}

	public void setImagePaths(List<ImagePath> imagePaths) {
		this.imagePaths = imagePaths;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Float getWeight() {
		return weight;
	}

	public void setWeight(Float weight) {
		this.weight = weight;
	}

	public Float getMoney() {
		return money;
	}

	public void setMoney(Float money) {
		this.money = money;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public OrderStatus getStatus() {
		return status;
	}

	public void setStatus(OrderStatus status) {
		this.status = status;
	}

	public Integer getCommodityID() {
		return commodityID;
	}

	public void setCommodityID(Integer commodityID) {
		this.commodityID = commodityID;
	}

	public OrderForm getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(OrderForm orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Integer getTransNumForTaobao() {
		return transNumForTaobao;
	}

	public void setTransNumForTaobao(Integer transNumForTaobao) {
		this.transNumForTaobao = transNumForTaobao;
	}

	public String getCommItem() {
		return commItem;
	}

	public void setCommItem(String commItem) {
		this.commItem = commItem;
	}

	public String getBarcodes() {
		return barcodes;
	}

	public void setBarcodes(String barcodes) {
		this.barcodes = barcodes;
	}

	public String getTpek() {
		return tpek;
	}

	public void setTpek(String tpek) {
		this.tpek = tpek;
	}

}
