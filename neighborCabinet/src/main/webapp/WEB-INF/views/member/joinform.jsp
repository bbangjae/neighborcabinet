<%--
  Created by IntelliJ IDEA.
  User: se
  Date: 2023-01-11
  Time: 오전 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
    <script src="<c:url value='/js/searchZip.js' />"></script>
    <style>

        /*body {*/
        /*    min-height: 100vh;*/

        /*    background: -webkit-gradient(linear, left bottom, right top, from(#FFFFFF), to(#00DBAF));*/
        /*    background: -webkit-linear-gradient(bottom left, #FFFFFF 0%, #00DBAF 100%);*/
        /*    background: -moz-linear-gradient(bottom left, #FFFFFF 0%, #00DBAF 100%);*/
        /*    background: -o-linear-gradient(bottom left, #FFFFFF 0%, #00DBAF 100%);*/
        /*    background: linear-gradient(to top right, #FFFFFF 0%, #00DBAF 100%);*/
        /*}*/
h2{
    font-weight: bold;
}

    </style>
<%--    <style> @import url('https://fonts.googleapis.com/css2?family=Bakbak+One&family=Jua&family=Oswald:wght@700&family=Rowdies:wght@300&display=swap');--%>
<%--    body * {--%>
<%--        font-family: "Jua", sans-serif;--%>
<%--    }--%>
<%--    </style>--%>
    <title>회원가입</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<c:import url="/WEB-INF/views/member/chat.jsp"/>


<div class="container mt-5 ">
    <div class="input-form-backgroud ">
        <div class="input-form col-md-12 mx-auto">
            <h2 class="mb-3" align="center">회원가입</h2>

            <form class="validation-form needs-validation" id="joinForm" name="joinForm" method="post" novalidate action="<c:url value='/member/insert'/>">

                <div class=" d-flex justify-content-center">
                    <div class="col-md-4 mb-3">
                        <label for="userName">이름</label>
                        <input type="text" class="form-control onlyHangul" data-rule-required="true" id="userName" name="userName" placeholder="이름을 입력하세요" value="" size="70" required >
                            <div class="valid-feedback">
                                좋은 이름 입니다!
                        </div>
                        <div class="invalid-feedback">
                            한글만 입력 가능합니다(특수기호, 공백 사용금지).
                        </div>
                </div>
                </div>

                <div class=" d-flex justify-content-center">
                <div class="col-md-4 mb-3">
                    <label for="userNickname">별명</label>
                    <input type="text" class="form-control" id="userNickname" name="userNickname" placeholder="별명을 입력하세요" value="" size="70" required>
                    <div class="valid-feedback">
                        좋은 별명 입니다!
                    </div>
                    <div class="invalid-feedback">
                        별명을 입력해주세요(공백 사용금지).
                    </div>
                </div>
                </div>

                <div class=" d-flex justify-content-center">
                <div class=" col-md-4 mb-3">
                    <label for="userId">아이디</label>
                    <input type="text" class="form-control onlyAlphabetAndNumber" data-rule-required="true" id="userId" name="userId"  placeholder="아이디를 입력하세요" size="70" value="" >
                    <div class="valid-feedback">
                        사용가능한 아이디 입니다.
                    </div>
                    <div class="invalid-feedback">
                        아이디가 중복되었습니다.
                    </div>
                </div>
                </div>

                <div class=" d-flex justify-content-center">
                <div class="col-md-4 mb-3">
                    <label for="userPw">비밀번호</label>
                    <input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호를 입력하세요" size="70" required>
                    <div class="valid-feedback">
                        좋은 비밀번호 입니다.
                    </div>
                    <div class="invalid-feedback">
                        8~16자 영문, 숫자 를 사용하세요(공백금지).
                    </div>
                </div>
                </div>

                    <div class=" d-flex justify-content-center">
                    <div class="col-md-4 mb-3">
                    <label for="userPwchk">비밀번호확인</label>
                    <input type="password" class="form-control" id="userPwchk" name="userPwchk" placeholder="비밀번호확인을 입력하세요" size="70" required>
                        <div class="valid-feedback">
                        비밀번호가 같습니다!
                    </div>
                        <div class="invalid-feedback">
                            비밀번호가 틀립니다!
                        </div>

                    </div>
                </div>

                <div class=" d-flex justify-content-center">
                <div class=" col-md-4 mb-3">
                    <label for="userEmail">이메일</label>
                    <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="이메일을 입력하세요" size="70" value="" required>
                    <div class="invalid-feedback">
                        이메일 양식이 틀렸습니다.
                    </div>
                </div>
                </div>

                <div class=" d-flex justify-content-center">
                <div class="col-md-4 mb-3">
                    <label for="userHp">핸드폰</label>
                    <input type="text" class="form-control onlynumber" data-rule-required="true" id="userHp" name ="userHp" size="70" placeholder="-빼고 숫자만 작성하세요"  required>
                    <div class="invalid-feedback">
                        공백이있습니다.
                        </div>
                </div>
                </div>

                <div class=" d-flex justify-content-center">
                <div class="col-md-4 mb-3">
                    <label for="userZipcode">우편번호</label>
                    <input type="text" class="form-control" id="userZipcode"  name="userZipcode" placeholder="우편번호 찾기를 눌러주세요"  size="70" readonly required>
                    <div class="invalid-feedback">
                        우편번호를 입력해주세요.
                    </div>
                </div>
                </div>

                <div class=" d-flex justify-content-center">
                <div class=" col-md-4 mb-3">
                    <label for="userAddress1">주소</label>
                    <input type="text" class="form-control" id="userAddress1" name="userAddress1" placeholder="우편번호 찾기를 눌러주세요" size="70" readonly required>
                    <div class="invalid-feedback">
                        주소를 입력해주세요.
                    </div>
                    <br>
                    <input type="button" class="btn  btn-sm btn-block text-white" style="background: #00DBAF" id="searchZipBtn" name="searchZipBtn" value="우편번호 찾기">
                </div>
                </div>

                <div class=" d-flex justify-content-center">
                <div class=" col-md-4 mb-3">
                    <label for="userAddress2">상세주소</label>
                    <input type="text" class="form-control" id="userAddress2" name="userAddress2" placeholder="상세주소를 입력해주세요." size="70" required>
                    <div class="invalid-feedback">
                        상세 주소를 입력해주세요.
                    </div>

                </div>
                </div>

                <hr class="mb-4">

                <div class=" d-flex justify-content-center">
                <input type="submit" id="button" class ="btn btn-lg text-white" style="background: #00DBAF"value="가입완료"> <br> <br> <br>
                </div>
            </form>
    </div>
    </div>
