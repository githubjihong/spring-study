package com.ohot.util;

public class PageUtil {
	
	int total;
	int blockSize;
	int totalPage;
	int currentPage;
	int startRow;
	int endRow;
	
	public PageUtil(int total, int blockSize, int currentPage) {
		this.total = total;
		this.blockSize = blockSize;
		this.currentPage = currentPage;
		this.totalPage = (int) Math.ceil((double) total / blockSize);
		
		if(totalPage < 1) {
			totalPage = 1;
		}
		
		setCurrentPage(currentPage);
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		this.startRow = ( (this.currentPage-1) * blockSize) + 1;
		this.endRow = startRow + blockSize-1;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	@Override
	public String toString() {
		return super.toString();
	}
}
