package com.yc.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.yc.entity.user.Personnel;

@Entity
@DiscriminatorValue("commodity")
@JsonIgnoreProperties(value = { "purchase", "storeRoom", "orderNumber", "imagePaths" ,})
public class Commodity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer commodityID;
	@Column
	private Integer transNumForTaobao;// shopCommodity   ID
	@Column
	private String commItem;// 货号
	@Column
	private String barcodes;// 自己的条形码
	@Column
	private String tpek; // 卖家条形码
	@Column
	private Integer quantity;// 数量
	@Column
	private Float weight;// 重量
	@Column
	private String nameOfGoods;// 货品名称
	@Column
	private Float price;// 价格
	@Column
	private Float fare;//附加费
	@Column
	private Float money;// 金额

	@OneToOne
	@JoinColumn(name = "currency_id")
	private Currency currency;// 币种
	
	@Column
	private String comment;// 评论
	@Column
	private String commSpec;//规格【，颜色-红色，尺寸-12L,】
	
	@ManyToOne
	@JoinColumn(name = "shopcategory")
	private ShopCategory shopcategory;// 类别
	
	@ManyToOne
	@JoinColumn(name = "seller_name")
	private Shop seller;// 卖家
	
	@Column
	private String sellerDate;// zazatao付款日期
	@Column
	private String tradingCode;// 交易码
	@Column
	@Enumerated(EnumType.STRING)
	private CommoidityStatus status;// 状态
	@Column
	@Enumerated(EnumType.STRING)
	private DisposeStatus disposeStatus;// 订单处理状态
	@ManyToOne
	@JoinColumn(name = "storeRoom_id")
	private StoreRoom storeRoom;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "orderform_id")
	private OrderForm orderNumber;			
	
	@OneToMany(mappedBy = "commodity")
	private List<ImagePath> imagePaths;//照片路径
	@Column
	private String cellDate;// 入单元格时间
	@Column
	private String inStoreRoomDate;// 入库房时间
	
	@Column
	private String describes;//描述
	
	@Column
	private String zazataoPayDate;//zazatao付款日期
	
	@Column
	private String zazataoPayTime;//zazatao付款时间
	
	@ManyToOne
	@JoinColumn(name = "store_user")
	private Personnel storeOperator;// 库房操作员
	
	@ManyToOne
	@JoinColumn(name = "purchase_user")
	private Personnel purchase;// 采购员
	
	@Column
	private String notes;
	
	@Column
	private String russinaNameOfGoods;
	
	@Column
	private String russinaDescribes;
	
	public String getRussinaNameOfGoods() {
		return russinaNameOfGoods;
	}

	public void setRussinaNameOfGoods(String russinaNameOfGoods) {
		this.russinaNameOfGoods = russinaNameOfGoods;
	}

	public String getRussinaDescribes() {
		return russinaDescribes;
	}
	
	public void setRussinaDescribes(String russinaDescribes) {
		this.russinaDescribes = russinaDescribes;
	}
	
	public Float getFare() {
		return fare;
	}

	public void setFare(Float fare) {
		this.fare = fare;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getZazataoPayDate() {
		return zazataoPayDate;
	}

	public void setZazataoPayDate(String zazataoPayDate) {
		this.zazataoPayDate = zazataoPayDate;
	}

	public String getZazataoPayTime() {
		return zazataoPayTime;
	}

	public void setZazataoPayTime(String zazataoPayTime) {
		this.zazataoPayTime = zazataoPayTime;
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

	public String getDescribes() {
		return describes;
	}

	public void setDescribes(String describes) {
		this.describes = describes;
	}

	public String getCellDate() {
		return cellDate;
	}

	public void setCellDate(String cellDate) {
		this.cellDate = cellDate;
	}

	public String getInStoreRoomDate() {
		return inStoreRoomDate;
	}

	public void setInStoreRoomDate(String inStoreRoomDate) {
		this.inStoreRoomDate = inStoreRoomDate;
	}

	public Currency getCurrency() {
		return currency;
	}

	public void setCurrency(Currency currency) {
		this.currency = currency;
	}

	public String getSellerDate() {
		return sellerDate;
	}

	public void setSellerDate(String sellerDate) {
		this.sellerDate = sellerDate;
	}

	public String getCommSpec() {
		return commSpec;
	}

	public void setCommSpec(String commSpec) {
		this.commSpec = commSpec;
	}

	public Shop getSeller() {
		return seller;
	}

	public void setSeller(Shop seller) {
		this.seller = seller;
	}

	public StoreRoom getStoreRoom() {
		return storeRoom;
	}

	public void setStoreRoom(StoreRoom storeRoom) {
		this.storeRoom = storeRoom;
	}

	public String getNameOfGoods() {
		return nameOfGoods;
	}

	public void setNameOfGoods(String nameOfGoods) {
		this.nameOfGoods = nameOfGoods;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public List<ImagePath> getImagePaths() {
		return imagePaths;
	}

	public void setImagePaths(List<ImagePath> imagePaths) {
		this.imagePaths = imagePaths;
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

	public CommoidityStatus getStatus() {
		return status;
	}

	public void setStatus(CommoidityStatus status) {
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

	public ShopCategory getShopcategory() {
		return shopcategory;
	}

	public void setShopcategory(ShopCategory shopcategory) {
		this.shopcategory = shopcategory;
	}
	

}
