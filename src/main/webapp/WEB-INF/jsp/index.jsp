<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%--<!doctype html>--%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>HPlus Sport</title>
    <%--<link rel="stylesheet" href="css/style.css">--%>
    <Link rel="stylesheet" href="<spring:theme code='styleSheet' />" type="text/css" />
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
                <a href="/home"><img src="images/hpluslogo.svg" alt="Logo - H Plus Sports"></a>
            </div>
            <!-- branding -->
            <ul class="navbar">
                <li><a href="/home"><spring:message code="label.home" /></a></li>
                <li><a href="/goTologin"><spring:message code="label.login" /></a></li>
                <li><a href="/goToRegister"><spring:message code="label.register" /></a></li>
                <li><a href="#history"><spring:message code="label.history" /></a></li>
                <li><a href="#products"><spring:message code="label.products" /></a></li>
                <li><a href="#guarantee"><spring:message code="label.guarantee" /></a></li>
                <li><a href="#people"><spring:message code="label.people" /></a></li>
                <li><a href="/GoToSearch"><spring:message code="label.search" /></a></li>
                <li><a href="/redirectToLinkedIn"><spring:message code="label.linkedin" /></a></li>
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
<!-- #home -->
<section id="Search" class="section">
    <div class="container">
    <form action="" method="get">
        <label class="card-title">Search your Product</label>
        <input path="search" name="search" value="" />
        <input type="submit" value="Search">
    </form>
    </div>
</section>
<section id="history" class="section">
    <div class="container">
        <div class="text-content">
            <h2 class="headline">Company History</h2>
            <p>In 2006, H+ Sport founder <a href="#employees-henrytwill">Henry Twill</a> set out to create supplements and nutritional products made from the <em>purest ingredients</em> and backed by scientific and <em>performance data</em> – to provide a strong basis of <em>trust and accountability</em>.</p>
            <p>His quest began while training for his <em>first 5K marathon</em>, after recovering from a <em>lengthy injury</em> that left him with residual aches, pains, and decreased athletic performance. He yearned for <em>simple and natural ingredients</em>, in their purest form, instead of labels with <em>lengthy chemical names</em> and disclaimers. When no products lived up to his strict requirements, Henry set his sights on <em>creating products</em> that catered to his own vision.</p>
            <p>Today that vision has become H+ Sport…offering a variety of <a href="#products">supplements, energy bars and rehydration solutions</a>. At the foundation of H+ Sports are products backed by scientific and performance data.</p>
        </div>
    </div>
    <!-- container text -->
</section>
<!-- #history -->

