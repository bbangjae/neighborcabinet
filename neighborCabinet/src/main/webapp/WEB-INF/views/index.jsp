<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
  <head>
    <title>이웃 캐비닛</title>
    <link rel="stylesheet" type="text/css" href='<c:url value="/css/index.css"/>'>
    <script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
    <script src="<c:url value="/js/index.js"/>"></script>
  </head>
  <body>
    <div id="wrap">
      <div id="header">
        <c:import url="/WEB-INF/views/layout/header.jsp"/>
      </div>
      <div id="nv_bar">
      </div>
      <div id="container">
        <div id="section1">
            <div class="section_inner" id="s1_inner">
              <div class="text">
                모두를 위한
                <br>
                손쉬운 캐비닛
              </div>
            </div>
        </div>
        <div id="section2">
          <div class="section_inner" id="s2_inner">
            <div class="text">
              근처 어디에서나
              <br>
              크기에 상관없이 짐을 맡겨보세요.
            </div>
          </div>
        </div>
        <div id="section3">
          <div class="section3_inner">
            <div class="section3_header">
              <p>이웃집 캐비닛의
                <br>
                장소대여의 새로운 패러다임</p>
            </div>
            <div class="section3_content" id="s3_ct1">
              <div class="s3">
                <div class="image">
                <img src="image/content1.webp">
                </div>
                <div class="text">
                  <div class="s3_title">
                    어디서나 간편하게
                  </div >
                  <div class="s3_sub">
                    근처 어디에서나 크기에<br>
                    상관없이 짐을 맡기세요.
                  </div>
                </div>

              </div>
            </div>
            <div class="section3_content" id="s3_ct2">
              <div class="s3_2">
                <div class="image">
                  <img src="image/content2.png">
                </div>
                <div class="text">
                  <div class="s3_title">
                    누구나 수익창출
                  </div >
                  <div class="s3_sub">
                    누구나 짐을 맡을 공간만 있으면<br>
                    공급자가 될 수 있어요.
                  </div>
                </div>

              </div>

            </div>
            <div class="section3_content" id="s3_ct3">
              <div class="s3" >
                <div class="image">

                  <img src="image/content3.jpg">
                </div>
                <div class="text">
                  <div class="s3_title">
                    음식도 안전하게
                  </div >
                  <div class="s3_sub">
                    녹기 쉬운 까다로운 음식도 맡기세요.
                  </div>
                </div>

              </div>
            </div>
            <div class="section3_content" id="s3_ct4">
              <div class="s3_2">
                <div class="image">
                  <img src="image/content4.jpg">
                </div>
                <div class="text">
                  <div class="s3_title">
                    픽업도 가능한
                  </div >
                  <div class="s3_sub">
                    언제 어디서나 받아 볼 수 있어요.
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>

        <div id="section4" class="section_4_5">
          <div class="s4_5_inner">
            <div class="section_img">
              <div><img src="image/map.png"></div>

            </div>
            <div class="section_text">
              <div id="s4_title" class="title">
                  언제 어디서나 보관


              </div>
              <div id="s4_sub" class="sub">
                  지금 보관해보세요


              </div>
              <div class="s4_5_button">
                <button class="s4_b" type="button" style="margin-right: 50px;">
                  대여로 이동
                </button>
                <button class="s4_b" type="button">
                  가이드 보기
                </button>
              </div>

            </div>

          </div>

        </div>
        <div id="section5" class="section_4_5">
          <div class="s4_5_inner">

            <div class="section_text">
              <div id="s5_title" class="title">
                너도 돈 벌 수 있어 임마


              </div>
              <div id="s5_sub" class="sub">
                지금 당장 신청하세요

              </div>
              <div class="s4_5_button">
                <button class="s5_btn" type="button" style="margin-right: 50px;">
                  장소 등록
                </button>
                <button class="s5_btn" type="button">
                  가이드 보기
                </button>
              </div>
            </div>
            <div class="section_img">

              <div><img src="image/map.png"></div>

            </div>
          </div>



        </div>
        <div id="footer"></div>
      </div>


      </div>



  </body>
</html>
