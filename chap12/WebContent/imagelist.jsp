<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 리스트</title>
<style>
  body {
    background-color: #FCEFF5;
    text-align: center; /* Center align the content within the body */
  }
  
  h1 {
    margin-top: 20px; /* Add some top margin for spacing */
  }
  
  ul {
    list-style-type: none;
    padding: 0;
  }
  
  li {
    margin-bottom: 10px;
    padding: 10px;
    border-radius: 5px;
    display: flex;
    align-items: center;
    justify-content: space-between; /* Evenly distribute the content within the list item */
    background-color: none; /* Remove the background color */
    border-bottom: 1px solid gray; /* Add a bottom border to create a separator line */
  }
  
  span.label {
    display: inline-block;
    padding: 5px 10px;
    background-color: #CEE3F6;
    color: gray;
    font-weight: bold;
    border-radius: 5px;
    margin-right: 20px; /* Increase the margin value to adjust the spacing */
    width: 33.33%; /* Divide the available space equally */
  }
  
  a {
    color: gray;
    text-decoration: none;
    width: 33.33%; /* Divide the available space equally */
    font-size: 16px; /* Increase the font size */
  }
  
  a:hover {
    text-decoration: underline;
  }
  
  input[type="checkbox"] {
    vertical-align: middle;
    width: 33.33%; /* Divide the available space equally */
    transform: scale(1.5); /* Increase the size of the checkbox */
  }
  
  img {
    border: 1px solid gray;
    border-radius: 5px;
    margin-right: 10px;
    width: 33.33%; /* Divide the available space equally */
  }
  
  .footer {
    text-align: center;
    margin-top: 50px;
    color: #999;
    font-size: 14px;
	}
	
	.intro {
    text-align: center;
    margin-bottom: 30px;
}
</style>
</head>
<body>
  <div >
    <h1>♥ YEJI HOMEPAGE ♥</h1>
        <div class="intro">
            <p>HELLO THIS IS MY PAGE</p>
        </div>
    
    <ul>
      <li>
        <span class="label">이미지</span>
        <span class="label">이미지 이름</span>
        <span class="label">선택하기</span>
      </li>
      <% for(int i = 1; i <= 10; i++) { %>
        <li>
          <a href="https://search.naver.com/search.naver?where=image&sm=tab_jum&query=%EC%AB%84%EB%9D%BC%EB%A7%A8">
            <img alt="쫄라맨" src="images/sad.jpg" width="100px" height="100"/>
          </a>
          <a href="#" style="color: gray; font-size: 18px;">쫄라맨<%=i %></a>
          <a href="#"><input type="checkbox"/></a>
        </li>
      <% } %>
    </ul>
      <div class="footer">
         <p>Copyrigth. 2023 yedy. All rights reserved.</p>
       </div>
  </div>
</body>
</html>
