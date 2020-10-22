package com.nanam.memberDB;



import java.sql.Timestamp;

public class Member {
	

	private String name;
	private	String id;
	private	String pwd;
	private	String pwdFind;
	
	private	String email;
	private	String phone;
	private	String use;
	private	Timestamp indate;
	private	int point;
	private	String zipcode;
	private	String address;
	private	String detailAddress;
	private	String adjustIndate;
	private String leaveout;
	
	private String product;

	private String bookNum;
	
	
	
	
	
	public String getBookNum() {
		return bookNum;
	}

	public void setBookNum(String bookNum) {
		this.bookNum = bookNum;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public Member() {}
	
	public Member(String id,int point, String phone) {
		
		this.id=id;
		this.point=point;
		this.phone=phone;
	}
	
	
	public Member(String name,String id,String pwd,String pwdFind,String phone,String email,String zipcode,String address,String detailAddress){
		this.name=name;
		this.id=id;
		this.pwd=pwd;
		this.pwdFind=pwdFind;
		this.email=email;
		this.phone=phone;
		this.zipcode=zipcode;
		this.detailAddress=detailAddress;
		this.address=address;
	}

	public Member(String pwd,String pwdFind, String phone,String email,String zipcode,String address,String detailAddress) {
		this.pwd=pwd;
		this.pwdFind=pwdFind;
		this.email=email;
		this.phone=phone;
		this.address=address;
		this.zipcode=zipcode;
		this.detailAddress=detailAddress;
		
	}

	public Member(String id, String pwd) {
		this.id=id;
		this.pwd=pwd;
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPwdFind() {
		return pwdFind;
	}

	public void setPwdFind(String pwdFind) {
		this.pwdFind = pwdFind;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUse() {
		return use;
	}

	public void setUse(String use) {
		this.use = use;
	}

	public Timestamp getIndate() {
		return indate;
	}

	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getAdjustIndate() {
		return adjustIndate;
	}

	public void setAdjustIndate(String adjustIndate) {
		this.adjustIndate = adjustIndate;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getLeaveout() {
		return leaveout;
	}

	public void setLeaveout(String leaveout) {
		this.leaveout = leaveout;
	}

	
}
