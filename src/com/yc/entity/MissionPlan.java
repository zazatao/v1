package com.yc.entity;

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

import com.yc.entity.user.Personnel;

//任务计划
@Entity
@DiscriminatorValue("missionPlan")
public class MissionPlan {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column
	private String missionName;//名称
	
	@ManyToOne
    @JoinColumn(name = "from_personnel")
	private Personnel  fromPer;//来自谁
	
	@ManyToOne
	@JoinColumn(name = "to_personnel")
	private Personnel  toPer;//给谁
	
	@Column
	private Double  usingTime;//用时
	
	@Column
	@Enumerated(EnumType.STRING)
	private Period period;//期
	
	@Column
	private String remarks;//备注
	
	@Column
	@Enumerated(EnumType.STRING)
	private AdvState advState;//状态
	
	@Column
	private String compLine;//完成度
	
	@Column
	private PositiveOrNo  positiveOrNo;//积极否
	
	@Column
	private boolean accelerate = false  ;//加速
	
	@Column
	private String endDate;//结束日期

	public Double getUsingTime() {
		return usingTime;
	}

	public void setUsingTime(Double usingTime) {
		this.usingTime = usingTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMissionName() {
		return missionName;
	}

	public void setMissionName(String missionName) {
		this.missionName = missionName;
	}

	public Personnel getFromPer() {
		return fromPer;
	}

	public void setFromPer(Personnel fromPer) {
		this.fromPer = fromPer;
	}

	public Personnel getToPer() {
		return toPer;
	}

	public void setToPer(Personnel toPer) {
		this.toPer = toPer;
	}

	public Period getPeriod() {
		return period;
	}

	public void setPeriod(Period period) {
		this.period = period;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public AdvState getAdvState() {
		return advState;
	}

	public void setAdvState(AdvState advState) {
		this.advState = advState;
	}

	public String getCompLine() {
		return compLine;
	}

	public void setCompLine(String compLine) {
		this.compLine = compLine;
	}

	public PositiveOrNo getPositiveOrNo() {
		return positiveOrNo;
	}

	public void setPositiveOrNo(PositiveOrNo positiveOrNo) {
		this.positiveOrNo = positiveOrNo;
	}

	public boolean isAccelerate() {
		return accelerate;
	}

	public void setAccelerate(boolean accelerate) {
		this.accelerate = accelerate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
}
