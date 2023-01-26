<%--
  Created by IntelliJ IDEA.
  User: se
  Date: 2023-01-18
  Time: 오전 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%--
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
--%>


<html>
<head>
    <title>대여등록</title>
    <script src="<c:url value='/js/jquery-3.6.1.min.js'/>"></script>
    <script src="<c:url value='/js/searchZip2.js' />"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>



    <style>
        html,body{
            background:#ffffff;
            height:100%;
            width:100%;
            padding:0px;
            margin:0px;
        }
        hr{
            width: 100%;
            height: 5px;
            background: #285943;
            border: 0;
        }
        h3{
            font-weight: bold;
        }

    </style>
    <style>
        #att_zone {
            width: 1300px;
            min-height: 150px;
            padding: 10px;
            border: 1px solid #888888;
        }

        #att_zone:empty:before {
            content: attr(data-placeholder);
            color: #999;
            font-size: .9em;
        }
        option[value=""][disabled] {
            display:none
        }
    </style>

</head>
<body>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<c:import url="/WEB-INF/views/member/chat.jsp"/>

<div class="container">
    <div class ="heading mt-5">
        <h3> 공간 정보를 입력해주세요</h3>
        <hr>
    </div>

    <form class = "rentalregform  g-3 mt-3" id="rentalform"  method="post" action="<c:url value='/rental/reg'/>">

        <div class="col-md-12">
            <div class = "title ">
                <label for = "pWriteTitle">
                    <span><h4>글 제목</h4></span>
                </label>
                <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 대표 제목을 적어주세요!">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                    </svg>
                </a>
                <input type="text" class = "form-control form-control-lg" id = "pWriteTitle" name="pWriteTitle" style="border-radius: 0px;" placeholder="글 대표 제목을 적어주세요!" >
            </div>
        </div>

        <div class="col-md-12 mt-3">
            <div class = "title ">
                <label for = "pPlaceTitle">
                    <span><h4>공간명</h4></span>
                </label>
                <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 다른 공간과 구별될 수 있는 공간의 고유 업체 명을 입력해주세요!">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                    </svg>
                </a>
                <input type="text" class = "form-control form-control-lg" id = "pPlaceTitle" name="pPlaceTitle" style="border-radius: 0px;" placeholder="공간의 고유 업체 명을 입력해주세요!" >
            </div>
        </div>

        <div class="col-md-12 mt-3">
            <div class = "title ">
                <label for = "pWriteSub">
                    <span><h4>공간 한줄 소개</h4></span>
                </label>
                <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 한 줄 소개를 매력적으로 작성해보세요 (예시) 강남역 5분거리 픽업가능 ...">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                    </svg>
                </a>
                <input type="text" class = "form-control form-control-lg" id = "pWriteSub" name="pWriteSub" style="border-radius: 0px;" placeholder="공간의 특장점을 한 문장으로 작성해주세요." >
            </div>
        </div>

        <div class="col-md-12 mt-3">
            <div class = "pType">
                <label for = "pType">
                    <span><h4>공간 유형</h4></span>
                </label>
                <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 짐을 실제 보관하실 장소를 선택해 주세요!">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                    </svg>
                </a>
                <select class="form-select form-select-lg" id="pType" name="pType" style="border-radius: 0px;" required aria-p>
                    <option value="" disabled selected>공간 유형을 선택해주세요</option>
                    <option value="집">거주지(집)</option>
                    <option value="창고">창고</option>
                    <option value="업소">업소</option>
                    <option value="자동차">자동차</option>
                    <option value="기타">기타</option>
                </select>
            </div>
        </div>

        <div class="div1 col-md-12 mt-3">
            <div class="pType_d">
                <label for="pType_d">
                    <span><h4>상세 공간 유형</h4></span>
                </label>
                <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 짐을 보관하실 장소를 상세하게 적어주세요 ex)집 안, 업장(편의점,식당), 자동차 트렁크 ...!">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                    </svg>
                </a>
                <input type="text" class = " form-control form-control-lg" id = "pType_d" name="pType_d" style="border-radius: 0px;"placeholder="공간 유형을 상세하게 적어주세요" >
            </div>
        </div>
        <div class="col-md-4 mt-3"style="">
            <div class="space_d m-3" >
                <div class="form-check">
                    <input class="form-check-input "  type="checkbox" value="Agree" id="food" name="food">
                    <label class="form-check-label" for="food">
                        음식 보관
                    </label>
                    <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 음식 보관이 가능하면 체크">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                        </svg>
                    </a>
                </div>
            </div>
            <div class="space_d m-3">
                <div class="form-check">
                    <input class="form-check-input"  type="checkbox" value="Agree" id="pickup" name="pickup">
                    <label class="form-check-label" for="pickup">
                        픽업 가능
                    </label>
                    <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                           • 픽업이 가능하면 체크">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                        </svg>
                    </a>

                </div>
            </div>
        </div>
        <div class="col-md-12 mb-5 mt-5">
            <div class="mb-3 mt-3">
                <label for="pPlaceInfo" class="form-label"><h4>공간 소개</h4></label>
                <textarea class="form-control form-control-lg" id="pPlaceInfo" name ="pPlaceInfo" placeholder="공간소개를 적어주세요"style="border-radius: 0px;" rows="10"></textarea>
            </div>
        </div>
        <div class="col-md-12 mb-5 mt-3">
            <div class="mb-3 mt-3">
                <label for="pCautionInfo" class="form-label"><h4>예약 시 주의사항</h4></label>
                <textarea class="form-control form-control-lg" id="pCautionInfo" name ="pCautionInfo" placeholder="예약 시 주의사항을 적어주세요."style="border-radius: 0px;" rows="5"></textarea>
            </div>
        </div>
        <div class ="row">
            <div class="col-md-6">
                <div class = "title ">
                    <label for = "pHp">
                        <span><h4> 연락처</h4></span>
                    </label>
                    <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 예약 시 연락이 가능한 연락처를 적어주세요!">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                        </svg>
                    </a>
                    <input type="text" class = "form-control form-control-lg onlyNumber" id = "pHp" name="pHp" style="border-radius: 0px;" placeholder="연락 가능한 연락처를 적어주세요. (숫자만 작성)" >
                </div>
            </div>
            <div class="col-md-6">
                <div class = "title ">
                    <label for = "pTime">
                        <span><h4>연락 가능 시간</h4></span>
                    </label>
                    <a href="#" class="d-inline-block" data-toggle="tooltip" title="
                            • 연락가능 시간을 정해주세요. (예)10시 부터 22시">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                        </svg>
                    </a>
                    <input type="text" class = "form-control form-control-lg" id = "pTime" name="pTime" style="border-radius: 0px;" placeholder="연락 가능 시간을 정해주세요. (예)10시 부터 22시" >
                </div>

            </div>
        </div>


        <div id='image' class=" mt-5">
            <h4>공간 사진 업로드</h4>
            <input type='file' id='pImage' name="pImage" accept=".jpg, .png, .gif" multiple='multiple' />
            <div id='att_zone' data-placeholder='공간사진을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
        </div>

        <div class = "Address">
            <div class=" col-md-12 mb-3 mt-3">
                <label for="pAddress1">
                    <span><h4>주소</h4></span>
                </label>
                <input type="text" class="form-control" id="pAddress1" name="pAddress1" style="border-radius: 0px;"placeholder="우편번호 찾기를 눌러주세요" size="70" readonly required>
                <div class="invalid-feedback">
                    주소를 입력해주세요.
                </div>
                <br>
                <input type="button" class="btn  btn-sm btn-block text-white" style="background: #00DBAF" id="searchZipBtn2" name="searchZipBtn2" value="우편번호 찾기">
            </div>

            <div class=" col-md-12 mb-5">
                <label for="pAddress2">
                    <span><h4>상세 주소</h4></span>
                </label>
                <input type="text" class="form-control" id="pAddress2" name="pAddress2"style="border-radius: 0px;" placeholder="상세주소를 입력해주세요." size="70" required>
                <div class="invalid-feedback">
                    상세 주소를 입력해주세요.
                </div>
            </div>
        </div>
        <hr>

        <div class=" d-flex justify-content-center">
            <input type="submit" id="button" class="btn  btn-lg btn-block text-white m-5 " style="background: #00DBAF" value="공간 등록" >
        </div>

    </form>