<section id="products" class="section">
    <header class="imageheader"></header>
    <div class="container">
        <h2 class="headline">Products</h2>
        <p>H+ Sport is <em>dedicated to creating</em> eco-friendly, high-quality, nutrient-rich, nutritional products that <em>enhance active lifestyles</em>. We <a href="#guarantee">guarantee</a> it. Take a look at some of our products.</p>
    </div>
    <!-- container -->
    <div id="productControls">
        <form>
            <div>
                <span>Show: </span>
                <input id="cbVitamins" type="checkbox" checked="checked" />
                <label for="cbVitamins">Vitamins </label>
                <input id="cbMineralWater" type="checkbox" checked="checked" />
                <label for="cbMineralWater">Mineral Water </label>
                <input id="cbProtein" type="checkbox" checked="checked" />
                <label for="cbProtein">Protein Bars </label>
            </div>
        </form>
    </div>
    <ul class="product-list">
        <li class="product-item" data-prod_id="V-A1037">
            <img class="product-image" src="images/products/vitamin-a.jpg" alt="Vitamin A - Product Photo">
            <h2 class="product-name" data-type="vitamin">Vitamin A</h2>
        </li>
        <li class="product-item" data-prod_id="V-BC2178">
            <img class="product-image" src="images/products/vitamin-bcomplex.jpg" alt="B Complex - Product Photo">
            <h2 class="product-name" data-type="vitamin">Vitamin-B Complex</h2>
        </li>
        <li class="product-item" data-prod_id="MW-8812">
            <img class="product-image" src="images/products/mineralwater-blueberry.jpg" alt="Blueberry Mineral Water - Product Photo">
            <h2 class="product-name" data-type="mineralwater">Blueberry Mineral Water</h2>
        </li>
        <li class="product-item" data-prod_id="V-C6614">
            <img class="product-image" src="images/products/vitamin-c.jpg" alt="Vitamin C - Product Photo">
            <h2 class="product-name" data-type="vitamin">Vitamin C</h2>
        </li>
        <li class="product-item" data-prod_id="PB-8154">
            <img class="product-image" src="images/products/proteinbar-chocolate.jpg" alt="Protein Bar Chocolate - Product Photo">
            <h2 class="product-name" data-type="proteinbar">Chocolate Protein Bar</h2>
        </li>
        <li class="product-item" data-prod_id="V-CA4543">
            <img class="product-image" src="images/products/vitamin-calcium.jpg" alt="Vitamin Calcium - Product Photo">
            <h2 class="product-name" data-type="vitamin">Calcium Vitamin</h2>
        </li>
        <li class="product-item" data-prod_id="V-D1825">
            <img class="product-image" src="images/products/vitamin-d.jpg" alt="Vitamin D - Product Photo">
            <h2 class="product-name" data-type="vitamin">Vitamin D</h2>
        </li>
        <li class="product-item" data-prod_id="V-F2225">
            <img class="product-image" src="images/products/vitamin-flaxseed-oil.jpg" alt="Flaxseed Oil - Product Photo">
            <h2 class="product-name" data-type="vitamin">Flaxseed Oil Vitamin</h2>
        </li>
        <li class="product-item" data-prod_id="V-I7456">
            <img class="product-image" src="images/products/vitamin-iron.jpg" alt="Vitamin Iron - Product Photo">
            <h2 class="product-name" data-type="vitamin">Iron Vitamin</h2>
        </li>
        <li class="product-item" data-prod_id="MW-9143">
            <img class="product-image" src="images/products/mineralwater-lemonlime.jpg" alt="Mineral Water Lemon Lime - Product Photo">
            <h2 class="product-name" data-type="mineralwater">Lemon Lime Mineral Water</h2>
        </li>
        <li class="product-item" data-prod_id="V-M0019">
            <img class="product-image" src="images/products/vitamin-magnesium.jpg" alt="Vitamin Magnesium - Product Photo">
            <h2 class="product-name" data-type="vitamin">Magnesium Vitamin</h2>
        </li>
        <li class="product-item" data-prod_id="V-MV7763">
            <img class="product-image" src="images/products/vitamin-multi.jpg" alt="Vitamin Multivitamin - Product Photo">
            <h2 class="product-name" data-type="vitamin">Multi-vitamin</h2>
        </li>
        <li class="product-item" data-prod_id="PB-1234">
            <img class="product-image" src="images/products/proteinbar-peanutbutter.jpg" alt="Vitamin Protein Bar Peanut Butter - Product Photo">
            <h2 class="product-name" data-type="proteinbar">Peanut Butter Protein Bar</h2>
        </li>
        <li class="product-item" data-prod_id="MW-S0987">
            <img class="product-image" src="images/products/mineralwater-strawberry.jpg" alt="Mineral Water Strawberry - Product Photo">
            <h2 class="product-name" data-type="mineralwater">Strawberry Mineral Water</h2>
        </li>
        <li class="product-item" data-prod_id="PB-1919">
            <img class="product-image" src="images/products/proteinbar-lemon.jpg" alt="Protein Bar Lemon - Product Photo">
            <h2 class="product-name" data-type="proteinbar">Lemon Protein Bar</h2>
        </li>
        <li class="product-item" data-prod_id="MW-O1980">
            <img class="product-image" src="images/products/mineralwater-orange.jpg" alt="Mineral Water Orange - Product Photo">
            <h2 class="product-name" data-type="mineralwater">Orange Mineral Water</h2>
        </li>
        <li class="product-item" data-prod_id="MW-P1968">
            <img class="product-image" src="images/products/mineralwater-peach.jpg" alt="Mineral Water Peach - Product Photo">
            <h2 class="product-name" data-type="mineralwater">Peach Mineral Water</h2>
        </li>
        <li class="product-item" data-prod_id="MW-R2003">
            <img class="product-image" src="images/products/mineralwater-raspberry.jpg" alt="Mineral Water Raspberry - Product Photo">
            <h2 class="product-name" data-type="mineralwater">Raspberry Mineral Water</h2>
        </li>
    </ul>
    <!-- product-list -->
</section>
<!-- #products -->

<section id="guarantee" class="section">
    <header class="imageheader"></header>
    <div class="container">
        <h2 class="headline">Our Guarantee &amp; Ideals</h2>
        <p>We’re committed to creating products that <em>defy convention</em>, and inspire our customers with pride and trust. In fact, we guarantee <a href="#products">every product</a> we sell. If you’re not 100 percent happy with your purchase, you can return it during the first 60 days, <em>no questions asked</em>.</p>
        <p>Philanthropy is extremely important to us. In fact, <em>each employee volunteers</em> for organization of his or her choice, on the clock, for two hours each week. We know that doing good, breeds more doing good, and we’re happy to <em>promote a cycle</em> of volunteerism that just keeps on giving.</p>
    </div>
</section>
<!-- guarantee -->

