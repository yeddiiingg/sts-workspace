
var xhr = null;// 자바의 멤버변수 개념이다.

//사용자가 서버를 호출할 때 사용하는 함수
function sendRequest(url, param, callBack,
		method, async){
	
	//브라우저를 구별하여 xhr을 생성하자!
	if(window.ActiveXObject)
		xhr = new ActiveXObject(
				"Microsoft.XMLHTTP");
	else
		xhr = new XMLHttpRequest();
	
	//요청방식을 정하자!
	//사용자가 원하는 요청방식이 method라는 인자로
	//들어온다. 이때 대/소문자로 구별하여 
	//(Get, get, GET, gET,... 다양한 문자열로 
	//들어올 수 있으므로 개발자가 통일시켜줘야 한다.
	method = 
	(method.toLowerCase() == "get")?"GET":"POST";
	
	//요청방식에 따라 사용자가 지정한 URL이 바뀐다.
	//get방식일 때..  (ex2.jsp?v1=java)
	//post방식일 때.. (ex2.jsp)
	param = (param == null || param == "")?null:param;
	
	if(method == "GET" && param != null){
		//get방식이면서 파라미터가 있는 경우는
		//무조건 ex2.jsp?v1=java로 만들어야 한다.
		url = url+"?"+param;
	}
	
	//요청을 보내고, 응답이 도착하는 함수 지정
	//callBack이라는 변수가 기억하는 이름으로
	//도착함수로 지정!
	xhr.onreadystatechange = callBack;
	
	//요청정보 설정
	xhr.open(method, url, async);
	
	//한글처리를 위한 Http프로토콜 헤더 설정
	xhr.setRequestHeader("Content-Type",
		"application/x-www-form-urlencoded");
	
	//서버로 요청 보내기
/*	if(method == "GET")
		xhr.send(null);
	else
		xhr.send(param);
*/		
	xhr.send(method == "GET"?null:param);
}


