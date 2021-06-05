<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<html>
<head>
    <link rel="stylesheet" href="css/style.css">
    <meta charset="ISO-8859-1">
    <title>H+ Sport</title>

</head>
<body>
<header id="home" class="header">
    <nav class="nav" role="navigation">
        <div class="container nav-elements">
            <div class="branding">
                <a href="#home"><img src="images/hpluslogo.svg"
                                     alt="Logo - H Plus Sports"></a>
            </div>
            <!-- branding -->
            <ul class="navbar">
                <li><a href="home">home</a></li>
                <li><a href="redirect">linkedIn</a></li>

            </ul>
            <!-- navbar -->
        </div>
        <!-- container nav-elements -->
    </nav>
    <!-- <div class="container tagline">
<h1 class="headline">Our Mission</h1>
<p>We support and encourage <em>active and healthy</em> lifestyles, by offering <em>ethically sourced</em> and <em>eco-friendly</em> nutritional products for the <em>performance-driven</em> athlete.</p>
</div>container tagline -->
</header>
<!-- #home -->
<section>
    <%--		display date and time for today--%>
    <%=displayDate()%>
</section>

<span class="success" >${dataSaved}</span>
<section id="login" class="section">
    <div class="container tagline">
        <%
            if(request.getAttribute("error") != null){
        %>
        <%=request.getAttribute("error")%><br />
        <%
            }
        %>
        <em>LOGIN USER</em>
        <%--@elvariable id="login" type=""--%>
        <form:form action="/Login" method="post" modelAttribute="login" >
            <label>Username</label>
            <form:input path="username" id="username" /><br />
            <label>Password</label>
            <form:password path="password" id="password" /><br />
            <input type="submit" value="Login" />
        </form:form>
    </div>
</section>
<a href="/goToRegister">Register</a>
<!-- #products -->

<footer class="footer">
    <div class="container">

        <nav class="nav" role="navigation">
            <div class="container nav-elements">
                <div class="branding">
                    <a href="#home"><img src="images/hpluslogo.svg"
                                         alt="Logo - H Plus Sports"></a>
                    <p class="address">
                        100 Main Street<br> Seattle, WA 98144
                    </p>
                </div>
            </div>
        </nav>
        <p class="legal">H+ Sport is a fictitious brand created by
            lynda.com solely for the purpose of training. All products and
            people associated with H+ Sport are also fictitious. Any resemblance
            to real brands, products, or people is purely coincidental.
            Information provided about the product is also fictitious and should
            not be construed to be representative of actual products on the
            market in a similar product category.</p>
    </div>
    <!-- container -->
</footer>
<!-- footer -->
<%!
    public String displayDate(){
        SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd hh:mm");
        Date date = Calendar.getInstance().getTime();
        return dateFormat.format(date);
    }
%>
</body>
</html>