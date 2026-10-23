package com.kosta.board.dto;

public class Member {
	private String id;
	private String name;
	private String password;
	private String email;
	private String address;
	private String detailAddress;
	private String postcode;
	private String profile;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Member(String id, String name, String password, String email, String address, String detailAddress,
			String postcode, String profile) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.address = address;
		this.detailAddress = detailAddress;
		this.postcode = postcode;
		this.profile = profile;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	
	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", password=" + password + ", email=" + email + ", address="
				+ address + ", detailAddress=" + detailAddress + ", posdcode=" + postcode + ", profile=" + profile
				+ "]";
	}	
}
