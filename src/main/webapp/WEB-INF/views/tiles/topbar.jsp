<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!-- Topbar Start -->
<script type="text/javascript">
var memberId = localStorage.getItem('id');

if (memberId == null || memberId == "") {
	alert("로그인이 필요한 서비스 입니다.")
	location.href = '/login'
};
</script>
<style>
#widget-memo {
    background: #FBF9C6;
    padding-right: 0px;
    padding-left: 0px;
}
#memoTextArea {
    width: 100%;
    height: 120px;
    overflow: auto;
    background-color: #FBF9C6;
    color: black;
    border: none;
}
#memoTextArea:focus {
    outline: none;
}

#dustbin {
    /* background-image: url("/assets/images/dustbin.PNG"); */
}
.handle {
    cursor: pointer;
}

</style>
<div class="navbar-custom">
    <div class="container-fluid">
        <ul class="list-unstyled topnav-menu float-end mb-0">
    
            <li class="dropdown d-inline-block d-lg-none">
                <a class="nav-link dropdown-toggle arrow-none waves-effect waves-light" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <i class="fe-search noti-icon"></i>
                </a>
                <div class="dropdown-menu dropdown-lg dropdown-menu-end p-0">
                    <form class="p-3">
                        <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                    </form>
                </div>
            </li>
    
            <li class="dropdown d-none d-lg-inline-block">
                <a class="nav-link dropdown-toggle arrow-none waves-effect waves-light" data-toggle="fullscreen" href="#">
                    <i class="fe-maximize noti-icon"></i>
                </a>
            </li>
            <li class="dropdown block">
                <a class="nav-link dropdown-toggle arrow-none waves-effect waves-light"  href="/data/myDataMain">
                		 
                		<span class = " position-relative">
                		 <img alt="" src="/assets/images/mydata.png" width="30"  class= " position-relative"> 
                            
                       </span> 
              </a>
            </li>
            <!-- 쪽지 -->
            <li class="dropdown block">
                <a class="nav-link dropdown-toggle arrow-none waves-effect waves-light"  href="/letter/home">
                		 
                		<span class = " position-relative">
                		 <img alt="" src="/assets/images/paper-plane.png" width="30"  class= " position-relative"> 
                		 <span id = "tobbarLetterCnt"class="chkletterinit position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                            
                           <span class="visually-hidden">unread messages</span>
                       </span> 
                       </span>
              </a>
            </li>
            <!-- 위젯 -->
            <li class="dropdown block">
                <a class="nav-link dropdown-toggle arrow-none waves-effect waves-light" href="javascript: drops();">
                		 <img alt="" src="/assets/images/widget-icon.png" width="30"  class= "position-relative"> 
                </a>
            </li>
    		<!-- 알람 -->
            <li class="dropdown notification-list topbar-dropdown" id="notification1">
                <a class="nav-link dropdown-toggle waves-effect waves-light" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <img alt="" src="/assets/images/bell.png" width="30"  class= " position-relative">
                    <span class="badge bg-danger rounded-circle noti-icon-badge" id="alarmCnt_O">0</span>
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-lg">
    
                    <!-- item-->
                    <div class="dropdown-item noti-title">
                        <h4 class="m-0">
                            <span class="float-end">
                                <a href="javascript:void(0)" class="text-dark" onclick="clearAllAlarm()">
                                    <span style="font-size: 13px;font-weight: bold">지우기</span>
                                </a>
                            </span><strong>알림 <i class="fe-bell"></i></strong>
                        </h4>
                    </div>
    
                    <div class="noti-scroll" data-simplebar >
    					
    					<div id="alarm22">
                        <!-- item-->
                       		<div style="text-align:center;"> 
			  			 	<p class="notify-details" id="noAlarm"></p>
			 				 </div>
                        </div>
                        
                    </div>
    
                    <!-- All-->
                    <a href="javascript:showAllAlarms();" class="dropdown-item text-center text-primary notify-item notify-all">
                        <strong style="font-size: 1.05em">모두 보기</strong>
<!--                         <i class="fe-arrow-right"></i> -->
                    </a>
    
                </div>
            </li>
    
            <li class="dropdown notification-list topbar-dropdown">
                <a class="nav-link dropdown-toggle nav-user me-0 waves-effect waves-light" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false" id="myProfileImg">
<%--                     	<img src="${pageContext.request.contextPath }/resources/dist/assets/images/users/blank_progile.png" alt="user-image" class="rounded-circle"> --%>
<!--                     <span class="pro-user-name ms-1"> -->
<!--                       <i class="mdi mdi-chevron-down"></i>  -->
<!--                     </span> -->
                </a>
                <div class="dropdown-menu dropdown-menu-end profile-dropdown ">
                    <!-- item-->
    
                    <!-- item-->
                    <a href="/mypage/home" class="dropdown-item notify-item">
                        <i class="fe-user"></i>
                        <span>My Page</span>
                    </a>
    
                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fe-lock"></i>
                        <span>Lock Screen</span>
                    </a>
    
                    <div class="dropdown-divider"></div>
    
                    <!-- item-->
                    <a href="#" class="dropdown-item notify-item" onclick="logout_H();">
                        <i class="fe-log-out"></i>
                        <span>Logout</span>
                    </a>
    
                </div>
            </li>
    
            <li class="dropdown notification-list">
                <a href="javascript:void(0);" class="nav-link right-bar-toggle waves-effect waves-light">
                    <i class="fe-settings noti-icon"></i>
                </a>
            </li>
    
        </ul>
    
        <!-- LOGO -->
        <div class="logo-box">
            <a href="/myhome/home" class="logo logo-dark text-center">
                <span class="logo-sm">
                    <img src="${pageContext.request.contextPath }/resources/dist/assets/images/logo-sm.png" alt="" height="25">
                    <!-- <span class="logo-lg-text-light">Codefox</span> -->
                </span>
                <span class="logo-lg">
                    <img src="${pageContext.request.contextPath }/resources/dist/assets/images/logo-dark.png" alt="" height="25">
                    <!-- <span class="logo-lg-text-light">U</span> -->
                </span>
            </a>
    
            <a href="/myhome/home" class="logo logo-light text-center">
                <span class="logo-sm">
                    <img src="${pageContext.request.contextPath }/resources/dist/assets/images/logo-sm.png" alt="" height="25">
                </span>
                <span class="logo-lg">
                    <img src="${pageContext.request.contextPath }/resources/dist/assets/images/logo-light.png" alt="" height="25">
                </span>
            </a>
        </div>

		<ul
			class="list-unstyled topnav-menu topnav-menu-left m-0">
			<li>
				<button class="button-menu-mobile waves-effect waves-light">
					<i class="fe-menu"></i>
				</button>
			</li>
			
			<li>
			    <!--프로젝트 이름   -->
				<div class ="mt-2 ms-1"id="topbarProName"></div>
			</li>
			<li class="dropdown dropdown-mega d-none d-xl-block">
			<!-- <a
                class="nav-link dropdown-toggle waves-effect waves-light"
                data-bs-toggle="dropdown" href="#" role="button"
                aria-haspopup="false" aria-expanded="false" id="dropA"> Mega Menu <i
                    class="mdi mdi-chevron-down"></i>
            </a> -->
                <div class="dropdown-menu dropdown-megamenu" id="widget-dropdown">
                    <div class="row">
                        <div class="col-sm-9">
                            <!-- 위젯 공간  -->
						        <div class="" id="icon-widget"> <!--  style="display: flex; flex-direction: row;" -->
						            <!-- <div class="card-body"></div> -->
						           <div id="widget-myList" class="container-widget row"></div>
						        </div>
						        
                        </div>
                        <div class="col-sm-1 text-center" style="padding-top: 15px;">
                          <p><h3 class="text-dark">위젯을</h3></p>
                          <p><h3 class="text-dark">추가해보세요!</h3></p>
                          
                          <button class="btn btn-primary rounded-pill mt-3" 
                                  onclick="clickAddWidget()"
                                  style="margin-top: 0.5rem!important;">
                                  위젯 추가
                          </button>
                        </div>
                        <div class="col-sm-2 text-center">
                          <div style="">
                            <div id="widget-time"></div>
                            <div style="margin-left: 10px;"> 
                              <button type="button" id="btnWidgetAdd" style="display: none;" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#bs-example-modal-lg">추가</button>
                            </div>
                          </div>
                                <div class="card-body" style="display: flex;">
                                    <div 
                                      class="container-widget-delete" 
                                      id="dustbin" 
                                      style="width: 100%; height: 120px; background-color: #C3C3C3; text-align: center;">
                                      <h3 class="">휴지통
                                        <div id="dustImage" style="width: 90px; height: 100px;"></div>
                                      </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                        <div class="row" id="addWidgetRow" style="display: none;">
                        <div class="col-sm-9" style="border-top: 2px solid #C1C1C1;">
                            <!-- 위젯 공간  -->
                                <div class="widget-container" id="widget-list" style="display: flex;"></div>
                        </div>
                        <div class="col-sm-1 text-center" style="padding-top: 15px;">
                          <img src="/assets/images/widget-boat.png" alt="image"
                                                        class="img-fluid rounded" width="200"/>
                        </div>
                        <div class="col-sm-2 text-center">
                        </div>
                    </div>

                </div>
                
                <!--  -->
                <!--  -->
                </li>
			

			<li>
				<!-- Mobile menu toggle (Horizontal Layout)--> <a
				class="navbar-toggle nav-link" data-bs-toggle="collapse"
				data-bs-target="#topnav-menu-content">
					<div class="lines">
						<span></span> <span></span> <span></span>
					</div>
			</a> <!-- End mobile menu toggle-->
			</li>
			<!-- 고객센터 -->
