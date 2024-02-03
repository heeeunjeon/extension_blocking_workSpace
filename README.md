# 파일 확장자 차단 

**요약**

- 사용자가 파일 업로드 시 차단할 확장자를 설정 할 수 있는 프로그램 입니다.

<br>

**Info**
- 프로젝트 인원 : 1명

<br>

**구현 목표**

- [x] 고정 확정자 check 할 경우 db에 저장 
- [x] 고정 확정자 check 시 새로고침 시 유지
- [x] 커스텀 확장자 최대 입력 길이 20자리
- [x] 커스텀 확장자 추가 버튼 클릭시 db에 저장
- [x] 커스텀 확장자 추가 버튼 클릭시 아래 영역에 표현
- [x] 커스텀 확장자 최대 200개까지 추가 가능 (Count)
- [x] 추가 된 커스텀 확장자 x 버튼 클릭 시 db에서 삭제, 화면에서 삭제
- [x] 그외 css 및 팝업화면 같은 UI 화면 디자인
  
<br>

**시기**

- 2024년 1월 29일 ~ 2024년 02월 03일

<br>

**개발 환경**

- 운영체제: mac os Catalina
- 개발도구: STS, vscode
- 협업도구: GitHub Desktop
- DBMS: oracle DB, Sql Developer
- Server: Apache Tomcat v.8.5
- Language: Java, HTML5, CSS3, JavaScript, jQuery, JSP, Ajax, JSON, mybatis
- 디자인툴: Bootstrap
  

<br>

**메인화면**
- 고정 확장자 부분에서 다중 선택으로 자주 쓰는 확장자들 여러개 차단하도록 설정 할 수 있습니다.
- 체크된 확장자들은 새로고침 시에도 유지 가능합니다.
- 커스텀 확장자 부분에서 직접 입력한 확장자를 추가하여 설정 가능합니다.
- 커스텀 확장자 부분에서 추가한 값들은 아래 태그들로 화면에 나타납니다.
- 해당 태그들의 x 버튼을 클릭 시 삭제가 가능합니다.
- 추가된 커스텀 확장자 갯수를 보여줍니다.
<img width="1379" alt="스크린샷 2024-02-03 오후 8 15 22" src="https://github.com/heeeunjeon/extension_blocking_workSpace/assets/106657202/7f8fdc34-58d2-459e-8ca3-9017dde829f0">