<section id="people" class="section">
    <header class="imageheader"></header>
    <div class="container">
        <h2 class="headline">People</h2>
        <div class="people-cards">
            <div class="person-card">
                <img src="images/employees/HenryTwill.jpg" alt="HenryTwill Photo">
                <div class="card-info">
                    <h3 class="card-name">Henry Twill, Jr</h3>
                    <h4 class="card-title">CEO</h4>
                </div>
                <p class="card-text">Henry Twill Jr. is the <em>founder</em> and CEO of H+ Sports. Previously he was an <em>athletic trainer</em> working with several top athletes, making sure that they had the direction and proper coaching to keep them at the <em>top of their game</em>. Henry’s passion for finding natural alternatives led him to developing H+ Sport Multivitamins. The supplements <em>became a success</em> with his clients and led to the creation of H+ Sports.</p>
            </div>
            <!-- person-card -->

            <div class="person-card">
                <img src="images/employees/JessicaNewton.jpg" alt="JessicaNewton Photo">
                <div class="card-info">
                    <h3 class="card-name">Jessica Newton-Smith, MBA</h3>
                    <h4 class="card-title">CFO</h4>
                </div>
                <p class="card-text">Jessica Newton-Smith joined us in 2012 and brings more than <em>10 years</em> of financial management experience to H+ Sports, spanning a variety of companies and industries ranging from <em> Fortune 500 agencies</em> to start-ups. She has extensive experience working in <em>emerging markets</em> and in the consumer and retail sectors.</p>
            </div>
            <!-- person-card -->

            <div class="person-card">
                <img src="images/employees/PhiTang.jpg" alt="PhiTang Photo">
                <div class="card-info">
                    <h3 class="card-name">Phi Tang, MBA</h3>
                    <h4 class="card-title">Director of Product Development</h4>
                </div>
                <p class="card-text">Phi Tang joined H+ Sports in <em>2007</em> as Manager of Marketing Research. He was promoted to Director of Product Development in 2011. He has made <em>major contributions</em> to the discovery, development, and implementation of the H+ Sport product lines. Before joining the company he worked as a <em>scientific expert</em> and brings vast knowledge of ingredients and <em>new technologies</em>.</p>
            </div>
            <!-- person-card -->

            <div class="person-card">
                <img src="images/employees/MariaSontas.jpg" alt="MariaSontas Photo">
                <div class="card-info">
                    <h3 class="card-name">Maria Sontas</h3>
                    <h4 class="card-title">Director of Marketing</h4>
                </div>
                <p class="card-text">Maria Sontas has been with H+ Sport since 2010. She oversees the company’s <em>marketing strategy</em> – ensuring advertising campaigns, social media initiatives, and events are planned to <em>position the company</em> strongly in a competitive marketplace. Maria is a <em>competing triathlete</em> and her passion for our products shows in her unique ability to drive awareness and <em>increase our presence</em> around the world.</p>
            </div>
            <!-- person-card -->

            <div class="person-card">
                <img src="images/employees/AngelaHaston.jpg" alt="AngelaHaston Photo">
                <div class="card-info">
                    <h3 class="card-name">Angela Hashton</h3>
                    <h4 class="card-title">Director of Sales</h4>
                </div>
                <p class="card-text">Angela Hashton joined the company in 2009, to <em>initiate new relationships</em> for our growing line of H+ Sports active apparel. After being with the company for a year, she was promoted to Director of Sales. Angela is the drive behind the H+ Sport <em>ACTIVE product line</em> and has an uncanny ability to formulate strategies that have helped build our unified sales force. <em>Educating people</em> about health and nutrition is something that Angela holds dear.</p>
            </div>
            <!-- person-card -->

            <div class="person-card">
                <img src="images/employees/MichaelLewiston.jpg" alt="MichaelLewiston Photo">
                <div class="card-info">
                    <h3 class="card-name">Michael Lewiston</h3>
                    <h4 class="card-title">MFA, Creative Director</h4>
                </div>
                <p class="card-text">Michael Lewiston is a multi-faceted <em>creative person</em> who began his career as a designer for a small business firm, while also working as an independent <em>painter and sculptor</em>. In 2007, Henry Twill was impressed by Michael’s creative work in a national ad campaign for a high profile sports apparel company. Henry approached Michael, and asked him to <em>manage creative direction</em> for the H+ Sport ACTIVE apparel line.</p>
            </div>
            <!-- person-card -->
        </div>
    </div>
        <!-- container -->
</section>
<!-- people -->

<footer class="footer">
    <header class="imageheader"></header>
    <div class="container">
        <nav class="nav" role="navigation">
            <div class="container nav-elements">
                <div class="branding">
                    <a href="#home"><img src="images/hpluslogo.svg" alt="Logo - H Plus Sports"></a>
                    <p class="address">100 Main Street
                        <br> Seattle, WA 98144
                    </p>
                </div>
                <ul class="navbar">
                    <li><a href="#home">home</a></li>
                    <li><a href="/login">login</a></li>
                    <li><a href="#history">history</a></li>
                    <li><a href="#products">products</a></li>
                    <li><a href="#guarantee">guarantee</a></li>
                    <li><a href="#people">people</a></li>
                    <li><a href="/GoToSearch">Search</a></li>
                </ul>
            </div>
        </nav>
        <p class="legal">H+ Sport is a fictitious brand. All products and people associated with H+ Sport are also fictitious. Any resemblance to real brands, products, or people is purely coincidental. Information provided about the product is also fictitious and should not be construed to be representative of actual products on the market in a similar product category.</p>
    </div>
    <!-- container -->
</footer>
<!-- footer -->

</body>

</html>
