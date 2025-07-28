
//date객체 획득. 가변
var today = new Date();
//today 보조. 고정
var date = new Date();
//선택되있던 셀 객체 저장
var selectedCell;
//오늘에 해당하는 월
var realMonth = date.getMonth()+1;
var realToDay = date.getDate()
//선택된 월, 일
var selectedMonth = null;
var selectedDate = null;

//예약가능 요일 계산해 배열 (일~월, 가능0 불가능1)
const possibleDay = "<%=possibleDay%>";

//전달 달력
function prevCalendar(){
    if (today.getMonth() < realMonth){
        alert("예약은 금일기준 다음날부터 30일 이후까지만 가능합니다.");
        return false;
    }
    today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
    buildCalendar();
}
//다음달 달력
function nextCalendar(){
    if(today.getMonth()+1 == (realMonth + 1)){
        alert("예약은 금일기준 다음날부터 30일 이후까지만 가능합니다.");
        return false;
    }
    today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
    buildCalendar();
}
//달력 제작 (이번달 기준)
function buildCalendar(){
    row = null;
    cnt = 0;
    firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
    lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
    //현재 참조중인 월
    nowMonth = today.getMonth()+1;
    //이번달이면 0, 다음달이면 1 리턴
    monthEquals = thisMonth(nowMonth, realMonth);
    //달력 객체
    var calendarTable = document.getElementById("calendar");
    //달력의 타이틀 객체 획득
    var calendarTableTitle = document.getElementById("calendarTitle");
    //타이틀 수정
    calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";

    //테이블 초기화
    while(calendarTable.rows.length > 2){
        calendarTable.deleteRow(calendarTable.rows.length -1);
    }

    //셀 입력을 위해 테이블 개행
    row = calendarTable.insertRow();

    //달의 첫 날 전까지 빈 셀 생성
    for(i = 0; i < firstDate.getDay(); i++){
        cell = row.insertCell();
        cnt += 1;
    }

    //요일 입력 (셀 생성)
    for(i = 1; i <= lastDate.getDate(); i++){
        //예약하지 못하는 조건일경우 +1씩 되므로, noCount가 0일 시에만 클릭함수를 적용
        noCount = 0;
        cell = row.insertCell();
        //cell에 id 부여
        cell.setAttribute('id', i);
        cell.innerHTML = i;
        //cell.innerHTML = '<label onclick="prevCalendar()">' + i + '</label>';
        cell.align = "center";

        //셀 생성 후 count 증가
        cnt += 1;

        //cnt % 7 == 1이면 일요일이므로 빨갛게
        if (cnt % 7 == 1) {
            cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
        }

        //일주일 입력 완료시 개행
        if (cnt % 7 == 0){
            //cnt % 7 == 0이면 토요일이므로 파랗게
            cell.innerHTML = "<font color=skyblue>" + i + "</font>";
            row = calendar.insertRow();
        }
        //예약불가일 색상변경 (오늘 이전 또는 30일 이후) 및 사용자가 직접 지정한 경우
        etp = exchangeToPosibleDay(cnt)*1;

        if (nowMonth == realMonth && i <= realToDay) {
            noCount +=1;
        } else if (nowMonth > realMonth && i > realToDay) {
            noCount +=1;
        } else if (possibleDay[etp] == 1){
            noCount +=1;
        }
        if (noCount > 0){
            cell.style.backgroundColor = "#E0E0E0";
            cell.innerHTML = "<font color='#C6C6C6' >" + i + "</font>";
        } else {
            cell.onclick = function(){
                selectedTimeAndTotalPriceInit();
                //선택된 날의 연, 월, 일 계산 (일자의 경우 id속성 참조)
                clickedYear = today.getFullYear();
                clickedMonth = (1 + today.getMonth());
                clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
                clickedDate = this.getAttribute('id');
                clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;

                clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;

                //하단에 예약일시 표시
                inputField = document.getElementById("selectedDate");
                inputField.value = clickedYMD;
                //선택된 월, 일 변수 저장
                selectedMonth = today.getMonth() + 1;
                selectedDate = this.getAttribute('id');

                //선택된 셀 색 변화
                if(selectedCell != null){
                    selectedCell.bgColor = "#FFFFFF";
                }
                selectedCell = this;
                this.bgColor = "#fbedaa";
                //time table 생성

            }
        }

    }

function prevCalendar(){
    today = new Date (today.getFullYear(), today.getMonth()-1, today.getDate());
    buildCalendar();
}
function nextCalendar(){
    today = new Date (today.getFullYear(), today.getMonth()+1, today.getDate());
    buildCalendar();
}

function tableinit(){
    timeTableMaker(selectedMonth, selectedDate);
    selectedTimeAndTotalPriceInit();
    buildCalendar();
}

var price = "<%=price%>";
var startTime = "<%=startTime%>";
var endTime = "<%=endTime%>";
//선택된 시간중 가장 빠른/늦은 시간;
var selectedFirstTime = 24*1;
var selectedFinalTime = 0*1;
//예약시간표를 만들 table객체 획득

function timeTableMaker(selectedMonth, selectedDate){
    row = null
    month = selectedMonth;
    date = selectedDate;
    var timeTable = document.getElementById("timeTable");

    //테이블 초기화
    while(timeTable.rows.length > 0){
        timeTable.deleteRow(timeTable.rows.length-1);
    }

    for (i = 0; i < endTime - startTime; i++){
        //곱해서 숫자타입으로 변환
        cellTime = startTime*1 + i;

        cellStartTimeText = cellTime + ":00";
        cellEndTimeText = (cellTime + 1) + ":00";
        inputCellText = cellStartTimeText + " ~ " +  cellEndTimeText;

        //셀 입력을 위해 테이블 개행
        row = timeTable.insertRow();
        //해당 row의 셀 생성
        cell = row.insertCell();
        //cell에 id 부여
        cell.setAttribute('id', cellTime);
        //셀에 입력
        cell.innerHTML = inputCellText;
        //selectedCell.bgColor = "#FFFFFF";
        //cell.innerHTML = "<font color='#C6C6C6' >" + inputCellText + "</font>";
        //클릭이벤
        cell.onclick = function(){
            cellTime = this.getAttribute('id');
            cellTime = cellTime*1;
            console.log("first : " + selectedFirstTime + ", selectedFinalTime : " + selectedFinalTime + ", selected : " + cellTime);
            //예약일시 입력처리
            if (selectedFirstTime != 24 && selectedFinalTime != 0){
                if(cellTime < selectedFirstTime - 1){
                    alert("연속한 시간만 예약가능합니다.");
                    return false;
                }
                if (cellTime > selectedFinalTime + 1){
                    alert("연속한 시간만 예약가능합니다.");
                    console.log(cellTime + ">" + selectedFinalTime + 1)
                    return false;
                }
            }
            this.bgColor = "#fbedaa";
            if (cellTime < selectedFirstTime) {
                selectedFirstTime = cellTime
            }
            if (cellTime > selectedFinalTime) {
                selectedFinalTime = cellTime
            }

            //하단의 예약일시에 시간 표시
            resTime  = selectedFirstTime + ":00 ~ " + (selectedFinalTime + 1) + ":00";

            resTimeForm = document.getElementById("selectedTime");
            resTimeForm.value = resTime;

            //하단의 결제정보에 가격정보 표시
            useTime = (selectedFinalTime + 1) - selectedFirstTime;

            useTimeForm = document.getElementById("totalPrice");
            useTimeForm.value = useTime * price;

        }
    }
    //JSON으로 테이블 td 핸들링
    //이번달 0 다음달 1
    nowMonth = today.getMonth()+1;
    checkMonth = thisMonth(nowMonth, realMonth);
    var json = [];
    if(checkMonth == 0){
        json = <%=thisMonthResData%>;
    } else {
        json = <%=nextMonthResData%>;
    }
    for(i = 0; i < Object.keys(json).length; i++){
        if (date == json[i].date){
            jsonObject = json[i];
            for(j = 0; j < jsonObject.startNum.length; j++){
                startNum = jsonObject.startNum[j];
                shareTime = jsonObject.shareTime[j];
                console.log("startNum: " + startNum + ", shareTime : " + shareTime);
                for(k = startNum; k < startNum*1 + shareTime; k++){
                    cell = timeTable.rows[k].cells[0];
                    cell.style.backgroundColor = "#E0E0E0";
                    cell.style.color = '#C6C6C6';
                    cell.onclick = function(){};
                }
            }
        }
    }
}