</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>

<script>
    $(document).ready(function() {
        $('#spaceType').change(function() {
            var result = $('#spaceType option:selected').val();
            if (result == '자동차') {
                $("input#spaceType_d").attr("placeholder", "차량번호와 상세 공간을 적어주세요.");
                $('.Address').hide();
            } else {
                $("input#spaceType_d").attr("placeholder", "공간 유형을 상세하게 적어주세요.");
                $('.Address').show();
            }
        });
    });
    $(".onlyNumber").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9\s]/gi,''));
        }
    });


</script>
<script>
    ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
        imageView = function imageView(att_zone, btn){

            var attZone = document.getElementById(att_zone);
            var pImage = document.getElementById(btn)
            var sel_files = [];

            // 이미지와 체크 박스를 감싸고 있는 div 속성
            var div_style = 'display:inline-block;position:relative;'
                + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
            // 미리보기 이미지 속성
            var img_style = 'width:100%;height:100%;z-index:none';
            // 이미지안에 표시되는 체크박스의 속성
            var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';

            pImage.onchange = function(e){
                var files = e.target.files;
                var fileArr = Array.prototype.slice.call(files)
                for(f of fileArr){
                    imageLoader(f);
                }
            }


            // 탐색기에서 드래그앤 드롭 사용
            attZone.addEventListener('dragenter', function(e){
                e.preventDefault();
                e.stopPropagation();
            }, false)

            attZone.addEventListener('dragover', function(e){
                e.preventDefault();
                e.stopPropagation();

            }, false)

            attZone.addEventListener('drop', function(e){
                var files = {};
                e.preventDefault();
                e.stopPropagation();
                var dt = e.dataTransfer;
                files = dt.files;
                for(f of files){
                    imageLoader(f);
                }

            }, false)



            /*첨부된 이미리즐을 배열에 넣고 미리보기 */
            imageLoader = function(file){
                sel_files.push(file);
                var reader = new FileReader();
                reader.onload = function(ee){
                    let img = document.createElement('img')
                    img.setAttribute('style', img_style)
                    img.src = ee.target.result;
                    attZone.appendChild(makeDiv(img, file));
                }

                reader.readAsDataURL(file);
            }

            /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
            makeDiv = function(img, file){
                var div = document.createElement('div')
                div.setAttribute('style', div_style)

                var btn = document.createElement('input')
                btn.setAttribute('type', 'button')
                btn.setAttribute('value', 'x')
                btn.setAttribute('delFile', file.name);
                btn.setAttribute('style', chk_style);
                btn.onclick = function(ev){
                    var ele = ev.srcElement;
                    var delFile = ele.getAttribute('delFile');
                    for(var i=0 ;i<sel_files.length; i++){
                        if(delFile== sel_files[i].name){
                            sel_files.splice(i, 1);
                        }
                    }

                    dt = new DataTransfer();
                    for(f in sel_files) {
                        var file = sel_files[f];
                        dt.items.add(file);
                    }
                    pImage.files = dt.files;
                    var p = ele.parentNode;
                    attZone.removeChild(p)
                }
                div.appendChild(img)
                div.appendChild(btn)
                return div
            }
        }
    )('att_zone', 'pImage')

</script>

<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
</body>
</html>
