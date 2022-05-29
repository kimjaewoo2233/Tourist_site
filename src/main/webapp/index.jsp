<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="./main2.css">
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>

    <script src="//cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/ScrollMagic.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/plugins/debug.addIndicators.min.js"></script>

    <script defer src="./main.js"></script>
    <script>
    		var username = '<%= session.getAttribute("username") %>';
    		console.log(username);
    		if(username == 'null'){
    			location.href = 'login.jsp';
    		}
    </script>
  </head>
  <body>
   
   
        <header>
         <div class="main_menu">
            <ul>
              <li><a class="active" href="#story">story</a></li>
              <li><a href="#board">board</a></li>
              <li><a href="#news">News</a></li>
              <li><a href="/Web_jsp/login?status=logout">Logout</a></li>
            </ul>
         </div>
          <div class="swiper">
            <div class="swiper-wrapper">
              <div class="swiper-slide"><img src="images/walking_trail.png" alt=""></div>
              <div class="swiper-slide"><img src="images/walking_trail2.png" alt=""></div>
              <div class="swiper-slide"><img src="images/back3.png" alt=""></div>
              <div class="swiper-slide"><img src="images/back4.png" alt=""></div>
              <div class="swiper-slide"><img src="images/back5.png" alt=""></div>
            </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
          </div>
        </header>
        <section>
          <div class="marg spy"  id="story">
                <div>
                  <% if(session.getAttribute("username") != null){
                	  out.print(session.getAttribute("username")+"님의");
                	  
                  } %>여행의 추억을 밑에 공간에 남겨보세요
                </div>
          </div>
        </section>
        <section class="center spy">
                    <div class="container-first">
                        <img src="images/center_img1.png" class="center_img" alt="1" width="400px" height="400px"/>
                    </div>
                    <div class="container-two">
                        <img src="images/center_img2.png" class="center_img" alt="1" width="400px" height="400px"/>
                    </div>
                    <div class="container-three">
                        <img src="images/center_img3.png" class="center_img" alt="1" width="400px" height="400px"/>
                    </div>
        </section>
        <section class="description spy" id="news">
                    <div class="des-left">
                        <span class="des-title">코로나 제한이 풀린 춘천</span><br>
                        <span class="des-content">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                           코로나로 인해 살찐 지방 최고에 시설에서 불태우다!</span>
                    </div>

                    <div class="des-right">
                            <img src="images/sport1.png" alt="img" width="400"/>
                    </div>
        </section>
      <section class="h-description spy">

                  <div class="des-two-left">
                          <img src="images/des_img1.png" style="border-radius: 40px 50px / 50px  40px;" alt="img"/>
                  </div>
                  <div class="des-two-right">
                    <span class="des-title" style="font-size: 60px;">춘천은 언제나 당신을 기다립니다.</span><br>
                    <span class="des-two-content">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                       힘든 등산길을 올라 케이블 카를 타는 맛은 춘천 외에는 없다!</span>
                </div>
       </section>
       <c:if test="${ not empty list }">
       <section class="board-container spy" id="board">
            <table border="1">
                  <caption>우리들에 이야기</caption>
                  <tr>
                    <th style="width: 8%;">번호</th>
                    <th style="width: 10%;">작성자</th>
                    <th style="width: 60%;">제목</th>
                    <th style="width: 10%;">자료</th>
                    <th style="width: 10%;">등록일</th>
                  </tr>
                  <c:forEach items="${ list }" var="row" varStatus="loop">
                  <tr>
                  	<td>${ row.id }</td>
                  	<td>${ row.name }</td>
                  	<td>${ row.title }</td>
                  	<td>${ row.ofile }</td>
                  	<td>${ row.dateCreated }</td>
                  </tr>
                  </c:forEach>
              
                 
                  <button class="w-btn-neon2" type="button" onclick="location.href='board/board.jsp'">
                    자세히보기
            </button>
                </table>
       </section>
       </c:if>
       <footer class="fot">
          <div class="ft-font">
            방문해주셔 감사합니다.<br>
            한림대학교 전자공학과 17학번 김재우입니다.
          </div>

       </footer>
  </body>
</html>