<!-- 			<li class="dropdown d-none d-xl-block"> -->
<!-- 			<a class="nav-link dropdown-toggle waves-effect waves-light" -->
<!-- 				data-bs-toggle="dropdown" href="#" role="button" -->
<!-- 				aria-haspopup="false" aria-expanded="false" style="color: white"> 고객센터 <i -->
<!-- 					class="mdi mdi-chevron-down"></i> -->
<!-- 			</a> -->
<!-- 				<div class="dropdown-menu"> -->
					
<!-- 					item -->
<!-- 					<a href="javascript:void(0);" class="dropdown-item"><i -->
<!-- 						class="mdi mdi-volume-high"></i> <span>&nbsp;공지사항</span> -->

<!-- 					item -->
<!-- 					<a href="/faq/faqMain" class="dropdown-item"> <i -->
<!-- 						class="mdi mdi-help-circle"></i> <span>&nbsp;FAQ</span> -->
				
<!-- 					item -->
<!-- 					<a href="/oneoone/question" class="dropdown-item"> <i -->
<!-- 						class="mdi mdi-headset"></i> <span>&nbsp;1:1문의</span> -->
<!-- 					</a> -->

<!-- 				</div></li> -->


		</ul>
		
		<div class="clearfix"></div>
    </div>

</div>
<!-- end Topbar -->

<!-- 위젯 추가 모달 -->
<!--  Modal content for the Large example -->
<div class="modal fade" id="bs-example-modal-lg" tabindex="-1" role="dialog"
    aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width: 20%;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myLargeModalLabel">Widget List</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id=""><!-- 위젯 리스트들 출력해주기 --></div>
                <div style="text-align: right;">
	                <button type="button" id="addWidget" class="btn btn-primary waves-effect waves-light" data-bs-dismiss="modal" aria-label="Close">추가하기</button>
	                <button type="button" id="" class="btn btn-danger waves-effect waves-light" data-bs-dismiss="modal" aria-label="Close">취소</button>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script>

var memberId = localStorage.getItem('id');
var memberToken = localStorage.getItem('token');
var alarmCount = document.getElementById("alarmCnt_O"); // 알람 갯수 표시등
var webSocketAlarm;
let myAlarmId;
//로그인시 memberVO 객체가 local에 저장됩니다. topbar에서 활용하세요
//위젯 선택리스트 모달에 뿌리기

//시작하자마자 실행할 것들  소캣으로 실시간알람으로 업그레이드할예정
$(function(){
	 //지형이  웹소켓 생성 
	 //지형이
    webSocketAlarm = new WebSocket("ws://192.168.144.3/ws-alarm");
	myAlarmId = localStorage.getItem("id");
	webSocketAlarm.onopen = () => {			
		//console.log(webSocketAlarm.readyState); // 1이면 연결된거임 
		refreshMyAlarm(myAlarmId); // 페이지 이동할때 마다  소켓에 다시 접속하므로 다른 WEBSESSION값이므로 
								   // 뒷단에 담아둔 MAP<String, webSession> 에 키값은 중복안되므로 값 갈아끼움
		webSocketAlarm.onmessage = aMessage;
	}

	checkletterCnt();
	//현재 안읽은 알람들 가져오는 method ojh 안에 갯수도 있음
	checkAlarm();
	
	
})

//view-all 눌렀을시에 해당 회원의 모든 알람들 다가져옴 
function showAllAlarms(){
	location.href = "/myhome/home";	
}

//실시간 알람 모두 읽음 처리하는 메서드
function clearAllAlarm(){
	var noAlarm = document.querySelector("#noAlarm");
	console.log("clearAllAlarm 접속");
	//여기서 내이름으로 된거 다 읽음 처리한다 
	var xhr = new XMLHttpRequest();
	let data =  {'memberId' : myAlarmId };
	xhr.open("post", '/alarm/deleteAllAlarm', true);
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){	
			document.querySelector("#alarm22").innerHTML ="";
			noAlarm.innerText = "실시간 알람이 없습니다";
			alarmCount.innerText = 0;
			checkAlarm();
		}
	};
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send(JSON.stringify(data));
}
function elapsedText(date) {
	// 초 (밀리초)
	const seconds = 1;
	// 분
	const minute = seconds * 60;
	// 시
	const hour = minute * 60;
	// 일
	const day = hour * 24;
	
	var today = new Date();
	var elapsedTime = Math.trunc((today.getTime() - date.getTime()) / 1000);
	
	var elapsedText = "";
	if (elapsedTime < seconds) {
		elapsedText = "방금 전";
	} else if (elapsedTime < minute) {
		elapsedText = elapsedTime + "초 전";
	} else if (elapsedTime < hour) {
		elapsedText = Math.trunc(elapsedTime / minute) + "분 전";
	} else if (elapsedTime < day) {
		elapsedText = Math.trunc(elapsedTime / hour) + "시간 전";
	} else if (elapsedTime < (day * 15)) {
		elapsedText = Math.trunc(elapsedTime / day) + "일 전";
	} else {
		elapsedText = Math.trunc(elapsedTime / day) + "일 전";
	}
	
	return elapsedText;
}

function proDetailInliveAlarm(proNo){
	var proVO = {
		proNo : proNo
	}
	
	let proName; // 빈객체 선언
	let proType;
	
	$.ajax({
		url:"/myhome/selectOneProjectFromTopbar",
		type: "post",
		data : JSON.stringify(proVO),
	    contentType : 'application/json; charset=utf-8',
	    async:false,
	    dataType : 'json',
	    success: function(res){
			proName = res.proName;
			proType = res.proType;
	    }
	})
	return  {
		proName,
		proType
	}
}	

// ojh
function checkAlarm(){
	//console.log("checkAlarm에 들어왔어용~");
	//여기서 해당 사람의 안읽은 알람들 가져온다
	
	//console.log("checkAlarm안의 memberId ",myAlarmId );
	var xhr = new XMLHttpRequest();
	let data =  {'memberId' : myAlarmId };
	xhr.open("post", '/alarm/getUnreadAlarm', true);
	let text = "";
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){	
			//console.log(JSON.parse(xhr.responseText));
			makeAlarm(JSON.parse(xhr.responseText)); //알람 구별해줘서 모양 만드는 곳 
		}
	};
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send(JSON.stringify(data));
}

