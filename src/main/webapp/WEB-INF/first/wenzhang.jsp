<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/7/17
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>zSoodany</title>
    <meta name="description" content="Free Responsive Html5 Css3 Templates Designed by Kimmy | chinaz.com">
    <meta name="author" content="sc.chinaz.com">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="/css/zerogrid.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/responsive.css">

    <!--[if lt IE 8]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
            <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
    </div>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="/js/html5.js"></script>
    <script src="/js/css3-mediaqueries.js"></script>
    <![endif]-->

    <link href='/images/favicon.ico' rel='icon' type='image/x-icon'/>

</head>
<body>
<div class="wrap-body zerogrid">
    <!--------------Header--------------->
    <header>
        <div class="wrap-header">

            <div id="logo">
                <a href="http://sc.chinaz.com"><h1>zSoodany</h1></a>
                <p>chinaz.com | Free Responsive Html5 and Css3 Templates</p>
            </div>

            <nav>
                <div class="wrap-nav">
                    <div class="menu">
                        <ul>
                            <li><a href="/layout/demo">??????</a></li>
                            <li><a href="/admin/login">??????</a></li>
                        </ul>
                    </div>
                </div>
            </nav>

        </div>
    </header>

    <!--------------Content--------------->
    <section id="content">
        <div class="wrap-content">
            <div class="row block">
                <div id="main-content" class="col-2-3">
                    <div class="wrap-col">
                        <article>
                            <div class="heading">
                                <h2>${blog.title}</h2>
                                <p></p>
                                <h5>??????:${admin.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????:<fmt:formatDate value="${blog.date}" type="date" pattern="yyyy-MM-dd HH:mm"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????:16</h5>
                            </div>
                            <div class="content">
                                <p>${blog.content}</p>
                            </div>
                        </article>

                        <section>
                            <h3>????????????</h3>

                            <form id="contact-form" method="post">
                                <fieldset>
                                    <label><input name="email" value="??????" onBlur="if(this.value=='') this.value='Email'" onFocus="if(this.value =='Email' ) this.value=''" /></label>
                                    <label><input name="subject" value="??????" onBlur="if(this.value=='') this.value='Subject'" onFocus="if(this.value =='Subject' ) this.value=''" /></label>
                                    <textarea onBlur="if(this.value=='') this.value=''" onFocus="if(this.value =='Message' ) this.value=''">??????</textarea>
                                    <div class="buttons">
                                        <input  type="submit" value="??????">
                                    </div>
                                </fieldset>
                            </form>
                        </section>
                    </div>
                </div>
                <div id="sidebar" class="col-1-3">
                    <div class="wrap-col">
                        <div class="box">
                            <div class="heading"><h2>??????????????????</h2></div>
                            <div class="content">
                                <img src="/images/zerotheme.jpg" style="border: 0px;"/>
                                <p>??????:${admin.name}</p>
                                <p>${admin.motto}</p>
                                </div>
                        </div>
                        <div class="box">
                            <div class="heading"><h2>????????????</h2></div>
                            <div class="content">
                                <ul>
                                    <c:forEach items="${blogs}" var="blogs">
                                        <li><a href="http://sc.chinaz.com/">${blogs.title}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="box">
                            <div class="heading"><h2>????????????</h2></div>
                            <div class="content">
                                <c:forEach items="${youlist}" var="you">
                                <div class="post">
                                    <img src="/images/img1.jpg" width="50px"/>
                                    <center><h4><a href="${you.address}">${you.name}</a></h4></center>
                                    <center><p>${you.qq}</p></center>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--------------Footer--------------->
    <footer>
        <div class="wrap-footer">
            <div class="row">
                <div class="col-1-3">
                    <div class="wrap-col">
                        <div class="box">
                            <div class="heading"><h2>Image Gallery</h2></div>
                            <div class="content gallery">
                                <a href="#"><img src="/images/img1.jpg" width="120"/></a>
                                <a href="#"><img src="/images/img2.jpg" width="120"/></a>
                                <a href="#"><img src="/images/img3.jpg" width="120"/></a>
                                <a href="#"><img src="/images/img4.jpg" width="120"/></a>
                                <a href="#"><img src="/images/img5.jpg" width="120"/></a>
                                <a href="#"><img src="/images/img1.jpg" width="120"/></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-1-3">
                    <div class="wrap-col">
                        <div class="box">
                            <div class="heading"><h2>????????????</h2></div>
                            <div class="content">
                                <img src="/images/zerotheme.jpg" style="border: 0px;margin: 0 auto"/>
                                <p>${website.publica}</p>
                                 </div>
                        </div>
                    </div>
                </div>
                <div class="col-1-3">
                    <div class="wrap-col">
                        <div class="box">
                            <div class="heading"><h2>Contact Us</h2></div>
                            <div class="content">
                                <p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue.</p>
                                <p>Website : <a href="http://sc.chinaz.com" target="_blank">sc.chinaz.com</a></p>
                                <p>+1 (123) 444-5677 <br/> +1 (123) 444-5678</p>
                                <p>Address: 123 TemplateAccess Rd1</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

</div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
