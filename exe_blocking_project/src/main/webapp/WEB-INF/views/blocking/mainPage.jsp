<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/flatly/bootstrap.min.css" integrity="sha384-qF/QmIAj5ZaYFAeQcrQ6bfVMAh4zZlrGwTPY7T/M+iTTLJqJBJjwwnsE5Y0mV7QK" crossorigin="anonymous">

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<style>
    #popUpStyle {
        margin-top : 150px; 
        margin-left: 500px; 
        border: 5px solid #2c3e50;  
        width: 800px; 
        padding :80px 50px 80px 110px; 
        border-radius: 50px;
    }
    body {
        color: #2c3e50;
    }

    ul {
        padding: 16px 0;
    }

    ul li {
        display: inline-block;
        margin: 0 5px;
        font-size: 14px;
        letter-spacing: -.5px;
    }

    form {
        padding-top: 16px;
    }

    ul li.tag-item {
        padding: 4px 8px 8px 8px;
        margin: 5px;
        background-color: #dcdbdb;
        color: #000;
        box-sizing: border-box;
        display: inline-block;
    }

    .tag-item:hover {
        background-color: #b6b6b6;
        color: #fff;
    }

    .del-btn {
        font-size: 12px;
        font-weight: bold;
        cursor: pointer;
        margin-left: 8px;
    }

</style>
</head>
<body>

    <script>
        /* 새로고침 */
        window.onpageshow = function (event) {

            // 새로고침: window.performance.navigation.type == 1
            // 뒤로가기: window.performance.navigation.type == 2
            if (event.persisted || (window.performance && (window.performance.navigation.type == 1 || window.performance.navigation.type == 2))) {
                
                if (('sessionStorage' in window) && window['sessionStorage'] !== null) {
                    // sessionStorage에 저장된 chkbox id 조회 
                    param = sessionStorage.getItem('fixChkVal');

                    var chkboxArray = param.split(','); // 배열로 다시 만들기 

                    for (var i = 0; i < chkboxArray.length; i++) {
                        var trimStr = chkboxArray[i].trim(); // 공백 제거 
                        var fixChkBox = document.getElementById(trimStr); // 체크박스 아이디값 = 저장된 아이디값 일치하는것만 고르기

                        if (fixChkBox) {
                            fixChkBox.checked = true; // 체크 유지 
                        }
                    }
                }
            }
        }

        /* 고정확장자 */
        function chkFixedExe(obj) {
            var chkVal = {
                exeType: '고정 확장자'
            };
            var exeNmArray = []; // 체크된 값들을 저장할 배열
            // 체크된 고정 확장자들 
            $("input[name=chkExe]:checked").each(function () {
			    var data = this;
			    var dataValue = $(data).val() + "";
			    exeNmArray.push(dataValue); // 배열에 값 추가
			});
            var dataId = 'exeNm';
            var exeNmStr = exeNmArray.join(','); // ','로 값들을 연결 

            chkVal[dataId] = exeNmStr;
           	console.log(chkVal);

            // 세션에 저장
            sessionStorage.setItem('fixChkVal', exeNmStr);

            $.ajax({
                url: "/fixedChkSave.do",
                type: 'get',
                data: chkVal,  
                success: function (data) {
                    alert("저장하였습니다.");
                },
                error: function () {
                    alert("error");
                }
            });
        }


        /* 커스텀 확장자 */
        function addCustom() {

            var customExeInput = $('#customExe');
            var customExe = $('#customExe').val();
            // '.'을 제거한 값을 가져옴
            var clearCustomExe = customExe.replace(/\./g, '');

            $.ajax({
                url: "/customExeSave.do",
                type: 'get',
                data: { exeNm: clearCustomExe },  
                dataType : "Text",
                success: function (data) {
                    alert("저장하였습니다.");
                    customExeInput.val("");
                    
                    var tag = {};
                    var counter;
                    for (counter = 0; counter < data.length && counter < 200; counter++) {
                        tag[counter] = data[counter];
                    }
                    $("#tagList").append("<li class='tag-item'>" + clearCustomExe + "<span class='del-btn' id='"+ clearCustomExe +"' onclick='delCustom(\"" + clearCustomExe + "\")'>x</span></li>");
                    // $("#tagCount").text(addCount); // 하나씩 추가될때마다 1씩 올라야함 
                },
                error: function () {
                    alert("error");
                }
            });
            
        }


        /* 커스텀 확장자 삭제 */
        function delCustom(clearCustomExe) {
            var exeNm = clearCustomExe;
            $.ajax({
                url: "/delCustom.do",
                type: 'get',
                data: { exeNm: exeNm },
                success: function (data) {
                    alert("삭제되었습니다.");
                    
                    // 화면에서 삭제
                    $('#' + exeNm).parent().remove();
                },
                error: function () {
                    alert("error");
                }
            });


        }


    </script>

    <div id="popUpStyle">
    	<div>
	        <h2><i class="bi bi-file-earmark-x"></i> 파일 확장자 차단</h2>
	        <hr style="width:550px; margin:0px;"/>
	        <h5 style="padding:20px; padding-top: 15px; padding-left:0px;">파일 확장자에 따라 특정 형식의 파일을 첨부하거나 전송하지 못하도록 제한</h5>
        </div>
        
        <table width="550px;">
            <thead>
                <tr>
                    <td style="padding:10px; padding-left: 0px; font-weight:600;">고정 확장자</td>
                    <td style="padding-left:25px;">
                        <input type="checkbox" id="bat" value="bat" name="chkExe" onchange="chkFixedExe(this)" class="form-check-input">
                            <label for="bat" class="form-check-label" style="padding-right:30px;">bat</label>
                            
                        <input type="checkbox" id="cmd" value="cmd" name="chkExe" onchange="chkFixedExe(this)" class="form-check-input">
                            <label for="cmd" class="form-check-label" style="padding-right:30px;">cmd</label>
                            
                        <input type="checkbox" id="com" value="com" name="chkExe" onchange="chkFixedExe(this)" class="form-check-input">
                            <label for="com" class="form-check-label" style="padding-right:30px;">com</label>
                            
                        <input type="checkbox" id="cpl" value="cpl" name="chkExe" onchange="chkFixedExe(this)" class="form-check-input">
                            <label for="cpl" class="form-check-label" style="padding-right:30px;">cpl</label>
                            
                        <input type="checkbox" id="exe" value="exe" name="chkExe" onchange="chkFixedExe(this)" class="form-check-input">
                            <label for="exe" class="form-check-label" style="padding-right:30px;">exe</label>
                            
                        <input type="checkbox" id="scr" value="scr" name="chkExe" onchange="chkFixedExe(this)" class="form-check-input">
                            <label for="scr" class="form-check-label" style="padding-right:30px;">scr</label>
                            
                        <input type="checkbox" id="js" value="js" name="chkExe" onchange="chkFixedExe(this)" class="form-check-input">
                            <label for="js" class="form-check-label" style="padding-right:30px;">js</label>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 10px; padding-left: 0px; font-weight:600;">커스텀 확장자</td>
                    <td>
                        <input id="customExe" placeholder='확장자 입력' maxlength="20" style="display: inline-block; width: 300px;">
      					<button class="btn btn-primary" type="button" id="addCustomBtn" onclick="addCustom()">추가</button>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div id="customArea" style="width:400px; display: block; border: 1px solid; border-radius: 5px; border-color: silver;">                        
                            <div>
                                <span id="tagCount">0</span>/200
                            </div>
                            <ul id="tagList">
                            </ul>
                        </div>
                    </td>
                </tr>
            </thead>
        </table>

    </div>
    
</body>
</html>