//처음 접속했을 때나 실시간으로 받고있지 않을때 안읽은 알람들 모아놓은곳  ojh
function makeAlarm(json){
	var noAlarm = document.querySelector("#noAlarm");
	console.log("처음 접속했을 때나 실시간으로 받고있지 않을때 안읽은 알람들", json);
	var str = "";
	//console.log(json);
	//console.log("길이 :",json.length); // 이걸로 알람 갯수 만들수 있다 .
	var cnt = json.length;
	if(json.length == 0){
		noAlarm.innerText = "실시간 알람이 없습니다";
	}	
	
	for(i in json) {
	   var writeDate = new Date(json[i].alarmDate);
	   var timelaps = elapsedText(writeDate);
	   //console.log("경과 시간 ", timelaps);
	   
	   //console.log( i, "번째 데이터 ",json[i]);	    
	   //console.log( i, "번째 날짜 ",json[i].alarmDate);	
	   	
	   	//채팅방 초대 인경우 == 1 
	    if(json[i].alrTNo == "1"){	
	    	str += `<a href="javaScript:makeReadAlarm(\${json[i].alarmNo},\${json[i].alrTNo},'\${json[i].alarmData}','','')" class="dropdown-item notify-item">
        		<div class="notify-icon bg-info" style="padding-top:0.6%">	
        		<iconify-icon icon="ri:chat-new-line"></iconify-icon>
       				 </div>
       			  <p class="notify-details"> \${json[i].alarmSender}님이 \${json[i].alarmContent}<small class="text-muted"> \${timelaps} </small></p>
        		</a>`;  
	    }
	    //내글에 댓글 달렸을 때   devin 문의내역    
	    if(json[i].alrTNo == "2"){		    	
	    	str += `<a href="javaScript:makeReadAlarm(\${json[i].alarmNo},\${json[i].alrTNo},'\${json[i].alarmData}','\${json[i].alarmData2}', '')" class="dropdown-item notify-item">
        		<div class="notify-icon bg-success" style="padding-top:0.5%">
        		<iconify-icon icon="ic:baseline-reply"></iconify-icon>
       				 </div>
       			  <p class="notify-details">\${json[i].alarmSender}님이 \${json[i].alarmContent}
       			  <small class="text-muted">\${timelaps}</small></p>
        		</a>`;
	    }
	    
	    //좋아요 달렸을 때
	    if(json[i].alrTNo == "3"){	
	    	 str += `<a href="javaScript:makeReadAlarm(\${json[i].alarmNo},\${json[i].alrTNo},'\${json[i].alarmData}','\${json[i].alarmData2}','')" class="dropdown-item notify-item ">
	    			<div class="notify-icon bg-danger" style="padding-top:0.5%">
	    			<iconify-icon icon="ph:heart-fill"></iconify-icon>
    				 </div>
    			 <p class="notify-details">\${json[i].alarmContent}<small class="text-muted">\${timelaps}</small></p>
     		</a>`;    
	    }
	    
	    //프로젝트 관련 알림  
	    if(json[i].alrTNo == "4"){
		    let proNo = json[i].alarmData
		    let proInfo = proDetailInliveAlarm(proNo);
		    
		    let proType = proInfo.proType;
		    let proName = proInfo.proName;
		    
			let str1 = ""
			
		    if(proType== "WEB"){
				str1 += `<p class="badge badge-soft-pink rounded-pill" style="font-size:0.9em;margin-bottom:1%;"><iconify-icon icon="heroicons:window"></iconify-icon>
					\${proName}</p>`
			}else if(proType == "AI"){
				str1 += `<p class="badge badge-soft-warning rounded-pill" style="font-size:0.9em;margin-bottom:1%;"><iconify-icon icon="fluent:brain-circuit-24-regular"></iconify-icon></p>
					\${proName}`
			}else if(proType == "SISM"){
				str1 += `<p class="badge badge-soft-success rounded-pill" style="font-size:0.9em;margin-bottom:1%;"><iconify-icon icon="clarity:settings-line"></iconify-icon></p>
					\$proName}`
			}else if(proType == "APP"){
				str1 += `<p class="badge badge-soft-info rounded-pill" style="font-size:0.9em;margin-bottom:1%;"><iconify-icon icon="ri:apps-2-line"></iconify-icon></p>
					\${proName}`
			}else if(proType == "GAME"){
				str1 += `<p class="badge badge-soft-purple rounded-pill" style="font-size:0.9em;margin-bottom:1%;"><iconify-icon icon="carbon:game-wireless"></iconify-icon>
					\${proName}</p>`
			}else if(proType == "BIGDATA"){
				str1 += `<p class="badge badge-soft-secondary rounded-pill" style="font-size:0.9em;margin-bottom:1%;"><iconify-icon icon="carbon:db2-database"></iconify-icon></p>
					\${proName}`
			}
		    
	    str += `<a href="javaScript:makeReadAlarm(\${json[i].alarmNo},\${json[i].alrTNo},\${json[i].alarmData},'\${json[i].alarmData2}','\${json[i].alarmContent}')" class="dropdown-item notify-item ">
		    			<div class="notify-icon bg-purple">
		    				<iconify-icon icon="ri:team-fill"></iconify-icon>
	       				 </div>
		       			 <small class="text-muted">\${str1}&nbsp;&nbsp;\${timelaps}</small>
		       			 <p class="notify-details">\${json[i].alarmContent}
		       			 </p>
		       		</a>`;    
	    }
	  
	    //프로젝트 초대
	    if(json[i].alrTNo == "5"){	
	    	str += `<a href="javaScript:makeReadAlarm(\${json[i].alarmNo},\${json[i].alrTNo},\${json[i].alarmData},'\${json[i].memberId}','\${json[i].alarmContent}')" class="dropdown-item notify-item ">
	    		<div class="notify-icon bg-info">
        	   	<i class="mdi mdi-account-plus"></i>
       				 </div>
       			  <p class="notify-details"> \${json[i].alarmSender}님이 \${json[i].alarmContent}<small class="text-muted">\${timelaps}</small></p>
        		</a>`;   
	    }    
	    //쪽지      
	    if(json[i].alrTNo == "6"){	
	    	str += `<a href="javaScript:makeReadAlarm(\${json[i].alarmNo},\${json[i].alrTNo},'','','')" class="dropdown-item notify-item ">
        		<div class="notify-icon bg-warning">
       			<i class="mdi mdi-email-outline"></i>
       				 </div>
       			  <p class="notify-details"> \${json[i].alarmSender} 님으로부터 \${json[i].alarmContent}<small class="text-muted">\${timelaps}</small></p>
        		</a>`;     
	    }  // alrTNo == 6
	    
	} //end of loop
	
		alarmCount.textContent=cnt; // 알람 갯수 설정 
	
		$('#alarm22').prepend(str); 
}

//알람 눌렀을때 읽음 처리로 바꾸고 해당 링크로 이동하는 메서드
function makeReadAlarm(alarmNo, alrTNo, alarmData, alarmData2, alarmContent){
	
	console.log("alarmData : ", alarmData);
	var xhr = new XMLHttpRequest();
	let data =  {'alarmNo' : alarmNo };
	console.log(data);
	xhr.open("post", '/alarm/makeReadAlarm', true);
	let text = "";
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){	
			console.log(xhr.responseText);			
			//채팅방 초대
			if(alrTNo == '1'){
				location.href = "/chat/chatMain?roomId="+alarmData;
			}
			//개발자 지식인 댓글 달렸을때
			if(alrTNo == '2'){
				location.href = "/devin/devinList?devinId="+alarmData+"&devinOwner="+alarmData2;
			}
			// 좋아요 눌렀을 때
			if(alrTNo == '3'){
				location.href = "/devin/devinList?devinId="+alarmData+"&devinWriter=" + alarmData2;
			}	
			// 프로젝트 관련 메세지들 
			if(alrTNo == '4'){			
				if(alarmContent == "새로운 공지사항이 등록되었습니다."){
					location.href = "/project/home?proNo="+alarmData+"&proNoticeNo="+ alarmData2;
				}
				if(alarmContent == "새로운 상위작업이 등록되었습니다."){
					location.href = "/project/home?proNo="+alarmData+"&topWorkNo="+alarmData2;
				}
				if(alarmContent == "나의 상위작업에 댓글이 달렸습니다."){
					location.href = "/project/home?proNo="+alarmData+"&topWorkNo="+alarmData2;
				}
				if(alarmContent == "나의 하위작업이 댓글이 달렸습니다."){
					location.href = "/project/home?proNo="+alarmData+"&topWorkNo="+alarmData2;
				}
				if(alarmContent == "프로젝트 내 작업이 승인대기 상태입니다."){
					location.href = "/project/home?proNo="+alarmData+"&topWorkNo="+alarmData2;
				}
				if(alarmContent == "프로젝트 내 작업이 승인되었습니다."){
					location.href = "/project/home?proNo="+alarmData+"&topWorkNo="+alarmData2;
				}
				if(alarmContent == "프로젝트 내 작업이 반려되었습니다."){
					location.href = "/project/home?proNo="+alarmData+"&topWorkNo="+alarmData2;
				}
			}		
			//프로젝트 초대 되었을때
			if(alrTNo =='5'){
				location.href = "/projoin/inviteConrfirmPro?proNo="+alarmData+"&email="+alarmData2;
			}
			//쪽지 알람 
			if(alrTNo == '6'){
				location.href = "/letter/home";
			}
		}
	};
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send(JSON.stringify(data));
	
}

