package com.site.ex.dto;

import java.sql.Timestamp;

public class EventDto {
	
	public EventDto(){}
	
	public EventDto(String id, String etitle, String econtent, Timestamp startdate, Timestamp enddate, String estate,
			String efilename, String efilename2) {
		this.id = id;
		this.etitle = etitle;
		this.econtent = econtent;
		this.startdate = startdate;
		this.enddate = enddate;
		this.estate = estate;
		this.efilename = efilename;
		this.efilename2 = efilename2;
	}

	public EventDto(int eid, String id, String etitle, String econtent, Timestamp startdate, Timestamp enddate,
			String estate, String efilename, String efilename2) {
		this.eid = eid;
		this.id = id;
		this.etitle = etitle;
		this.econtent = econtent;
		this.startdate = startdate;
		this.enddate = enddate;
		this.estate = estate;
		this.efilename = efilename;
		this.efilename2 = efilename2;
	}

	public EventDto(int eid, String id, String etitle, String econtent, Timestamp edate, Timestamp startdate,
			Timestamp enddate, String estate, String efilename, String efilename2) {
		this.eid = eid;
		this.id = id;
		this.etitle = etitle;
		this.econtent = econtent;
		this.edate = edate;
		this.startdate = startdate;
		this.enddate = enddate;
		this.estate = estate;
		this.efilename = efilename;
		this.efilename2 = efilename2;
	}

	private int eid;
	private String id;
	private String etitle;
	private String econtent;
	private Timestamp edate;
	private Timestamp startdate;
	private Timestamp enddate;
	private String estate;
	private String efilename;
	private String efilename2;
	
	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEtitle() {
		return etitle;
	}

	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}

	public String getEcontent() {
		return econtent;
	}

	public void setEcontent(String econtent) {
		this.econtent = econtent;
	}

	public Timestamp getEdate() {
		return edate;
	}

	public void setEdate(Timestamp edate) {
		this.edate = edate;
	}

	public Timestamp getStartdate() {
		return startdate;
	}

	public void setStartdate(Timestamp startdate) {
		this.startdate = startdate;
	}

	public Timestamp getEnddate() {
		return enddate;
	}

	public void setEnddate(Timestamp enddate) {
		this.enddate = enddate;
	}

	public String getEstate() {
		return estate;
	}

	public void setEstate(String estate) {
		this.estate = estate;
	}

	public String getEfilename() {
		return efilename;
	}

	public void setEfilename(String efilename) {
		this.efilename = efilename;
	}
	public String getEfilename2() {
		return efilename2;
	}
	public void setEfilename2(String efilename2) {
		this.efilename2 = efilename2;
	}
	
	

}
