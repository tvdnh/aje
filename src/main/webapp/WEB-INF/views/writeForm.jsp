<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>writeForm.jsp 글쓰기 폼</title>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>


</head>
 <h2>게시판 글쓰기폼</h2>
    <form  method="post" action="getBoard2" >	
<!-- 		<input type="hidden" name="num" value=""> -->
<!-- 		<input type="hidden" name="ref" value=""> -->
<!-- 		<input type="hidden" name="re_step" value=""> -->
<!-- 		<input type="hidden" name="re_level" value=""> -->
      	<table border="10" bgColor="pink" width="600">
	        <tr>
	          <td>글쓴이</td>
	          <td><input type="text" id="writer" name="writer" size="10"/> </td>
	        </tr>
	        <tr>
	          <td>글제목</td>
	          <td><input type="text" id="title" name="title" size="30"/> </td>
	        </tr>
	        <tr>
	          <td>이메일</td>
	          <td><input type="text" id="email" name="email" size="30"/> </td>
	        </tr>
	        <tr>
	          <td>글내용</td>
	          <td> <textArea name="content" id="content" rows="13" cols="40"></textArea></td>
	        </tr>
	        <tr>
	          <td>암호</td>
	          <td><input type="password" id="passwd" name="passwd" size="10"/> </td>
	        </tr>
	        <tr>
	          <td colspan="2" align="center">
	            <input type="button" onclick="save();" value="등록">
	            <input type="reset" value="리셋">
	          </td>
	        </tr>
     	</table>
    </form> 
    <script type="text/javascript">
$(function () {
});
     function save() {
    	 if($("#writer").val() == null || $("#writer").val() == ""){
    		 $("#id").val()
    	        alert("글쓴이 입력해 주세요!");
    	        $("#writer").val('').focus();
    	        return false;
    	      }
    	      
    	      if($("#title").val() == null || $("#title").val() == ""){
    	        alert("글제목 입력해 주세요!");
    	        $("#title").focus();
    	        return false;
    	      }		
    	      
//     	      if($("#content").val() == null || $("#content").val() == ""){
//     	        alert("글내용을  입력해 주세요!");
//     	        $("#content").focus();
//     	        return false;
//     	      }		
//     	      return true;
     
     var data = {
    	 "writer" : $("#writer").val(),
     	 "title"  :  $("#title").val()
     };
 	$.ajax({
		url: "/getBoard2",
		method: "POST",
		dataType: "json",
		contentType: "application/json; charset=UTF-8",
		data: JSON.stringify(data),
		success: function (data) {
			alert("Funding saved");

		},
		failure: function () {
			alert("Failed to save Funding.");
		},
		complete: function() {
			hideLoading();
		}
	});
}//check() 

  </script>
</body>
</html>