// 해당 유저에게 실시간으로 오는 메세지 전체 처리하는 부분 ojh
 function aMessage(){
	let Adata = JSON.parse(event.data);
	console.log("실시간으로 받은 데이터 :",Adata);
	let str = "";
	 var writeDate = new Date(Adata.Time);
	 var timelaps = elapsedText(writeDate);
	//console.log("받아온 데이터 : ", Adata);
	//console.log(Adata.alarmType);
	document.querySelector("#noAlarm").innerText = "";
	
	//makeReadAlarm(alarmNo, alrTNo, alarmData, alarmData2, alarmContent)
	if(Adata.alarmType == '1'){ // 채팅초대
		var roomId = Adata.roomNM;
		// a 링크에 함수만드는데  ---  chatMain.jsp를 이동시키고 --- 가져온 roomId --- openROOm()
		str += `<a href="javaScript:makeReadAlarm(\${Adata.alarmNo},\${Adata.alarmType},'\${Adata.roomNM}','','')" class="dropdown-item notify-item">
        		<div class="notify-icon bg-info" style="padding-top:0.6%">
        		<iconify-icon icon="ri:chat-new-line"></iconify-icon>
       				 </div>
       			  <p class="notify-details"> \${Adata.sender}님이 \${Adata.alarmContent}<small class="text-muted">\${timelaps}</small></p>
        		</a>`;     
		$('#alarm22').prepend(str); // 해당 알림창에 더해준다 
		alarmCount.textContent = parseInt(alarmCount.textContent) + 1; // 현재 갯수 int로 바꾼후 1더함
		
	} // end of alertType == 1
	
	if(Adata.alarmType == '2'){ // 댓글
		
		// a 링크에 함수만드는데  ---  chatMain.jsp를 이동시키고 --- 가져온 roomId --- openROOm()
		str += `<a href="javaScript:makeReadAlarm(\${Adata.alarmNo},\${Adata.alarmType},'\${Adata.alarmData}','\${Adata.alarmData2}', '')" class="dropdown-item notify-item">
			<div class="notify-icon bg-success" style="padding-top:0.5%">
			<iconify-icon icon="ic:baseline-reply"></iconify-icon>
       				 </div>
       			  <p class="notify-details"> \${Adata.sender}님이 \${Adata.alarmContent}<small class="text-muted">\${timelaps}</small></p>
        		</a>`;
        		
		$('#alarm22').prepend(str); // 해당 알림창에 더해준다 
		alarmCount.textContent = parseInt(alarmCount.textContent) + 1; // 현재 갯수 int로 바꾼후 1더함
		
	} // end of alertType == 2
	if(Adata.alarmType == '3'){ // 좋아요
		str += `<a href="javaScript:makeReadAlarm(\${Adata.alarmNo},\${Adata.alarmType},'\${Adata.alarmData}','\${Adata.alarmData2}', '')" class="dropdown-item notify-item">
			<div class="notify-icon bg-danger" style="padding-top:0.5%">
			<iconify-icon icon="ph:heart-fill"></iconify-icon>
       				 </div>
       			  <p class="notify-details"> \${Adata.sender}님이 \${Adata.alarmContent}
       			  <small class="text-muted">\${timelaps}</small></p>
        		</a>`;
        		
		$('#alarm22').prepend(str); // 해당 알림창에 더해준다 
		alarmCount.textContent = parseInt(alarmCount.textContent) + 1; // 현재 갯수 int로 바꾼후 1더함
		
	} // end of alertType == 2
	
	if(Adata.alarmType == '4'){ // 프로젝트 관련 
		console.log("프로젝트 관련 ", Adata);
		 	let proNo = Adata.alarmData
		    let proInfo = proDetailInliveAlarm(proNo);
		    
		    let proType = proInfo.proType;
		    let proName = proInfo.proName;
		    
			let str1 = ""
			
		    if(proType== "WEB"){
				str1 += `<p class="badge badge-soft-pink rounded-pill" style="font-size:0.9em;margin-bottom:1%;"><iconify-icon icon="heroicons:window"></iconify-icon>
					\${proName}</p>`
			}else if(proType == "AI"){
				str1 += `<p class="badge badge-soft-warning rounded-pill" style="font-size:0.9em;margin-bottom:1%;"><iconify-icon icon="fluent:brain-circuit-24-regular"></iconify-icon></p>
					\${proName}`
			}else if(proType == "SISM"){
				str1 += `<p class="badge badge-soft-success rounded-pill" style="font-size:0.9em;margin-bottom:1%;"><iconify-icon icon="clarity:settings-line"></iconify-icon></p>
					\$proName}`
			}else if(proType == "APP"){
				str1 += `<p class="badge badge-soft-info rounded-pill" style="font-size:0.9em;margin-bottom:1%;"><iconify-icon icon="ri:apps-2-line"></iconify-icon></p>
					\${proName}`
			}else if(proType == "GAME"){
				str1 += `<p class="badge badge-soft-purple rounded-pill" style="font-size:0.9em;margin-bottom:1%;"><iconify-icon icon="carbon:game-wireless"></iconify-icon>
					\${proName}</p>`
			}else if(proType == "BIGDATA"){
				str1 += `<p class="badge badge-soft-secondary rounded-pill" style="font-size:0.9em;margin-bottom:1%;"><iconify-icon icon="carbon:db2-database"></iconify-icon></p>
					\${proName}`
			}
			
		 str += `<a href="javaScript:makeReadAlarm(\${Adata.alarmNo},\${Adata.alarmType},'\${Adata.alarmData}','\${Adata.alarmData2}','\${Adata.alarmContent}')" class="dropdown-item notify-item ">
			 <div class="notify-icon bg-purple">
					 <iconify-icon icon="ri:team-fill"></iconify-icon>
       				 </div>
       				<small class="text-muted">\${str1}&nbsp;&nbsp;\${timelaps}</small>
	       			 <p class="notify-details">\${Adata.alarmContent}
	       			 </p>
        		</a>`;
        		
		$('#alarm22').prepend(str); // 해당 알림창에 더해준다 
		alarmCount.textContent = parseInt(alarmCount.textContent) + 1; // 현재 갯수 int로 바꾼후 1더함
		
	} // end of alertType == 2
	
	if(Adata.alarmType == '5'){	//프로젝트 초대
		var proNo = Adata.proNo;
		str += `<a href="javaScript:makeReadAlarm(\${Adata.alarmNo},\${Adata.alarmType},\${Adata.alarmData},'\${Adata.receiver}','\${Adata.alarmContent}')" class="dropdown-item notify-item ">
			<div class="notify-icon bg-info">
			<i class="mdi mdi-account-plus"></i>
       			</div>
       			  <p class="notify-details"> \${Adata.sender}님이 \${Adata.alarmContent}<small class="text-muted">\${timelaps}</small></p>
        		</a>`;     
		$('#alarm22').prepend(str); // 해당 알림창에 더해준다 
		alarmCount.textContent = parseInt(alarmCount.textContent) + 1; // 현재 갯수 int로 바꾼후 1더함
		document.querySelector("#tobbarLetterCnt").textContent = parseInt(document.querySelector("#tobbarLetterCnt").textContent) + 1;
	} // end of alertType == 5
	
	if(Adata.alarmType == '6'){	 // 쪽지
		
		str += `<a href="javaScript:makeReadAlarm(\${Adata.alarmNo},\${Adata.alarmType},'','','')" class="dropdown-item notify-item ">
			<div class="notify-icon bg-warning">
			<i class="mdi mdi-email-outline"></i>
       			</div>
       			  <p class="notify-details"> \${Adata.sender} 님으로부터 \${Adata.alarmContent}<small class="text-muted">\${timelaps}</small></p>
        		</a>`;     
		$('#alarm22').prepend(str); // 해당 알림창에 더해준다 
		alarmCount.textContent = parseInt(alarmCount.textContent) + 1; // 현재 갯수 int로 바꾼후 1더함
		document.querySelector("#tobbarLetterCnt").textContent = parseInt(document.querySelector("#tobbarLetterCnt").textContent) + 1;
	} // end of alertType == 6
	
} 

// 이함수는 해당 위치에서  ojh
function  updateAlarm(myAlarmId, alarmType, receiverId, inData){   
	let alarmContent; 
	// myAlarmId : 내 id 
	// alarmContent : 무슨글을 써서 보낼껀지 	
	if(alarmType == "inviteChat") alarmContent = '새로운 채팅방에 초대 하였습니다.'; // 오지형 채팅방 번호 필요
	if(alarmType == "proinvite") alarmContent ='새로운 프로젝트에 초대 하였습니다.'; // 나훔이형 프로젝트 번호
	if(alarmType == "comment") alarmContent = '작성한 글에 댓글을 달았습니다.'; // 진영이 누나 댓글번호 
	if(alarmType == "ProjectAssignment") alarmContent = '프로젝트에서 작업을 할당받았습니다.'; //작업번호
	if(alarmType == "like") alarmContent = "내 댓글에 좋아요를 눌러줬습니다"; //댓글번호
	if(alarmType == "sendLetter") alarmContent = "새로운 쪽지가 왔습니다." // 나훔이형 쪽지 
	
	if(alarmType == "projectNotice") alarmContent = "새로운 공지사항이 등록되었습니다." // 진영이누나 프로젝트 공지사항 
	
	if(alarmType == "TopWorkInsertAlarm") alarmContent = "새로운 상위작업이 등록되었습니다." // 진호형  됨
	if(alarmType == "TopWorkComentAlarm") alarmContent = "나의 상위작업에 댓글이 달렸습니다." // 진호형  됨
	

	if(alarmType == "SubWorkComentAlarm") alarmContent = "나의 하위작업이 댓글이 달렸습니다." // 진호형  
	if(alarmType == "WorkRecognizeWaitingAlarm") alarmContent = "프로젝트 내 작업이 승인대기 상태입니다." // 진호형    
	if(alarmType == "WorkRecognizeAlarm") alarmContent = "프로젝트 내 작업이 승인되었습니다." // 진호형  // 
	if(alarmType == "WorkRecognizeReferAlarm") alarmContent = "프로젝트 내 작업이 반려되었습니다." // 진호형  //

	
	var AlarmData = {
			'myAlarmId' : myAlarmId,
			'alarmContent' : alarmContent,
			'alarmType' : alarmType,
			'receiver' : receiverId,
			'inData' : inData
			}
	webSocketAlarm.send(JSON.stringify(AlarmData));
}

