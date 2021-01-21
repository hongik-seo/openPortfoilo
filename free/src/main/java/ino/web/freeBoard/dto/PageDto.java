package ino.web.freeBoard.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.beans.factory.annotation.Autowired;


public class PageDto  {

	
	
	private int realEnd;
	
	private int startPage;
	
	private int endPage;
	
	private boolean prev, next;
	
	private int total;
	
	private int pageNum;
	
	private int amount;
	
	private int currentPage;

	public PageDto(int pageNum,int amount,int total){
		
		this.pageNum=pageNum;
		
		this.amount=amount;
		
		this.total=total; 
		
		this.endPage= (int)(Math.ceil(pageNum/10.0))*10; //10
		
		this.startPage=this.endPage-9;//1
		
		this.currentPage=pageNum;
		
		this.realEnd=(int)(Math.ceil((total*1.0)/amount));
		
		
		if(this.endPage>this.realEnd){
			
			this.endPage=this.realEnd;
			
		}
		
		this.prev=this.startPage>1;
		
		this.next=this.endPage<this.realEnd;
	}

	


	public int getRealEnd() {
		return realEnd;
	}


	public void setRealEnd(int realEnd) {
		this.realEnd = realEnd;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public boolean isPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}




	public int getPageNum() {
		return pageNum;
	}




	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}




	public int getAmount() {
		return amount;
	}




	public void setAmount(int amount) {
		this.amount = amount;
	}




	public int getCurentPage() {
		return currentPage;
	}




	public void setCurentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	

	
}
