

(function(){
	document.addEventListener("DOMContentLoaded", function(){
		console.log("Spring JS Loaded!");
	})
})();

async function startApp() {
    let result = await getFetchAjax('/shop/homeAjax');
    bannerInit(result.bannerFileVOList);
	myArtistInit(result.communityProfileVOList);
	
	console.log(result);
	
	pageInit(result.pageUtil);
	
	//Button eventListener
	let pageBtn = document.querySelectorAll("#prev,#next");
	
	pageBtn.forEach( function( btn, index){
		btn.addEventListener("click", function(e) {
			moveToPage(e.currentTarget);
		});
	})
}

function bannerInit(bannerFileVOList) {
	let indicatorBox = document.getElementById("carousel-indicators");
	let innerBox = document.querySelector(".carousel-inner");

	let innerTemplate = document.getElementById("carousel-inner-template");
	let bannerTemplate = document.getElementById("banner-template");
	
	// 초기화
	indicatorBox.innerHTML = "";
	innerBox.innerHTML = "";
	
	datas = [
		"<h2>2025 RIIZE WE LITTLE RIIZE</h2><p>POP UP 2차 공식 상품 예약 판매</p>",
		"<h2>2025 NCT WISH The 2nd Mini Album</h2><p>[poppop] 공식 상품 예약 판매</p>",
		"<h2>WOW MEMBERSHIP RENEWAL!</h2><p>지금 바로 확인하세요</p>"
	]
	
	bannerFileVOList.forEach( function ( vo, index ) {
		// indicatorBox Button 생성
		let btnClone = bannerTemplate.content.cloneNode(true); //return #document-fragment
		let btn = btnClone.querySelector("button");
		
		if(index == 0){
			btn.setAttribute("class", "active");
		}
		
		btn.setAttribute("data-bs-slide-to", index);
		btn.setAttribute("aria-label", 'Slide ' + index);
		
		// inner Item 생성
		let itemClone = innerTemplate.content.cloneNode(true);
		let itemDiv = itemClone.querySelector(".carousel-item");
		let img = itemDiv.querySelector("img");
		let caption = itemDiv.querySelector(".carousel-inner-item");
		
		img.setAttribute("src", "/upload" + vo.fileGroupVO.fileDetailVOList[0].fileSaveLocate);
		
		if(index == 0) {
			itemDiv.setAttribute("class", "carousel-item active");
		}
		
		caption.innerHTML = datas[index];
		
		indicatorBox.appendChild(btn);
		innerBox.appendChild(itemDiv);
		
	})
}

function myArtistInit(communityProfileVOList){
	
	let myArtisHeader = document.querySelector(".artist-header");
	
	if(!communityProfileVOList){
		myArtisHeader.innerText = "My Artist";
	}else{
		myArtisHeader.innerText = "Recommended Artist";
	}
	
	let artistTitleBox = document.querySelector("#artist-title");
	let artistTitleTemplate = artistTitleBox.querySelector("#artist-title-template")
	
	artistTitleBox.innerHTML = "";
	
	communityProfileVOList.forEach( function(communityProfileVO, index) {
		let artistTitleClone = artistTitleTemplate.content.cloneNode(true);
		let artstCardBox = artistTitleClone.querySelector(".card.artist-card");
		let artstCardBodyBox = artistTitleClone.querySelector(".card-body");
		
		artstCardBox.innerHTML = 
		`<a href="/shop/artistGroup?artGroupNo=${communityProfileVO.artGroupNo}">
		   <img src="/upload${communityProfileVO.artistGroupVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}" 
		     class="img-fluid artist-avatar" alt="${communityProfileVO.artistGroupVO.fileGroupVO.fileDetailVOList[0].fileOriginalName}"/>
		</a>`
		
		artstCardBodyBox.innerHTML = `<h5 class="card-title card-title-home multiline-ellipsis-line1 mt-3">
									  ${communityProfileVO.artistGroupVO.artGroupNm}</h5>`
		
		artistTitleBox.appendChild(artistTitleTemplate);
		
		artstCardBox.appendChild(artstCardBodyBox);
		artistTitleBox.appendChild(artstCardBox);
	})
}

function pageInit(pageUtil){
	let totalPage = document.getElementById("totalPage");
	let totalPageSpan = document.getElementById("totalPageSpan");
	
	totalPage.value = pageUtil.totalPage;
	totalPageSpan.innerText = pageUtil.totalPage;
	
	let currentPage = document.getElementById("currentPage");
	let currentPageSpan = document.getElementById("currentPageSpan");
	
	currentPage.value = pageUtil.currentPage;
	currentPageSpan.innerText = pageUtil.currentPage;
	
	let prevBtn = document.getElementById("prev");
	prevBtn.setAttribute('disabled', 'disabled');
	
	if(pageUtil.totalPage == 1){
		let nextBtn = document.getElementById("next");
		nextBtn.setAttribute('disabled', 'disabled');
	}
}

async function moveToPage(e){
	
	let currentPageInput = document.getElementById("currentPage");
	let currentPageNum = currentPageInput.value;
	
	let prevBtn = document.getElementById("prev");
	let nextBtn = document.getElementById("next");
	
	let totalPage = document.getElementById("totalPage");
	
	let currentPageSpan = document.getElementById("currentPageSpan");
		
	if(e.id == "prev"){
		--currentPageNum;
	}
	
	else if(e.id == "next"){
		++currentPageNum;
	}
	
	currentPageInput.value = currentPageNum;	
	currentPageSpan.innerText = currentPageNum;
	
	if(currentPageInput.value == 1) {
		prevBtn.setAttribute('disabled', 'disabled');
	}
		
	else if(currentPageInput.value == totalPage.value){
		nextBtn.setAttribute('disabled', 'disabled');
	}
	
	else {
		prevBtn.removeAttribute('disabled', 'disabled');
		nextBtn.removeAttribute('disabled', 'disabled');
	}
		
	data = {
		"currentPage" : currentPageNum,
	}
	
	//Server로 전송하여 데이터 가져오기
	let result = await postFetchAjax("/shop/getCommunityProfileListAjax", data);
	myArtistInit(result.communityProfileVOList);
}

async function getFetchAjax(url) {
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`Response status: ${response.status}`);
    }
	
	return await response.json();
	
  } catch (error) {
    console.error(error.message);
	return [];
  }
}

async function postFetchAjax(url, data) {
  // Default options are marked with *
  const response = await fetch(url, {
    method: 'POST', // *GET, POST, PUT, DELETE, etc.
    headers: {
      'Content-Type': 'application/json'
      // 'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: JSON.stringify(data) // body data type must match "Content-Type" header
  });
  
  if (!response.ok) {
    throw new Error(`HTTP error! status: ${response.status}`);
  }
  
  return response.json(); // parses JSON response into native JavaScript objects
}
