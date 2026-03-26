<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/main.css" />
<script src="${pageContext.request.contextPath}/shop/main.js"></script>
<link rel="icon" href="/images/oHoT_logo.png">
<title>oHoT Shop</title>

</head>
<body>
	<%@ include file="../shopHeader.jsp" %>
	
	<!-- banner 영역 -->
	<div id="banner" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators" id="carousel-indicators">
	    <template id="banner-template">
	   		<button type="button" data-bs-target="#banner" data-bs-slide-to="" class="" aria-current="true" aria-label="Slide"></button>
	    </template>
	  </div>
	  
	  <div class="carousel-inner carousel-inner-background">
	    <template id="carousel-inner-template">
	  	  <div class="carousel-item">
	        <div class="row carousel-inner-background">
	          <!-- 하나의 col 안에 이미지 + 텍스트 정렬 -->
	          <div class="col-12 d-flex align-items-center">
	            <!-- 왼쪽: 이미지 -->
	            <img src="" class="img-fluid" alt="banner image" />
	            <!-- 오른쪽: 텍스트 -->
	            <div class="carousel-inner-item">
	              <h2></h2>
	              <p></p>
	            </div>
	          </div>
	        </div>
	      </div>
	    </template>
	  </div>
	  
	  <!-- pre Button -->
	  <button class="carousel-control-prev" type="button" data-bs-target="#banner" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#banner" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Next</span>
	  </button>
	</div>
  	
  	<p><p><p>
  	
	<!-- My Artist -->
	<!-- row: 수평 정렬 -->
	<div class="row d-flex justify-content-center">
	  <div class="col-8 rounded-shadow">
	    <!-- header 영역 -->
	    <div class="artist-header"></div>
	  	
	  	<div class="card-group">
	      <div class="d-flex justify-content-start" id="artist-title">
	        <template id="artist-title-template">
	      	  <div class="card artist-card">
	            <a href="/shop/artistGroup?artGroupNo=">
	              <img src="/upload" class="img-fluid artist-avatar" alt=""/>
	            </a>
	            <div class="card-body text-center p-1">
	              <h5 class="card-title card-title-home multiline-ellipsis-line1 mt-3"></h5>
	            </div>
	          </div>
	        </template>
	      </div>
	    </div>
	    
	    <!-- Arist Page 영역 -->
	    <div class="d-flex justify-content-center">
	      <button id="prev" type="button" class="btn btn-sm arist-page">&lt;</button>
	      <div class="mx-3">
	      	  <input type="hidden" value="" id="totalPage">
	      	  <input type="hidden" value="" id="currentPage">
		      <span id="currentPageSpan"></span>
		      <span>/</span>
		      <span id="totalPageSpan"></span>
	      </div>
	      <button id="next" type="button"class="btn btn-sm arist-page">&gt;</button>
	    </div>
	  </div>
	</div>
  	
  	<p><p><p>
  	
  	<div class="d-flex justify-content-center">
	  <div class="col-8">
	    <div class="card rounded-shadow shadow-lg">
	      <!-- 🔹 카드 헤더 (탭 버튼 포함) -->
	      <div class="card-header p-0">
	        <ul class="nav nav-tabs d-flex w-100" id="myTab" role="tablist">
	          <li class="nav-item flex-fill text-center" role="presentation">
	            <button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#goods"
	                    type="button" role="tab" aria-controls="home" aria-selected="true">
	              굿즈샵
	            </button>
	          </li>
	          <li class="nav-item flex-fill text-center" role="presentation">
	            <button class="nav-link w-100" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile"
	                    type="button" role="tab" aria-controls="profile" aria-selected="false">
	              공연/예매티켓
	            </button>
	          </li>
	        </ul>
	      </div>
	
	      <!-- 카드 바디 (탭 콘텐츠 포함) -->
	      <div class="card-body">
	        <div class="tab-content" id="myTabContent">
	        <!-- 굿즈샵 탭 -->
	        <div class="tab-pane fade show active" id="goods" role="tabpanel" aria-labelledby="goods">
	          <div class="card">
	            <!-- template 영역 -->
			  </div>
	        </div>
			  
			  <template id="card-header-template">
				  <div class="card-header">
			        <!-- 그룹 헤더 -->
			        <div class="d-flex flex-column">
			          <a href="">
					    <span class="header-badge mb-2">Now</span>
					    <h3 class="artist-groupName text-left"></h3>
					  </a>
				    </div>
			      </div>			    
			    </template>
				
				<template id="card-body-template">
			      <div class="card-body">
				    <div class="d-flex flex-wrap gap-3 pt-3">
			          <div class="custom-card">
			            <!-- 이미지 -->
			            <a href="/shop/artistGroup/${artistGroupVO.artGroupNo}/detail/${goodsVO.gdsNo}">
			              <img class="card-img-top img-fluid" src="/upload/${goodsVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}" 
			               onerror=this.src='/images/noImage.png' alt="굿즈 이미지">
			            </a>
			          </div>
			        </div>
			        
			        <div class="custom-card-text">
				      <h5 class="card-title multiline-ellipsis-line1">${goodsVO.gdsNm}</h5><br>
				      <p class="card-price text-left">
				        ₩ <fmt:formatNumber value="${goodsVO.unitPrice}" pattern="#,###" />
				      </p>
				    </div>
			      </div>
			    </template>
			  
	        <!-- 공연/예매/티켓 탭 -->
	        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
	          <%@ include file="ticketList.jsp" %>
	        </div>
	      </div>
	      
	      <!-- Weverse by Fans 영역 -->
	      <div class="card" id="weverse">
	      	<!-- template 영역 -->
		  </div>
			
		  <template id="card-weverse-template">
	        <div class="card-header pretty-sky">
			  <!-- 그룹 헤더 -->
			  <div class="d-flex flex-column">
				<h4 class="text-left card-weverse-header">Weverse</h4>
				<h5 class="text-left card-weverse-header">by Fans</h5>
				<h6 class="text-left card-weverse-header">Make your own offcial merch!</h6>
			  </div>
			</div>
	      </template>
			  
		  <template id="card-weverse-body-template">
			<div class="card-body">
			  <div class="d-flex flex-wrap gap-3 pt-3">
			    <div class="custom-card">
			      <!-- 이미지 -->
			      <a href="/shop/artistGroup/${artistGroupVO.artGroupNo}/detail/">
			        <img class="card-img-top img-fluid" src="/upload/" 
			         onerror=this.src='/images/noImage.png' alt="굿즈 이미지">
			      </a>
			    </div>
			  </div>
			        
			  <div class="custom-card-text">
			    <h5 class="card-title multiline-ellipsis-line1"></h5><br>
				<p class="card-price text-left">
				 ₩ <fmt:formatNumber value="" pattern="#,###" />
				</p>
		      </div>
			</div>
	      </template>
			
	      </div> <!-- 카드 바디 끝 -->
	    </div> <!-- 카드 끝 -->
	  </div>
	</div>
	<p><p><p>
  	
	<%@ include file="../shopfooter.jsp" %>
		
	<!-- Scroll Top -->
	<a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center active">
		<i class="bi bi-arrow-up-short"></i>
	</a>	
</body>

<script type="text/javascript">

document.addEventListener("DOMContentLoaded", () => {
    startApp();
});

</script>
</html>