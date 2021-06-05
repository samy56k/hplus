<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><
<head>
    <title>Search</title>
    <link rel="stylesheet" href="css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="jquery-3.0.0.js"></script>
    <script>
        $(function () {
            $("#products h2.product-name[data-type='mineralwater']").css("background-color", "#2982D0");
            $("#products h2.product-name[data-type='vitamin']").css("background-color", "#12500F");
            $("#products h2.product-name[data-type='proteinbar']").css("background-color", "#4E0F50");

            document.querySelector('#cbVitamins').addEventListener('change',function (evt) {
                updateProductView("vitamins", evt.target.checked);
            });
            document.querySelector('#cbMineralWater').addEventListener('change',function (evt) {
                updateProductView("mineralwater", evt.target.checked);
            });
            document.querySelector('#cbProtein').addEventListener('change',function (evt) {
                updateProductView("proteinbar", evt.target.checked);
            });

            $(".product-item").each(function () {
                var prodName = encodeURIComponent($(this).children("h2").text());
                var prodID = encodeURIComponent($(this).data("prod_id"));

                var link = $("<a href='product.html?prodName=" + prodName + "&prodID=" + prodID + "'/>");
                $(this).children("img").wrap(link);
            })

        })

        function updateProductView(categoryName, bVisible) {
            // get a list of the product items for the given category.
            // Use the data attributes to narrow the list
            var dataSelectorVal = "";
            switch (categoryName) {
                case "vitamins":
                    dataSelectorVal = "h2[data-type='vitamin']";
                    break;
                case "mineralwater":
                    dataSelectorVal = "h2[data-type='mineralwater']";
                    break;
                case "proteinbar":
                    dataSelectorVal = "h2[data-type='proteinbar']";
                    break;
            }
            // use the has() function to select the li tags that are product items
            // that contain the h2 tag with the corresponding data attribute value
            $(".product-item").has(dataSelectorVal).css('display', bVisible ? "" : "none");
        }
    </script>

</head>
<header id="home" class="header">
    <nav class="nav" role="navigation">
        <div class="container nav-elements">
            <div class="branding">
                <a href="#home">
                    <img src="images/hpluslogo.svg" alt="Logo - H Plus Sports"></a>
            </div>
            <!-- branding -->
            <ul class="navbar">
                <li><a href="#home">home</a></li>
                <li><a href="#history">history</a></li>
                <li><a href="#products">products</a></li>
                <li><a href="#guarantee">guarantee</a></li>
                <li><a href="#people">people</a></li>
                <li><a href="#Search">Search</a></li>
            </ul>
            <!-- navbar -->
        </div>
        <!-- container nav-elements -->
    </nav>
    <!-- container tagline -->
</header>
<!-- #home -->
<section id="Search" class="section">
    <div class="container">
        <form action="/search" method="get">
            <label class="card-title">Search your Product</label>
            <input path="search" name="search" value=""/>
            <input type="submit" value="Search">
        </form>
    </div>
</section>
<c:if test="${!empty(Products)}">
    <c:catch var="catchException">
        <section id="products" class="section">
            <div class="container">

                    <%--
                                    <c:forEach var="product" items="${Products}">
                    <div class="product-list">
                        <div class="product-item">
                            <img id="pic1"
                                 src="${product.imagepath}"/>
                            <input type="text" name="product" value="${product.name}">
                        </div>
                    </div>
                                            </c:forEach>

                    --%>
                <ul class="product-list">
                    <c:forEach var="product" items="${Products}">
                        <li class="product-item" data-prod_id="${product.name}">
                            <img class="product-image"
                                 src="${product.imagepath}"
                                 id="${product.name}"
                                 alt="${product.name}">
                            <h2 class="product-name">${product.name}</h2>
                        </li>

                    </c:forEach>
                </ul>
                <br/>


            </div>
        </section>
    </c:catch>
</c:if>

<c:if test="${catchException != null}">
    <p>The exception is : ${catchException} <br/>
        There is an exception: ${catchException.message}</p>
</c:if>

<footer class="footer">
    <header class="imageheader"></header>
    <div class="container">
        <nav class="nav" role="navigation">
            <div class="container nav-elements">
                <div class="branding">
                    &lt;%&ndash;<a href="#home"><img src="images/hpluslogo.svg" alt="Logo - H Plus Sports"></a>&ndash;%&gt;
                 &lt;%&ndash;   <p class="address">100 Main Street
                        <br> Seattle, WA 98144
                    </p>&ndash;%&gt;
                </div>
                <ul class="navbar">
                    <li><a href="#home">home</a></li>
                    <li><a href="#history">history</a></li>
                    <li><a href="#products">products</a></li>
                    <li><a href="#guarantee">guarantee</a></li>
                    <li><a href="#people">people</a></li>
                    <li><a href="#Search">Search</a></li>
                </ul>
            </div>
        </nav>
        <p class="legal">H+ Sport is a fictitious brand. All products and people associated with H+ Sport are also
            fictitious. Any resemblance to real brands, products, or people is purely coincidental. Information provided
            about the product is also fictitious and should not be construed to be representative of actual products on
            the market in a similar product category.</p>
    </div>
    <!-- container -->
</footer>
<!-- footer -->

</body>
</html>
