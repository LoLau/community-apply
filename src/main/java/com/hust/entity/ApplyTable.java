package com.hust.entity;

public class ApplyTable {
	
	private int apply_table_Id;
	private String apply_pos;
	
	public ApplyTable(){}
	
	
	public ApplyTable(int apply_table_Id, String apply_position) {
		super();
		this.apply_table_Id = apply_table_Id;
		this.apply_pos = apply_position;
	}
	
	
	public int getApply_table_Id() {
		return apply_table_Id;
	}
	public void setApply_table_Id(int apply_table_Id) {
		this.apply_table_Id = apply_table_Id;
	}


	public String getApply_pos() {
		return apply_pos;
	}


	public void setApply_pos(String apply_pos) {
		this.apply_pos = apply_pos;
	}
	 
	
	
}
