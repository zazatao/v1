
package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.yc.entity.user.User;

@Entity
@DiscriminatorValue("address")
public class Address {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
    @Column
    private String provience = ""; // 省：新疆
    @Column
    private String city = "";// 市：乌鲁木齐
    @Column
    private String district = "";// 区：新市区
    @Column
    private String street = "";// 街道：天津路
    @Column
    private String streetNo = "";// 街道号码：10号
    @Column
    private String place = "";// 小区名称：电信小区
    @Column
    private String building = "";// 楼号：3号楼
    @Column
    private String unit = "";// 单元号：2单元
    @Column
    private String room = "";// 房间号：1002
    @ManyToOne
	@JoinColumn(name = "user_id")
    private User user;
    
    public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getProvience() {
        return provience;
    }

    public void setProvience(String provience) {
        this.provience = provience;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getStreetNo() {
        return streetNo;
    }

    public void setStreetNo(String streetNo) {
        this.streetNo = streetNo;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getAddress() {
        return provience + city + district + street + streetNo + place + building + unit + room;
    }

    public String toString() {
        return provience + city + district + street + streetNo + place + building + unit + room;
    }

}
