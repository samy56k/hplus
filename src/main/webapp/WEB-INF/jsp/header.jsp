<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>HPlus Sport</title>
    <link rel="stylesheet" href="css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="js/jquery-3.0.0.js"></script>
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

<body>

<header id="home" class="header">
    <nav class="nav" role="navigation">
        <div class="container nav-elements">
            <div class="branding">
                <a href="#home"><img src="images/hpluslogo.svg" alt="Logo - H Plus Sports"></a>
            </div>
            <!-- branding -->
            <ul class="navbar">
                <li><a href="/home">home</a></li>
                <li><a href="/goTologin">login</a></li>
                <li><a href="/goToRegister">Register</a></li>
                <li><a href="#history">history</a></li>
                <li><a href="#products">products</a></li>
                <li><a href="#guarantee">guarantee</a></li>
                <li><a href="#people">people</a></li>
                <li><a href="/GoToSearch">Search</a></li>
                <li><a href="/logout">Logout</a></li>
                <li><a href="/redirectToLinkedIn">LinkedIn</a></li>
            </ul>
            <!-- navbar -->
        </div>
        <!-- container nav-elements -->
    </nav>
    <div class="container tagline">
        <h1 class="headline">Our Mission</h1>
        <p>We support and encourage <em>active and healthy</em> lifestyles, by offering <em>ethically sourced</em> and <em>eco-friendly</em> nutritional products for the <em>performance-driven</em> athlete.</p>
    </div>
    <!-- container tagline -->
</header>