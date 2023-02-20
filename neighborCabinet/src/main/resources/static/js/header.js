/**
 * header.js
 */
 
$(document).ready(function(){
	
	var sidebar = $('#header_sidebar');
	var sidebar_background = $('#outside_sidebar');
	
	$('#user_button').on('click', function(){
        if(sidebar.css('right') != '0px') {
        	sidebar.animate({right:0}, 50);
        	sidebar_background.css('z-index', '2500');
        	sidebar_background.css('background-color', 'rgba(0,0,0,0.5)');
        	sidebar_background.css('box-shadow', 'rgba(0,0,0,0.5) 0 0 0 9999px;');
        }
    });
    $('#sidebar_closeBtn').on('click', function(){
    	if(sidebar.css('right') == '0px') {
    		sidebar.animate({right:-410}, 50);
    		sidebar_background.css('z-index', '-1');
    		sidebar_background.css('background-color', 'transparent');
    	}
    });
    $(document).mouseup(function (e){
		if(sidebar.has(e.target).length==0) {
			sidebar.animate({right:-410}, 50);
			sidebar_background.css('z-index', '-1');
    		sidebar_background.css('background-color', 'transparent');
		}
	});
	
	
	const recordBtn = document.getElementById("STTBtn");
  	const stopBtn = document.getElementById("stopBtn");
  	const STTStopBox = document.getElementById("STTStopBox");
  	
  	if(navigator.mediaDevices) {
  		var constraints = {
  			audio:true
  		}
  		
  		let chunks = []; // 녹음 데이터 저장하기 위한 변수
  		
  		navigator.mediaDevices.getUserMedia(constraints)
  			.then(stream => {
  				const mediaRecorder = new MediaRecorder(stream);
  				
  				// [녹음] 버튼 눌렀을 때
  				recordBtn.onclick = () => {
  					mediaRecorder.start(); // 녹음 시작
  					STTStopBox.style.display = "";

  				}
  				
  				// [정지] 버튼 눌렀을 때
  				stopBtn.onclick = () => {
  					mediaRecorder.stop(); // 녹음 정지
  					STTStopBox.style.display = 'none';
  				}
  				
  				// chunks에 저장된 녹음 데이터를 audio 양식으로 설정
  				// blob : 녹음 데이터
  				mediaRecorder.onstop = e => {
  					const blob = new Blob(chunks, {
  						'type':'audio/mp3 codecs=opus'
  				});
  				
  				chunks = []; // 초기화 : 초기화하지 않으면 녹음 내용이 누적됨
  				
  				// 녹음 내용을 파일로 저장 시 파일명 랜덤 생성
  				var num  = new Date();
  				const clipName = num.getTime() + "_voiceMsg"; // 파일 이름
  				
  				// 파일 업로드 함수 호출
  				fileUploadFn(blob, clipName); // 음성 파일 데이터, 파일명
  				
  			  }// mediaRcorder.onstop 끝
  			  
  			  // 녹음 시작시킨 상태가 되면 chunks에 녹음 데이터 저장
  			  mediaRecorder.ondataavailable = e => {
  			  		chunks.push(e.data);
  			  }
  			  
  			  }).catch(err => {
  			  		console.log("오류 발생 : " + err);
  			  });
  		
  	}  	
  	//////////////////////////////////////////////////////////////////////////
  	
  	// (2) 파일 업로드 
  	// 서버에 파일 업로드 하는 함수
  	function fileUploadFn(blob, clipName) {
  		// 음성 파일을 폼에 추가
  		var formData = new FormData();
  		formData.append('uploadFile', blob, clipName + ".mp3");
  		// name, 데이터, 파일명
  		console.log(formData);
  		// 서버에 전달하고 응답 받음
  		$.ajax({
 			type:"post",
 			url:"/stt",
 			enctype:"multipart/form-data",
 			processData:false,
 			contentType:false,
 			data: formData,
 			success:function(result){
 				
 				// <input> 태그의 값을 받은 텍스트로 설정
 				$('#header_searchInput').val(result);
 				//alert("성공");
 				//$('#header_form').submit();
 				
 			},
 			error:function(){
 				alert("실패");
 			},
 			complete:function(){
 				//alert("작업 완료");
 			}
 		}); // ajax 종료 	
  	}
	$('#header_searchInput').on('keydown', function(e){

		var keyCode = e.which;


		if (keyCode === 13) { // Enter Key
			e.preventDefault();
			let url=($(location).attr('pathname'));
			let searchInput=$('#header_searchInput').val();
			$.ajax({
				type:"post",
				url:"/map/Search",
				data:{"searchInput":searchInput},
				success:function(result) {
					console.log(url.indexOf('map'));
					if (url.indexOf('map')===-1)
						location.href = "/map/SearchForm/" + result;
					else {
						if (!(result === 0))
							searchTitleToCoordinate(result);
						else
							searchAddressToCoordinate(searchInput);
					}
				}
			})
		}
	});

	$('#header_searchBtn').on('click', function(e) {
		e.preventDefault();
		let url=($(location).attr('pathname'));
		let searchInput=$('#header_searchInput').val();
		$.ajax({
			type:"post",
			url:"/map/Search",
			data:{"searchInput":searchInput},
			success:function(result) {
				if (url.indexOf('map')===-1) {
					location.href = "/map/SearchForm/" + result;
				}
				else {
					if (!(result === 0))
						searchTitleToCoordinate(result);
					else
						searchAddressToCoordinate(searchInput);
				}
			}
		})
	});

});