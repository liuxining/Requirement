package domain;

public class PagingBean {
	private int totalPage;
	private int totalCount;
	private int currentPage;
	private int pageSize;
	private String preUrl;
	private boolean isAnd;
	private String htmlMsg;
	private boolean isJson;
	
	
	

	public String getHtmlMsg() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("共<strong class='redFont'>" + this.getTotalCount() + "</strong>条");
		buffer.append(",当前第<strong class='redFont'>" + (this.getCurrentPage() + 1) + "</strong>页");
		buffer.append("/共<strong class='redFont'>" + this.getTotalPage() + "</strong>页");
		if(this.getCurrentPage() <= 0){
			//无上一页
			buffer.append("&nbsp;&nbsp;&nbsp;&nbsp;<strong class='redFont'><a href='javascript:void(0)'>上一页</a></strong>");
		}
		else{
			buffer.append("&nbsp;&nbsp;&nbsp;&nbsp;<strong class='redFont'><a href='" + this.getPreUrl() + "&currentPage=" + (this.getCurrentPage() - 1) + "'>上一页</a></strong>");
		}
		if(this.getTotalPage() - 1 == this.getCurrentPage()){
			//无下一页
			buffer.append("&nbsp;&nbsp;&nbsp;&nbsp;<strong class='redFont'><a href='javascript:void(0)'>下一页</a></strong>");
			
		}
		else{
			
			buffer.append("&nbsp;&nbsp;&nbsp;&nbsp;<strong class='redFont'><a href='" + this.getPreUrl() + "&currentPage=" + (this.getCurrentPage() + 1) + "'>下一页</a></strong>");
		}
		return buffer.toString();
	}

	public void setHtmlMsg(String htmlMsg) {
		this.htmlMsg = htmlMsg;
	}
	
	

	public boolean isJson() {
		return isJson;
	}

	public void setJson(boolean isJson) {
		this.isJson = isJson;
	}

	public PagingBean(int totalCount,int currentPage, int pageSize) {
		this.totalCount = totalCount;
		this.totalPage = (totalCount - 1) / pageSize + 1;
		
		if(currentPage >= this.totalPage){
			currentPage = this.totalPage - 1;
		}
		if(currentPage < 0){
			currentPage = 0;
		}
		this.currentPage = currentPage;
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getPreUrl() {
		return preUrl;
	}

	public void setPreUrl(String preUrl) {
		this.preUrl = preUrl;
	}

	public boolean isAnd() {
		return isAnd;
	}

	public void setAnd(boolean isAnd) {
		this.isAnd = isAnd;
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
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public String toString() {
		return "PagingBean [totalPage=" + totalPage + ", totalCount=" + totalCount + ", currentPage=" + currentPage
				+ ", pageSize=" + pageSize + ", preUrl=" + preUrl + ", isAnd=" + isAnd + ", htmlMsg=" + htmlMsg + "]";
	}

		
	

}
