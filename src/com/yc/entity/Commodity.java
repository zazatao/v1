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

import com.yc.entity.user.Personnel;

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
	private String barcodes;// 自己的条形码
	@Column
	private String tpek;	//卖家条形码
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
	private String currency;//币种
	@Column
	private String comment;// 评论
	@ManyToOne
	@JoinColumn(name = "store_user")
	private Personnel storeOperator;// 库房操作员
	@ManyToOne
	@JoinColumn(name = "purchase_user")
	private Personnel purchase;// 采购员
	@Column
	private String seller;//卖家
	@Column
	private String sellerDate;//卖家付款日期
	@Column
	private String tradingCode;//交易码
	@Column
	@Enumerated(EnumType.STRING)
	private CommodityStatus status;// 状态
	@Column
	@Enumerated(EnumType.STRING)
	private DisposeStatus disposeStatus;// 订单处理状态
	@ManyToOne
	@JoinColumn(name = "storeRoom_id")
	private StoreRoom storeRoom;
	@ManyToOne
	@JoinColumn(name = "orderform_id")
	private OrderForm orderNumber;			
	@OneToMany(mappedBy = "commodity")
	private List<ImagePath> imagePaths;

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getSellerDate() {
		return sellerDate;
	}

	public void setSellerDate(String sellerDate) {
		this.sellerDate = sellerDate;
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

	public Personnel getStoreOperator() {
		return storeOperator;
	}

	public void setStoreOperator(Personnel storeOperator) {
		this.storeOperator = storeOperator;
	}

	public Personnel getPurchase() {
		return purchase;
	}

	public void setPurchase(Personnel purchase) {
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

	public CommodityStatus getStatus() {
		return status;
	}

	public void setStatus(CommodityStatus status) {
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

	public DisposeStatus getDisposeStatus() {
		return disposeStatus;
	}

	public void setDisposeStatus(DisposeStatus disposeStatus) {
		this.disposeStatus = disposeStatus;
	}

	public String getTradingCode() {
		return tradingCode;
	}

	public void setTradingCode(String tradingCode) {
		this.tradingCode = tradingCode;
	}

	
	
}
