# 춘천 관광 사이트 프로젝트 
## 사용언어
* JAVA(JSP)
* HTML/CSS/JS
* bootstrap
* MYSQL,JDBC

## 프로젝트 진행이유
> JAVA Spring 공부를 진행하는데 너무 어렵고 계속해서 알 수 없는 용어들이 많이 나왔고 혼자서는 개발이 너무 어렵다 느꼈다. 그래서 몇몇 기술 블로그를 읽어보니 JSP가 웹 개발에 원리를 파악하기
> 좋다는 글을 몇번 보았다. 그래서 JSP 부터 차근차근 공부하기 시작했다. 그런 중에 학교에서 JSP 수업이 열렸고 수강하다 프로젝트 과제가 주어져 진행했다. 이 프로젝트는 온전히 학습을 하기
> 위해 진행했고 그러게 위해 많은 방법을 시도해봤다. 그렇기에 로그인부터 게시판,파일업로드,다운로드를 개발했다.

## 화면
![image](https://user-images.githubusercontent.com/79129475/181719270-6e189d62-fb1c-462f-8b70-bc58268f1dff.png)
## 로그인을 하고나서 넘어간 화면
![image](https://user-images.githubusercontent.com/79129475/181719481-9b3c3b4b-b8c6-437a-bd57-32df2cfcf927.png)
## ScrollMagic을 이용해 화면에 Scroll을 인지하여 내리면 자동으로 로그인한 유저에 정보가 나오며 --님이 나오게 만들었다.
![image](https://user-images.githubusercontent.com/79129475/181719742-8a2272af-57c6-4ce0-956f-789021d05368.png)
## 아래로 내리면 춘천에 대한 광고들이 나오게 설계했다.
![image](https://user-images.githubusercontent.com/79129475/181719968-eeebcdbc-42a8-4b76-ba35-2d4b8f133745.png)
## 가장 아래로 내리면 유저들끼리 방명록을 남길 수 있도록 개발했다. 
![image](https://user-images.githubusercontent.com/79129475/181720033-93a2e645-48cb-43d6-9a8a-dbcfaff45cf4.png)
## 자세히 보기를 누르면 게시판 화면으로 넘어간다
![image](https://user-images.githubusercontent.com/79129475/181720350-d89a3cbf-97e3-4641-8d60-0c008ef59510.png)
## 수정, 삭제, 쓰기 모두 가능하며 글쓴이가 하니면 권한없다는 경고창이 나오게 만들었다.
![image](https://user-images.githubusercontent.com/79129475/181720502-e8096d3e-9e1a-4af5-8ff5-d4d72a390c30.png)
##  파일 업로드도 가능하다
![image](https://user-images.githubusercontent.com/79129475/181720645-cb0ca98b-d5f1-4107-8c9f-3017a1990253.png)

## 시스템 구성도
> 백엔드 개발은 구성도가 먼저 만들어지지 않은 상태에서 먼저 개발하면 정말 힘들다는 걸 이 프로젝트를 하면서 느꼈다. 프로젝트를 개발할때 자세한 구성도 없이
> 그림으로 이해가도록 간단하게만 구성하고 했었는데 정말 나중에는 나도 이해하기 힘든 코드가 되었었고 다시 정리하는데 힘을 많이 썼다. 그러고나서 구성도를 다시 만들고나서
> 다시 보니까 이렇게 자세히 구성도를 작성하고 개발을 진행했다면 전에 했다는 것보다 훨씬 수월하게 개발할 수 있을 거 같다는 생각이 들었다. 내 시간을 소비하며 값 비싼 경험을 했다.
## 춘천관광 사이트 시스템 구성도
![image](https://user-images.githubusercontent.com/79129475/181721318-55f897dd-745b-4a26-a86c-c66cc69c8eea.png)
##
![image](https://user-images.githubusercontent.com/79129475/181721435-5474ef95-3cbd-4fb4-9980-47a28cf94fc1.png)
##
![image](https://user-images.githubusercontent.com/79129475/181721478-57382f2a-c445-4077-b7de-634ebfb7031b.png)
##
![image](https://user-images.githubusercontent.com/79129475/181721551-ac2ae030-da21-4c96-9f31-ec9b1e9d9e27.png)
##
![image](https://user-images.githubusercontent.com/79129475/181721596-64942081-d54b-4ae4-a7ea-98031d66951d.png)
##
![image](https://user-images.githubusercontent.com/79129475/181721634-346eae01-bded-40df-bc1b-d980907ce84b.png)
##
![image](https://user-images.githubusercontent.com/79129475/181721665-b461cbee-b49e-4d31-91db-7c10e3b5df40.png)
##
![image](https://user-images.githubusercontent.com/79129475/181721704-ffbae25e-d40d-409c-86bd-039d89f2d1f8.png)

## 아쉬웠던 점
> 이번에 아쉬웠던 것은 너무 JSP로만 개발하면서 스프링에 기능들을 못 써봤다는 것이다. JSP는 확실히 백엔드 개발 기초를 공부하기에는 좋은 방법인 거 같다. 
> 프로젝트를 하면서 많이 배웠고 왜 서비스 로직을 따로 개발하는지도 알게되었다. 따로 두지 않는다면 코드를 관리하는 것도 어렵고 무엇보다 내가 작성한 코드가 어디에 있는지
> 헷갈릴떄가 많다. 확실히 서비스 로직은 따로 분리해두는 것이 좋은 방법이다. 이제 스프링과 JPA 를 써서 개발을 빨리 해보고 싶다. 
> 그리고 이제는 개발을 시작전 구성도를 먼저 작성해야겠다는 것도 크게 깨달았다...