</div>
<%--<script>
    window.addEventListener('load', () => {
    const forms = document.getElementsByClassName('validation-form');

    Array.prototype.filter.call(forms, (form) => {
    form.addEventListener('submit', function (event) {
    if (form.checkValidity() === false) {
    event.preventDefault();
    event.stopPropagation();
}

    form.classList.add('was-validated');
}, false);
});
}, false);
</script>--%>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>

<script>

    $('.onlyAlphabetAndNumber').keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val($(this).val().replace(/[^_a-z0-9\s]/gi,'')); //_(underscore), 영어, 숫자만 가능
        }
    });

    $(".onlyHangul").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[a-z0-9\s]/gi,''));
        }
    });
    $(".onlyNumber").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9\s]/gi,''));
        }
    });

    //유효성 여부를 저장할 변수를 만들고 초기값 true 부여
    let isNameValid=true;
    let isNickValid=true;
    let isIdValid=true;
    let isPwValid=true;
    let isPwchkValid = true;
    let isEmailValid = true;
    let isHpValid = true;

    //유저 네임 유효성 검사
    document.querySelector("#userName").addEventListener("input", function(){
        // 입력한 value 값을 읽어온다.
        let inputName=this.value;
        var namePattern = /[가-힣]/; // 유효성 패턴
        var spacePattern = /\s/; //공백 패턴
        // 한글 이름 및 ( 자음 모음 X ) 공백 테스트
        isNameValid = !namePattern.test(inputName) || spacePattern.test(inputName);
        if(isNameValid == false  ){
            this.classList.remove("is-invalid");
            this.classList.add("is-valid");
        }else{
            this.classList.remove("is-valid");
            this.classList.add("is-invalid");

        }
    });

    //유저 닉네임 유효성 검사
    document.querySelector("#userNickname").addEventListener("input", function(){
        // 입력한 value 값을 읽어온다.
        let inputNick=this.value;
        var spacePattern = /\s/; //공백 패턴
        // 닉네임 공백 테스트
        isNickValid = inputNick == "" || spacePattern.test(inputNick);

        if(isNickValid){
            this.classList.remove("is-valid");
            this.classList.add("is-invalid");
        }else{
            this.classList.remove("is-invalid");
            this.classList.add("is-valid");

        }
    });

    //유저 아이디 유효성 검사
    document.querySelector("#userId").addEventListener("input", function(){
        // 입력한 value 값을 읽어온다.
        let inputId=this.value;
        var idPattern = /[a-zA-Z0-9_-]{5,20}/;
        var spacePattern = /\s/; //공백 패턴
        // 아이디 정규식( 5~20자 알파벳,_,숫자 만 작성) 및 공백 테스트
        isIdValid = !idPattern.test(inputId) || spacePattern.test(inputId)
            $.ajax({
                type:"post",
                url:"memIdCheck",
                data: {"userId":$('#userId').val()},
                dataType:'text',
                success:function(result){
                    if(result == "no_use"){
                        document.querySelector("#userId").classList.remove("is-valid");
                        document.querySelector("#userId").classList.add("is-invalid");
                    }else{
                        document.querySelector("#userId").classList.remove("is-invalid");
                        document.querySelector("#userId").classList.add("is-valid");
                    }
                },
                error:function(){
                    alert("실패");
                },
                complete:function(){
                    // alert("작업 완료");
                }
            }); // ajax 종료

    });

    //유저 패스워드 유효성 검사
    document.querySelector("#userPw").addEventListener("input",function (){
        //입력한 value 값을 읽어온다.
        let inputPw=this.value;
        var pwPattern = /(?=.*\d)(?=.*[a-zA-ZS]).{8,16}/; // 패스워드 정규식
        var spacePattern = /\s/; //공백 패턴
        //패스워드 정규식(8~16자 영문,숫자 포함) 및 공백 테스트
        isPwValid = !pwPattern.test(inputPw)|| spacePattern.test(inputPw)

        if(isPwValid == false){
            this.classList.remove("is-invalid");
            this.classList.add("is-valid");
        }else{
            this.classList.remove("is-valid");
            this.classList.add("is-invalid");
        }
    });

    //유저 패스워드검사 유효성 검사
    document.querySelector("#userPwchk").addEventListener("input",function (){
        // 입력한 value 값을 읽어온다.
        let inputPwchk = this.value;
        let userPw = $("#userPw").val();
        // 패스워드와 값이 같은 지 검사
        isPwchkValid = inputPwchk == userPw

        if(isPwchkValid == true){
            this.classList.remove("is-invalid");
            this.classList.add("is-valid");
            isPwchkValid = false;

        }else{
            this.classList.remove("is-valid");
            this.classList.add("is-invalid");
        }
    });

    //유저 이메일 유효성 검사
    document.querySelector("#userEmail").addEventListener("input",function (){
        //입력한 value 값을 읽어온다.
        let inputEmail = this.value;
        // 이메일 정규식
        var emailPattern = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        var spacePattern = /\s/; //공백 패턴
        //이메일 유효성(@ , . 검사 ) 테스트 및 공백 테스트
        isEmailValid = !emailPattern.test(inputEmail)||spacePattern.test(inputEmail)

        if(isEmailValid == false){
            this.classList.remove("is-invalid");
            this.classList.add("is-valid");
        }else{
            this.classList.remove("is-valid");
            this.classList.add("is-invalid");
        }
    });

    //유저 휴대폰번호 유효성 검사
    document.querySelector("#userHp").addEventListener("input",function (){
        // 입력한 value 값을 읽어온다.
        let inputHp = this.value;
        var spacePattern = /\s/; //공백 패턴

        //공백패턴 test
        isHpValid = spacePattern.test(inputHp)

        if(isHpValid==false){
            this.classList.remove("is-invalid");
            this.classList.add("is-valid");
        }else{
            this.classList.remove("is-valid");
            this.classList.add("is-invalid");
        }
    });

    //유저 상세주소 유효성 검사
    document.querySelector("#userAddress2").addEventListener("input",function (){
        //1입력한 value 값을 읽어온다.
        let inputAddress2 = this.value;
        // 공백 테스트
        if(inputAddress2 == ""){
            this.classList.remove("is-valid");
            this.classList.add("is-invalid");
        }else{
            this.classList.remove("is-invalid");
            this.classList.add("is-valid");
        }
    });




    //폼에 submit 이벤트가 일어 났을때 실행할 함수 등록
    document.querySelector("#joinForm").addEventListener("submit", function(e){

        console.log(isNameValid)
        console.log(isNickValid)
        console.log(isIdValid)
        console.log(isPwValid)
        console.log(isPwchkValid+"ㅅㅂ;")
        console.log(isEmailValid)
        console.log(isHpValid)
        //만일 폼이 유효하지 않는다면 전송을 막아주기
        if(isNameValid || isNickValid ||isIdValid||isPwValid||isPwchkValid||isEmailValid||isHpValid){
            //이벤트 객체의 함수를 이용해서 폼 전송 막아주기
            e.preventDefault();
            alert("필수사항을 입력해주세요");
        }
    });

</script>
</body>
</html>