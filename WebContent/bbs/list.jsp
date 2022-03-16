<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리스트페이지</title>
<link rel="stylesheet" href="/style/style_Common.css">
</head>
<body>
	<div id="wrap">
		<nav id="nav">
			<ul id="navList" class="dFlex">
				<li class="navLi"><a href="#">칫솔</a></li>
				<li class="navLi"><a href="#">치약</a></li>
				<li class="navLi"><a href="#">키즈 제품</a></li>
				<li class="navLi"><a href="#">휴대용 세트</a></li>
				<li class="navLi"><a href="#">구강 관리 제품</a></li>
			</ul>
		</nav>
		<!-- nav#nav -->


		<main id="main" class="dFlex">


			<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/shop" // community 대신 D/N
				+ "?useUnicode=ture" // unicode를 사용한다
				+ "&characterEncoding=UTF-8" // 인코딩은 UTF-8 이다.
				+ "&useSSL=false" // 보안 관련 미적용한다
				+ "&serverTimezone=UTC";
				String user = "root";
				String password = "1234";
				conn = DriverManager.getConnection(url, user, password);

				String sql = "select no, company, text, price, sale, salePer, uploadDate, image from list order by no";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);

				while (rs.next()) {
					int no = rs.getInt("no");
					String company = rs.getString("company");
					String text = rs.getString("text");
					int price = rs.getInt("price");
					int sale = rs.getInt("sale");
					int salePer = rs.getInt("salePer");
					Date uploadDate = rs.getDate("uploadDate");
					String image = rs.getString("image");

					int afterSale = (price - (price * salePer / 100));
			%>


			<div class="main_container">
				<div class="hidden">
					<span class="uploadDate"><%=uploadDate%></span> <span
						class="saleHidden"><%=sale%></span>
				</div>
				<div class="image">
					<img src="/images/<%=image%>" alt="상품이미지" />
				</div>
				<!-- div.image -->

				<div class="title">

					<p class="titleContent">
						<span class="company"><%=company%></span> <span class="text"><%=text%></span>
					</p>

				</div>
				<!-- div.title -->

				<div class="price">
					<%
					String s = "";
					if (sale == 1) {
						s = "inline";
					%>
					<span class="beforeSale" style="display:<%=s%>"> <%=price%></span>
					<%
					}
					%>
					<span class="afterSale"> <%=afterSale%></span>

				</div>
				<!-- div.price -->

				<div class="etc">
					<%
					String saleMark = "";
					if (sale == 1) {
						saleMark = "inline";
					%>
					<img src="/images/icon_Sale.png" class="saleMark"
						style="display:<%=saleMark%>" alt="할인마크" />
					<%
					}
					String newMark = "";
					
					LocalDate now = LocalDate.now();
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					String formatedNow = now.format(formatter);

					if (("" + uploadDate).equals(formatedNow)) {
					newMark = "inline";
					%>
					<img src="/images/icon_New.png" class="newMark"
						style="display:<%=newMark%>" alt="신상품마크" /> <img
						src="/images/icon_Event.png" class="eventMark" alt="이벤트마크" />

					<%
					}
					%>
				</div>
				<!-- div.etc -->

			</div>
			<!-- div.main_container -->
			<%
			}
			rs.close();
			stmt.close();
			conn.close();

			} catch (ClassNotFoundException e) {
			out.print("CNFE : " + e.getMessage());
			} catch (SQLException e) {
			out.print("SQLE : " + e.getMessage());
			}
			%>


		</main>
		<!-- main#main -->

	</div>
	<!--div#wrap-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>