//ojh 알람 계속적으로 refresh 하는 함수 
function refreshMyAlarm(myAlarmId){
	
	let data = 'refresh';
	
	var refreshData = {
			'myAlarmId' : myAlarmId,
			'alarmContent' : "refresh",
			'alarmType' : "refresh",
			'receiver' : "none",
			'inData' : data
			}
	
	//console.log(refreshData);
	webSocketAlarm.send(JSON.stringify(refreshData));
}

getMemberDetail_B();

function getMemberDetail_B(){
	   var memberId ={
	         memberId : localStorage.getItem('id')
	   }
	   $.ajax({
	      url : "/member/selectMember",
	      type : "post",
	      data : JSON.stringify(memberId),
	      contentType : 'application/json; charset=utf-8',
	      dataType : 'json',
	      success : function(res) {
	     	let Str = ""
				if(res.memberPic == 0){
					Str += `<img src="${pageContext.request.contextPath }/resources/dist/assets/images/users/blank_progile.png" alt="user-image" class="rounded-circle">`;
				}else{
					Str += `<img src="\${res.memberPic}" alt="user-image" class="rounded-circle" style="border: 1px solid black;">`;
				}
				Str += `<span class="pro-user-name ms-1 fw-bold text-white" >
			          \${res.memberName}<i class="mdi mdi-chevron-down"></i> 
			              </span>`;
			              
				myProfileImg.innerHTML = Str;
	      },
	   });//ajax
}



/* 로컬스토리지 비어있으면 일단 초기화 */
window.addEventListener("DOMContentLoaded", (event) => {
	memberId = localStorage.getItem('id');
	memberToken = localStorage.getItem('token');
	memberPic = localStorage.getItem('pic');
	console.log(memberPic)
	
	if (memberId == null || memberId== '') {
		localStorage.removeItem('id');
	}else if (memberToken == null || memberToken == ''){
		localStorage.removeItem('token');
	}else if (memberPic == null || memberPic == ''){
		localStorage.removeItem('pic');
	}
    console.log("DOMContentLoaded");
});

	/* 로그아웃과 로컬스토리지 삭제 */
function logout_H(){
	var memberVO ={
	         memberId : localStorage.getItem('id')
	   }
	kakaoLogout();
	localStorage.removeItem('id');
	localStorage.removeItem('token');
	location.href= "/login"
		$.ajax({
			url : "/logout",
			type : "post",
			data : JSON.stringify(memberVO),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(res) {
				console.log("로그아웃 : "+ res)
				
			},

		});//ajax
}
//카카오로그아웃
Kakao.init('cbfd91d2833351668be647432e1a4c13'); //발급받은 키 중 javascript키를 사용해준다.
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
	
////////////////// 위젯 관련 - 김진호

//렌더링 함수
renderWidgetList_K(); //성공
renderWidgetBar_K(); //성공

var btnAddWidget_K = document.querySelector("#addWidget");
var btnResetWidget_K = document.querySelector("#resetWidget");

/* 날씨 API 시작 */
/* 
var API_KEY_WEATHER = "26329357974be09d714c1296fe958784";
function onGeoOk(position) {
    const lat = position.coords.latitude; //user의 위도
    const lon = position.coords.longitude; //user의 경도
    const url = "https://api.openweathermap.org/data/2.5/weather?lat=" + lat + "&lon="
                 + lon + "&appid=" + API_KEY_WEATHER + "&units=metric";
            
    fetch(url)
        .then(response => response.json())
        .then(data => {
            //console.log(data.name, data.weather[0].main);
            const weather = document.querySelector("#widget-weather span:first-child");
            const city = document.querySelector("#widget-weather span:last-child");
            weather.innerHTML = "<h2>날씨 🌞  " + data.weather[0].main + " / 🌡" +data.main.temp + "°C</h2>";
            city.innerHTML = "<h2>접속 지역 🌍" + data.name + "</h2>";
        });
}

function onGeoError() {
    alert("Can't find you. No weater for you.");
}
 */
/* 날씨 끝 */

/* 시계 API 시작 */
function getClock() {
    const date = new Date();
    const hours = String( date.getHours() ).padStart(2, "0");
    const minutes = String( date.getMinutes() ).padStart(2, "0");
    const seconds = String( date.getSeconds() ).padStart(2, "0");
    const clock = document.querySelector("#widget-time");
    clock.innerHTML = `<h4><i class="fe-clock"></i>&nbsp;&nbsp;&nbsp;\${hours } : \${minutes} : \${seconds}</h4>`;
}

getClock();
setInterval(getClock, 1000);
/* 시계 끝 */

      
//차트 API
//차트 옵션
//7일이내 마감 차트 데이터 : (딱 3개만 뽑으면 됨)
//data에 x, y, goals 지정하기

//차트-나의 작업 시작

//오프캔버스
function offCanvasListener(offCanvasId) {
  let myOffCanvas = document.getElementById(offCanvasId);

  const hideCanvas = () => {
    let openedCanvas = bootstrap.Offcanvas.getInstance(myOffCanvas);
    openedCanvas.hide();
    event.target.removeEventListener('mouseleave', hideCanvas);
  }
  const listenToMouseLeave = (event) => {
    event.target.addEventListener('mouseleave', hideCanvas);
  }
  
  myOffCanvas.addEventListener('shown.bs.offcanvas', listenToMouseLeave);
}

//offCanvasListener('offcanvasRight');


//위젯 추가 버튼
btnAddWidget_K.addEventListener("click", () => {
    const selectedWidget = document.querySelectorAll(".widget");
    console.log("위젯선택", selectedWidget);
    
    const addWidgetList = [];
    
    for (item of selectedWidget) {
        console.log("체크여부", item.checked);
        //console.dir(item.classList[2].split("-")[1]); 이게 widgetNo.
        if (item.checked) {
            //console.log("추가한 위젯 클래스 : ", item.classList[2]);
            let widgetNo = item.classList[2].split("-")[1];
            
            let widgetVO = {
                widgetNo
            };
            
            addWidgetList.push(widgetVO);
        }
        
    }
    //console.log("addWidgetList", addWidgetList);
    //선택한 객체가 담긴 배열 넘겨주기
    saveWidget_K(addWidgetList);
    renderWidgetList_K();
    document.querySelector("#bs-example-modal-lg").classList.remove("show");
    document.querySelector("#bs-example-modal-lg").style.display = "none";
});

