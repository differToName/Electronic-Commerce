/**
 * 
 */
package com.brsc.ecommerceSys.utils;

import java.util.Collection;

/**
 * @author joeyang ong
 *
 */
public class Page {
	
    private Integer pageNo;    //当前页号，第几页  *
    private Integer pageSize;  //每页记录条数 *
    private Boolean nextPage;  //是否有下一页
    private Boolean prePage;   //是否有上一页
    private Long totalRecNum;  //总共有多少条记录（页面关联查询下总共记录）*
    private Integer totalPageNum;//总共有多少页
    private Collection pageContent; //该页的数据（记录明细） *
    private Integer startIndex; //记录位置开始位置
    private Integer endIndex;   //记录结束位置
        
	public Page() {
		super();
        pageNo=1;//当前页号为1，第一页
        pageSize=4;//每页记录条数为5条
	}
	
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	/**是否存在下一页*/
	public Boolean getNextPage() {
		//当前页号是不是小于总的页数，是就存在
		return pageNo<getTotalPageNum()?true:false;
	}
	/**是否有上一页*/
	public Boolean getPrePage() {
		//当前页码大于1吗，是就存在上一页
		return pageNo>1?true:false;
	}

	public Long getTotalRecNum() {
		return totalRecNum;
	}
	public void setTotalRecNum(Long totalRecNum) {
		this.totalRecNum = totalRecNum;
	}
	//获得总共页数
	public Integer getTotalPageNum() {
		//查询条件下总的记录数/每页记录数是否取整，不是整数则加一
		return totalRecNum%pageSize>0?(int)(totalRecNum/pageSize+1):(int)(totalRecNum/pageSize);
	}

	public Collection getPageContent() {
		return pageContent;
	}
	
	public void setPageContent(Collection pageContent) {
		this.pageContent = pageContent;
	}
	
    //获取开始范围
	public int getStartIndex()
	{//开始范围就是当前页号-1乘以每页大小，mysql中以0开始
		return pageSize*(pageNo-1);  // size:10 pageno:3   21
	}
	//获取结束范围，例如共10条记录，每页4条，1页：1-4，2页：5-8，3页：9-12，记录不可能超过10
	public int getEndIndex()
	{
		//结束范围:就是每页大小   X  当前页号是否大于总记录数，是则返回真实总记录数，否则返回相乘结果
		return (pageSize*pageNo>this.totalRecNum)? (int)(this.totalRecNum.longValue()):(pageSize*pageNo);
	}

}
