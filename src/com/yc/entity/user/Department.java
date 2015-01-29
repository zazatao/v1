package com.yc.entity.user;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.yc.entity.Shop;


@Entity
@DiscriminatorValue("department")//部门
public class Department {
	
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;//部门ID
    
    @Column(length=32)
	private String departmentname;//部门名称
    
    @ManyToOne
    @JoinColumn(name = "shop_id")
    private Shop shop;
    
    @OneToMany(mappedBy = "department")
    private List<Position> positions; 
    
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	public List<Position> getPositions() {
		return positions;
	}
	public void setPositions(List<Position> positions) {
		this.positions = positions;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDepartmentname() {
		return departmentname;
	}
	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}


}