//추가 가능한 위젯 리스트 만들기 -> 이미 사용중인거 처리해주기
function renderWidgetList_K() {
    const target = document.querySelector("#widget-list");
    
    axios
      .get("/widget/list")
      .then((res) => {
          console.log("넘어오는 리스트목록 : ", res);
          const json = res.data;
          const renderWidgetList = [];
          const renderWidgetList2 = [];
          const renderWidgetList3 = [];
          
          let text = "";
         //태그 그리기 전 내 목록 먼저 확인하기
         const widgetBarVO = {
           memberId,
         };
         
         axios
           .post("/widget/myWidgetList", widgetBarVO)
           .then((result) => {
        	     console.log("내가 쓰는 위젯들 : ", result.data );
        	     console.log("전체위젯 리스트 : ", json);
        	     let myWidgetList = result.data;
        	     
        	     //나의 리스트와 같으면 리스트에 추가. (나의 리스트와 동일하게 구성되겟네..)
        	     for (let i = 0; i < myWidgetList.length; i++) {
        	    	 //파인드, 필터는 적절하지 않음.
        	    	 //전체리스트 순환하면서 내 리스트와 일치하는건 제외하기
        	    	 json.forEach((item, index) => {
        	    		if (item.widgetNo == myWidgetList[i].widgetNo) {
        	    			json.splice(index, 1);
        	    		} 
        	    	 });
        	     }
        	     console.log("json : ", json);
        	     
		         //내가 이미 쓰는 위젯들은 아예 안뜸		         
		         for (item of json) {
		        	 let imageText = ``;
		        	 
		        	 if (item.widgetNo == 1) imageText = 'widget-memo.jpg';
		        	 if (item.widgetNo == 2) imageText = 'widget-weather.jpg';
		        	 if (item.widgetNo == 3) imageText = 'widget-news.PNG';
		        	 if (item.widgetNo == 4) imageText = 'widget-chart.PNG';
		        	 if (item.widgetNo == 5) imageText = 'widget-calendar.png';
		        	 if (item.widgetNo == 6) imageText = 'widget-todo.jpg';
		        	 
		        	 //console.log("그릴 아이템 : ", item); //안찍혔던 이유는 비동기 안에서 실행을 안해서..
		              text += `<div class="avatar-md widgetNo-\${item.widgetNo}" style="margin-left: 50px; margin-right: 50px; margin-top: 30px;">`;
		              text += `<img src="/assets/images/\${imageText}" alt="image"`;
                      text += `     class="img-fluid rounded-circle img-thumbnail handle" width="120"/>`;
                      text += `<p class="mb-0">`;
                      text += `  <font class="jinoFont">\${item.widgetName}</font>`;
                      text += `</p>`;
                      text += `</div>`;
		          }
		         //시간될때 사용중인 리스트도 출력해주도록? -> 이건 나의 쿼리로 xx 쿼리수정
		         for (item of myWidgetList) {
		        	 let imageText = ``;
                     
                     if (item.widgetNo == 1) imageText = 'widget-memo.jpg';
                     if (item.widgetNo == 2) imageText = 'widget-weather.jpg';
                     if (item.widgetNo == 3) imageText = 'widget-news.PNG';
                     if (item.widgetNo == 4) imageText = 'widget-chart.PNG';
                     if (item.widgetNo == 5) imageText = 'widget-calendar.PNG';
                     if (item.widgetNo == 6) imageText = 'widget-todo.jpg';
                     
		        	 text += `<div class="avatar-md filtered widgetNo-\${item.widgetNo}" style="margin-left: 50px; margin-right: 50px; margin-top: 30px;">`;
		        	 text += `<img src="/assets/images/\${imageText}" alt="image"`;
                     text += `     class="img-fluid rounded-circle img-thumbnail handle" width="120"/>`;
                     text += `<p class="mb-0">`;
                     text += `  <h4 class="text-dark">\${item.widgetName}</h4>`;
                     text += `</p>`;
                     text += `</div>`;
		         }
		         
		          target.innerHTML = text;
		          
		          const widgetContainer = document.querySelector(".widget-container");
		          
		          new Sortable(widgetContainer, { //바깥 사이드바영역
		              group: {
		                  name: "shared", //이게 같은 Sortable 객체들끼리 이동 가능
		                },
		                swapThreshold: 1,
		                handle: ".handle",
		                animation: 150,
		                ghostClass: "blue-background-class",
		                //sort: false, 이거 false하면 원래 영역 내에서는 안움직임
		                onChoose: function (event) {
		                  //클릭한 아이템
		                  //선택한 영역 안에 테이블 목록
		                  //console.log("시작~~~");
		                },
		                filter: ".filtered",
		                onEnd: function (event) {
		                  //내려놓았을때!
		                  const moveArea = event.to.id;
		                  
		                  if (moveArea == "widget-list") {
		                	  console.log("추가하러왔어용");
		                  }
		                },
		          });
           });
         
      });
}

//회원의 위젯 리스트 저장하기
function saveWidget_K(addWidgetList) { //여기서 네개만 들어가면 안됨. -> save 버튼 말고 add 버튼으로 추가와 동시에 저장해야할듯.
	//우선 현재 div내용 탐색
	//const wList = document.querySelector("#widget-myList");
	//console.log("addWidgetList");
	//console.log(addWidgetList);//widgetNo 담겨있음.
	
	for (let i = 0; i < addWidgetList.length; i++) {
		//우선은 즐겨찾기 목록 없이 단일 목록으로 개발 시작
		//위젯별로 각각 한번씩 inset 들어가야함. 
		let widgetNo = addWidgetList[i].widgetNo;
		let widgetBarVO = {
		  widgetNo,
		  memberId,
		  widgetBarTitle: "테스트위젯바"
		};
		
		axios
		  .post("/widget/insertWidgetBar", widgetBarVO)
		  .then((res) => {
			  //console.log(res);위젯바에 등록 성공
			  renderWidgetBar_K();
		  });
	}
}

//해당 회원의 위젯 리스트 불러오기
function renderWidgetBar_K() {
	//console.log("위젯 렌더할 멤버 아이디 : ", memberId);
	const widgetBarVO = {
	  memberId,
	};
	
	axios
	  .post("/widget/myWidgetList", widgetBarVO)
	  .then((res) => {
		//console.log("내 위젯목록 : ", res.data); //잘 가져옴. 이제 이걸 토대로 그려줘야함.
		
		renderWidgetItem_K(res.data);
	  });
}

function renderWidgetItem_K(widgetList) { //+= 방식이 아니라 + 방식으로..
	let text = "";
	const selectList = [];
	
	for (item of widgetList) {
		//메모장
		if (item.widgetNo == 1) {
			selectList.push("memo");
            text += `<div id="widget-memo" style="height: 200px; width: 330px; margin-left: 20px; margin-right: 20px;" class="widgetNo-1 widgetBarNo-\${item.widgetBarNo}">`;
            text += `</div>`;
        }  
        //날씨
        if (item.widgetNo == 2) {
        	selectList.push("weather");
            text += `<div id="widget-weather" class="widgetNo-2 widgetBarNo-\${item.widgetBarNo}" style="height: 200px; width: 340px; margin-left: 20px; margin-right: 20px; margin-top: 15px;">`;
            text += `</div>`;
        }
        
        //차트 - 7일 이내 `
        if (item.widgetNo == 4) {
        	selectList.push("chart-project");
            text += `<div id="widget-chart-project" class="widgetNo-4 widgetBarNo-\${item.widgetBarNo}" style="width: 330px; height: 220px; margin-right: 30px;"></div>`;
        }
        //검색바
        if (item.widgetNo == 5) {
        	selectList.push("calendar");
            text += `<div id="widget-calendar" class="widgetNo-5 widgetBarNo-\${item.widgetBarNo}" style="width: 240px;"></div>`;
        }
        
	}
	
	if (widgetList.length == 0) {
		text = `<div style="width: 100%; height: 100px;"></div>`;
	}
	
	document.querySelector("#widget-myList").innerHTML = text;
	
	if (selectList.includes("memo")) {
		var memoDiv = document.querySelector("#widget-memo");
		let memoText = ``;
		memoText += `<div style="background-color: #F2DF81; text-align: right;">`;
		memoText += `  <button class="btn btn-soft-warning waves-effect waves-light btn-memo" id="btnMemo" style="color: black;"`;
		memoText += ` onclick="memoListRender()" aria-expanded="true" aria-controls="#dropA">목록</button>`;
		memoText += `</div>`;
		memoText += `<div id="memo-table-div"><textarea id="memoTextArea"></textarea>`;
		memoText += `<div style="text-align: right;">`;
		memoText += `<button class="btn btn-soft-warning waves-effect waves-light btn-memo" `;
		memoText += ` style="color: black; background: #FBF9C6;" onclick="saveMemo()">저장</button>`;
		memoText += `</div>`;
		memoText += `</div>`;
		memoDiv.innerHTML = memoText;
		/* 
        var gridDiv = document.querySelector('#widget-memo');
        new agGrid.Grid(gridDiv, gridOptions);
         */
    }
    
    if (selectList.includes("weather")) {
      //success 함수와 error 함수를 인자로 받음.
    	renderWeather();
    }
    
    if (selectList.includes("chart-project")) {
        //var chartProject = new ApexCharts(document.querySelector("#widget-chart-project"), optionsProjectChart_K);
        const memberVO = {
          memberId,	
        };
        
        axios
          .post("/member/my7Chart", memberVO)
          .then((res) => {
        	const mapList = res.data; //인덱스3까지만 사용
        	const chartArray = [];
        	let i = 0;
        	
        	for (map of mapList) {
        		map.x = map.TOPWORK_TITLE;
        		map.y = [
        			new Date(map.TOPWORK_START).getTime(),
        			new Date(map.TOPWORK_END).getTime(),
        		];
        		
        		if (i == 0) {
         		  map.fillColor = "#e0490d";
        		}
        		if (i == 1) {
         		  map.fillColor = "#FFD10E";
        		}
        		if (i == 2) {
         		  map.fillColor = "#01FF54";
        		}
        		if (i == 3) {
        		  map.fillColor = "#12BAFF";
        		}
        		
        		chartArray.push(map);
        		
        		if (i == 3) {
        		  break;
        		}
        		
        		i++;
        	}
        	
        	console.log("수정된 맵데이터 : ", chartArray);
        	//차트초기화
        	document.querySelector("#widget-chart-project").innerHTML = "";
	        var chartProject = new ApexCharts(document.querySelector("#widget-chart-project"), {
	        	//데이터 그리기
	            series: [
	                {
	                  data: chartArray,
	                }
	              ],
	                chart: {
	                height: 200,
	                width: 345,
	                type: 'rangeBar',
	              },
	              plotOptions: {
	                bar: {
	                  horizontal: true,
	                  distributed: true,
	                  dataLabels: {
	                    hideOverflowingLabels: false
	                  }
	                }
	              },
	              dataLabels: {
	                enabled: true,
	                formatter: function(val, opts) {
	                  var label = opts.w.globals.labels[opts.dataPointIndex]
	                  var a = moment(val[0])
	                  var b = moment(val[1])
	                  var diff = b.diff(a, 'days')
	                  return label + ': 총 ' + diff + (diff > 1 ? ' 일' : ' 일')
	                },
	                style: {
	                  colors: ['#6F8092', '#6F8092']
	                }
	              },
	              xaxis: {
	                type: 'datetime'
	              },
	              yaxis: {
	                show: false
	              },
	              grid: {
	                row: {
	                  colors: ['#f3f4f5', '#fff'],
	                  opacity: 1
	                }
	              }
	        });
	        chartProject.render();
        	  
          })
    }
    
    if (selectList.includes("calendar")) {
    	//달력
    	let calendarText = ``;
    	calendarText += `<div data-provide="datepicker-inline">`;
        calendarText += `  <div class="datepicker datepicker-inline"></div>`;
        calendarText += `</div>`;
        
    	const calendarDiv = document.querySelector("#widget-calendar");
    	calendarDiv.innerHTML = calendarText;
    }
    
    //위젯 다 그리고 드래그 이벤트 걸기
    const container = document.querySelector(".container-widget");
    const containerSideBar = document.querySelector(".container-widget2");
    const containerDustbin = document.querySelector(".container-widget-delete");
    
    new Sortable(container, {
          group: {
            name: "shared", //이게 같은 Sortable 객체들끼리 이동 가능
          },
          swapThreshold: 1,
          animation: 150,
          ghostClass: "blue-background-class",
          //sort: false, 이거 false하면 원래 영역 내에서는 안움직임
          onChoose: function (event) {
            //클릭한 아이템
            //선택한 영역 안에 테이블 목록
          },
          filter: ".filtered",
          onEnd: function (event) {
            //내려놓았을때!
            ////////////////////////////////////////////////////////////////////////
            // 위젯 이동시 위치 잡아주기  
            ////////////////////////////////////////////////////////////////////////
            //console.log("내려놓은 곳", event.item);
            //console.log("내려놓은 곳 부모 : ", event.item.parentElement);
            const parentDiv = event.item.parentElement
            //console.log("부모 디브아이디 : ", parentDiv.id);
            
            //삭제일때는 예외 처리
            if (parentDiv.id == "dustbin") {
            	//console.log("이 함수는 빠져나갑니다.");
            	return;
            }
            
            console.log("움직인애 : ", event.item);
            document.querySelector("#dustbin").style.backgroundColor = "#ECF2F5";
            const moveItem = event.item.id;
            
            const arr = parentDiv.children;
            //console.log(arr); //자식 순서대로 뽑힘.
            for (let i = 0; i < arr.length; i++) {
            	//console.log(`\${i}번째 자식 : `,arr[i]);
            	let moveChild = arr[i].classList[1]; //widgetBarNo-1 이런식으로 뽑힘.
            	let widgetBarNo = moveChild.split("-")[1];
            	console.log("widgetBarNo : ", moveChild, " 위치 : ", i); //위치 값은 0부터 시작하는걸로하자.
            	let widgetBarVO = {
            		widgetBarNo,
            		widgetWBLocation: i
            	};
            	//반복문 안에서 보내야함
            	console.log("보낼 객체 : ", widgetBarVO);
            	axios
            	  .post("/widget/moveWidget", widgetBarVO)
            	  .then((res) => {
            		  console.log(res);
        	          
            		  
            		  if (moveItem == "widget-weather") {
            		    renderWeather();
            		  }
            	  });
            }
            
          },
          onAdd: function (event) {
        	  console.log("드랍? : ", event);
        	  console.log("드랍? : ", event.item.classList[1]);
        	  const addWidgetNo = event.item.classList[1].split("-")[1];
        	  
        	  console.log("widgetNo : ", addWidgetNo);
        	  
        	  const widgetArray = [];
        	  const widgetBarVO = {
        	    widgetNo: addWidgetNo,
        	    memberId: memberId,
        	    widgetBarTitle: "새로운위젯",
        	  };
        	        
    	      axios
    	        .post("/widget/insertWidgetBar", widgetBarVO)
    	        .then((res) => {
    	            //console.log(res);위젯바에 등록 성공
    	            renderWidgetList_K();
    	            renderWidgetBar_K();
    	        });
        	  
          },
          onMove: function(event) {
        	  //console.log("무브 : ", event);
          }
    });
    new Sortable(containerSideBar, { //바깥 사이드바영역
        group: {
            name: "shared", //이게 같은 Sortable 객체들끼리 이동 가능
          },
          swapThreshold: 1,
          handle: ".handle",
          animation: 150,
          ghostClass: "blue-background-class",
          //sort: false, 이거 false하면 원래 영역 내에서는 안움직임
          onChoose: function (event) {
            //클릭한 아이템
            //선택한 영역 안에 테이블 목록
            //console.log("시작~~~");
          },
          filter: ".filtered",
          onEnd: function (event) {
            //내려놓았을때!
          },
    });
    new Sortable(containerDustbin, {
        group: {
            name: "shared", //이게 같은 Sortable 객체들끼리 이동 가능
          },
          swapThreshold: 1,
          animation: 150,
          ghostClass: "blue-background-class",
          filter: ".filtered",
          //sort: false, 이거 false하면 원래 영역 내에서는 안움직임
          onChoose: function (event) {
            //클릭한 아이템
            //선택한 영역 안에 테이블 목록
            console.log("시작~~~");
          },
          onEnd: function (event) {
        	  console.log(event.item);
            //내려놓았을때!
          },
          onAdd: function (event) {
        	  //아이템이 휴지통에 들어갔을 때!
              //console.dir(event.item);
              //console.log(event.item);
        	  //console.log("내아이디 : ", memberId, "widgetNo : ", event.item.classList[0].split("-")[1]);
        	  let widgetBarNo = event.item.classList[1].split("-")[1];
        	  let widgetNo = event.item.classList[0].split("-")[1];
        	  //console.log("widgetBarNo", widgetBarNo)
        	  const widgetBarVO = {
        		memberId,
        		widgetNo,
        		widgetBarNo
        	  };
        	  
        	  axios
        	    .post("/widget/deleteWidgetBar", widgetBarVO)
        	    .then((res) => {
        	    	//console.log(res); 삭제 잘 됨. 
        	    	//삭제 됐으면 휴지통 비우기 + 다시 그려주기
        	    	document.querySelector("#dustbin").innerHTML = `<h3 class="">휴지통</h3>`;
        	    	document.querySelector("#dustbin").style.backgroundColor = "#C3C3C3";
        	    	renderWidgetBar_K();
        	    	renderWidgetList_K();
        	    });
          },
          onChange: function(event) {
        	  console.log("이거냐?");
        	  document.querySelector("#dustbin").style.backgroundColor = "#6C757D";
          },
          onFilter: function(event) {
        	  console.log("이건가?");
        	  
          },
          onMove: function(event) {
        	  console.log("이건가?");
        	  
          },
          onClone: function(event) {
        	  console.log("이건가?");
        	  
          },
          onUpdate: function(event) {
        	  console.log("이건가?");
        	  
          },
    });
    
};


//메모장 리스트변환
function memoListRender(mode, memoNo) {
	console.log("익스 : ", document.querySelector("#dropA"));
	console.dir(document.querySelector("#dropA"));
	
	const btnMemo = document.querySelector("#btnMemo");
	const memoDiv = document.querySelector("#memo-table-div");
	
	
	if (mode == "detail") {
		const memoVO = {
		  memoNo,	
		};
		
		axios
		  .post("/member/selectMemo", memoVO)
		  .then((res) => {
			  const memo = res.data;
			  
			  btnMemo.innerText = "목록";
	          let memoText = ``;
	          memoText += `<textarea id="memoTextArea"></textarea>`;
	          memoText += `<div style="text-align: right;">`;
	          memoText += `<button class="btn btn-soft-warning waves-effect waves-light btn-memo" `;
	          memoText += ` style="color: black; background: #FBF9C6;" onclick="saveMemo('update', \${memo.memoNo})">저장</button>`;
	          memoText += `</div>`;
	          
	          memoDiv.innerHTML = memoText;
	          
	          document.querySelector("#memoTextArea").value = memo.memoContent;
	          
	          return;
		  });
		
		
	}
	
	if (btnMemo.innerText == "목록") {
		btnMemo.innerText = "메모";
	} else {
		btnMemo.innerText = "목록";
		let memoText = ``;
		memoText += `<textarea id="memoTextArea"></textarea>`;
        memoText += `<div style="text-align: right;">`;
        memoText += `<button class="btn btn-soft-warning waves-effect waves-light btn-memo" `;
        memoText += ` style="color: black; background: #FBF9C6;" onclick="saveMemo()">저장</button>`;
        memoText += `</div>`;
        
		memoDiv.innerHTML = memoText;
		return;
	}
	
	let memoText = ``;
	memoText += `<table id="widget-memo-table">`;
	memoText += `<thead>`;
	memoText += `<tr>`;
	memoText += `<th>내용</th>`;
	memoText += `<th>날짜</th>`;
	memoText += `<th>삭제</th>`;
	memoText += `</tr>`;
	memoText += `</thead>`;
	memoText += `<tbody>`;
	memoText += `<tr>`;
	memoText += `<td></td>`;
	memoText += `<td></td>`;
	memoText += `<td></td>`;
	memoText += `</tr>`;
	memoText += `</tbody>`;
	memoText += `</table>`;
	
	memoDiv.innerHTML = memoText;
	
	const memberVO = {
	  memberId,	
	};
	
	axios
	  .post("/member/memoList", memberVO)
	  .then((res) => {
		  const memoList = res.data;
		  //console.log("메모 : ", memoList);
		  for (memo of memoList) {
			  if (memo.memoContent.length > 14) {
				  memo.memoContent = memo.memoContent.substr(0, 13) + "...";
			  }
			  
			  memo.memoContent = `<a href="javascript: memoListRender('detail', \${memo.memoNo});">\${memo.memoContent}</a>`;
			  memo.deleted = `<span class="badge bg-danger" onclick="memoDelete(\${memo.memoNo})"><i class="mdi mdi-window-close"></i></span>`;
		  }
		  
		  const memoTable = $('#widget-memo-table').removeAttr("width").DataTable({
		         order: [[1, 'asc']],
		         ordering: true,
		         responsive:false,
		         //retrieve: true,
		         //scrollX: true,
		         //scrollCollapse:true,
		         searching: false,
		         lengthChange: false,
		         scrollY: 100,
		         //paging: true,
		         destroy: true,
		         pageLength: 5,
		         //lengthMenu: [5, 7, 10],
		         columnDefs: [
		             {width: 130, targets: 0}, //target은 컬럼순서. 컬럼별 사이즈 조절
		             {width: 70, targets: 1},
		             {width: 30, targets: 2, orderable: false}
		         ],
		         data: memoList,
		         columns: [
		             { data: "memoContent" },
		             { data: "memoDate" },
		             { data: "deleted" },
		         ],
		         language: {
		             emptyTable: "메모가 없습니다.",
		             lengthMenu: "_MENU_ 개씩 보기",
		             info: "총 _TOTAL_건",
		             infoEmpty: "데이터 없음",
		             infoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
		             search: "",
		             zeroRecords: "일치하는 데이터가 없습니다.",
		             loadingRecords: "로딩중...",
		             processing: "잠시만 기다려 주세요.",
		             paginate: {
		               next: "다음",
		               previous: "이전",
		             },
		           },
		         
		     });
		  
	  });
}

function saveMemo(mode, memoNo) {
	const memoTextArea = document.querySelector("#memoTextArea");
	const memoContent = memoTextArea.value;
	
	const memoVO = {
	  memberId,
	  memoContent,
	};
	
	if (mode == 'update') {
		memoVO.memoNo = memoNo;
		
		axios
		  .post("/member/updateMemo", memoVO)
		  .then((res) => {
			  //저장완료
			  Swal.fire({
				  position: 'top-end',
				  icon: 'success',
				  title: '저장되었습니다.',
				  showConfirmButton: false,
				  timer: 1500
				});
		  });
		
		return;
	}
	
	axios
	  .post("/member/insertMemo", memoVO)
	  .then((res) => {
		  memoTextArea.value = "";
		  Swal.fire({
			  position: 'top-end',
			  icon: 'success',
			  title: '저장되었습니다.',
			  showConfirmButton: false,
			  timer: 1500
			});
	  });
	
}

function memoDelete(memoNo) {
	const memoVO = {
	  memoNo,
	};
	
	axios
	  .post("/member/deleteMemo", memoVO)
	  .then((res) => {
		  memoListRender();
		  memoListRender(); //ㅋㅋ두번해버리기
		  
		  Swal.fire({
              position: 'top-end',
              icon: 'success',
              title: '삭제되었습니다.',
              showConfirmButton: false,
              timer: 1500
            });
	  });
}

function drops() {
    const dropdown = document.querySelector("#widget-dropdown");
    
    if (dropdown.classList.length > 2) {
        dropdown.classList.remove("show"); //이게 답이다.
    } else {
        dropdown.classList.add("show");
    }
    
}


function renderWeather() {
	/* 
	let weatherText = `<a class="weatherwidget-io" href="https://forecast7.com/en/35d91127d77/south-korea/" data-label_1="대전 광역시" data-label_2="날씨" data-font="Roboto" data-mode="Forecast" data-days="5" data-theme="original" >대전 광역시 날씨</a>`;
    document.querySelector("#widget-weather").innerHTML = weatherText;
    
    !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src='https://weatherwidget.io/js/widget.min.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','weatherwidget-io-js');
     */
     (function(d, s, id) {
         if (d.getElementById(id)) {
             if (window.__TOMORROW__) {
                 window.__TOMORROW__.renderWidget();
             }
             return;
         }
         const fjs = d.getElementsByTagName(s)[0];
         const js = d.createElement(s);
         js.id = id;
         js.src = "https://www.tomorrow.io/v1/widget/sdk/sdk.bundle.min.js";

         fjs.parentNode.insertBefore(js, fjs);
     })(document, 'script', 'tomorrow-sdk');
     
	let weatherText = ``;

     weatherText += `<div class="tomorrow"`;
     weatherText += `   data-location-id="065301"`;
     weatherText += `   data-language="EN"`;
     weatherText += `   data-unit-system="METRIC"`;
     weatherText += `   data-skin="light"`;
     weatherText += `   data-widget-type="aqiMini"`;
     weatherText += `   style="padding-bottom:22px;position:relative;"`;
     weatherText += `>`;
     weatherText += `  <a`;
     weatherText += `    href="https://www.tomorrow.io/weather-api/"`;
     weatherText += `    rel="nofollow noopener noreferrer"`;
     weatherText += `    target="_blank"`;
     weatherText += `    style="position: absolute; bottom: 0; transform: translateX(-50%); left: 50%;"`;
     weatherText += `  >`;
     weatherText += `    <img`;
     weatherText += `      alt="Powered by the Tomorrow.io Weather API"`;
     weatherText += `      src="https://weather-website-client.tomorrow.io/img/powered-by.svg"`;
     weatherText += `      width="250"`;
     weatherText += `      height="18"`;
     weatherText += `    />`;
     weatherText += `  </a>`;
     weatherText += `</div>`;
     
    document.querySelector("#widget-weather").innerHTML = weatherText;
    
}

function clickWidgetBtn() {
	document.querySelector("#btnWidgetAdd").click();
}


/* 쪽지 cnt 업데이트 */
function checkletterCnt(){
	var memberId = localStorage.getItem('id');
	var letterVO = {
		memberId : memberId
	}
	$.ajax({
		url : "/letter/mylist",
		type : "post",
		data : JSON.stringify(letterVO),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(res) {
			var checkCnt = 0;
			//console.log(res)
			for (var i = 0; i < res.length; i++) {
				if (res[i].letterCheck =='0' && res[i].letterDelstate == '0') {
					checkCnt += 1;
				}
			}
			console.log("안읽은편지:"+checkCnt);
			$('.chkletterinit').text(checkCnt)
			
		},
	});//ajax
}

function clickAddWidget() {
    const addWidgetRow = document.querySelector("#addWidgetRow");
    
    if (addWidgetRow.style.display == "") {
        addWidgetRow.style.display = "none";
    } else {
        addWidgetRow.style.display = "";
    }
}


</script>