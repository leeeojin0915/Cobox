<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    	<%@ include file="../inc/header.jsp"%>
        <meta charset="utf-8">
        <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title> Goshop HTML Theme || Category Product Listing Full Width</title>

        <!-- Favicon -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="shortcut icon" href="/resources/assets/ico/favicon.ico">

        <!-- CSS Global -->
        <link href="/resources/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">        
        <link href="/resources/assets/plugins/bootstrap-select-1.9.3/dist/css/bootstrap-select.min.css" rel="stylesheet" type="text/css">         
        <link href="/resources/assets/plugins/owl-carousel2/assets/owl.carousel.css" rel="stylesheet" type="text/css"> 
        <link href="/resources/assets/plugins/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.min.css" rel="stylesheet" type="text/css">   
        <link href="/resources/assets/plugins/royalslider/skins/universal/rs-universal.css" rel="stylesheet">
        <link href="/resources/assets/plugins/royalslider/royalslider.css" rel="stylesheet">
        <link href="/resources/assets/plugins/nouislider/nouislider.min.css" rel="stylesheet">
        <link href="/resources/assets/plugins/subscribe-better-master/subscribe-better.css" rel="stylesheet" type="text/css">

        <!-- Icons Font CSS -->
        <link href="/resources/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> 

        <!-- Theme CSS -->
        <link href="/resources/assets/css/style.css" rel="stylesheet" type="text/css">
        <link href="/resources/assets/css/header.css" rel="stylesheet" type="text/css"> 

        <!--[if lt IE 9]>
       <script src="/resources/assets/plugins/iesupport/html5shiv.js"></script>
       <script src="/resources/assets/plugins/iesupport/respond.js"></script>
       <![endif]-->

    </head>
    <body class="woocommerce">
<%@include file="../inc/top.jsp"%> 
        <!-- CONTENT + SIDEBAR -->
        <div class="main-wrapper clearfix">


            <div class="theme-container container">
                <div class="main-container row">
                    <main class="col-md-12 shop-full-wrap">                       
                        <div class="row spcbt-30">
                            <div class="col-lg-3 col-sm-4 sorter"> 
                           </div>
                           
                        </div>	

                        <div class="tab-content">
                            <!-- Product Grid View -->
                            <div id="grid-view" class="tab-pane fade active in" role="tabpanel">
                                <div class="row text-center hvr2 clearfix">
                                	<%for(int i=0; i<10; i++){ %>
                                    <div class="col-md-3 col-sm-4">
                                        <div class="portfolio-wrapper">
                                            <div class="portfolio-thumb">
                                                <img src="/resources/assets/img/products/cat-1.jpg" alt="">
                                                <div class="portfolio-content">   
                                                    <div class="pop-up-icon">                 
                                                        <a  data-toggle="modal" href="#product-preview" class="center-link"><i class="fa fa-search"></i></a> 
                                                        <a class="right-link" href="#"><i class="cart-icn"> </i></a>
                                                    </div>                                                   
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h3> <a class="title-3 fsz-16" href="#"> CICLYSMO JACKET </a> </h3>
                                                <p class="font-3">Price: <span class="thm-clr"> $299.00 </span> </p>    
                                            </div>
                                        </div>
                                    </div>
                                    <%} %>
                                </div>
                                
                                <nav class="woocommerce-pagination">
                                    <ul class="page-numbers">
                                        <li><a class="next page-numbers" href="#"> <i class="fa fa-angle-left"></i> </a></li>
                                        <li><span class="page-numbers current">1</span></li>
                                        <li><a class="page-numbers" href="#">2</a></li>
                                        <li><a class="next page-numbers" href="#"> <i class="fa fa-angle-right"></i> </a></li>
                                    </ul>
                                </nav>
                            </div>
                            <!-- / Product Grid View -->

                        </div>
                    </main>                            
                </div>
            </div>
             <%@include file="../inc/footer.jsp"%>
        </div>
        <div class="clear"></div>
        <!-- / CONTENT + SIDEBAR -->

        


        <!-- Product Preview Popup -->
        <section class="modal fade" id="product-preview" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg product-modal">
                <button class="close close-btn popup-cls" aria-label="Close" data-dismiss="modal" type="button">
                    <i class="fa-times fa"></i>
                </button>
                <div class="modal-content single-product">
                    <div class="diblock">
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <div id="gallery-1" class="royalSlider rsUni">
                                <a class="rsImg" data-rsbigimg="/resources/assets/img/products/single-1.jpg" href="/resources/assets/img/products/single-1.jpg" data-rsw="500" data-rsh="500"></a>
                            </div>
                        </div>
                        <div class="spc-15 hidden-lg clear"></div>
                        <div class=" col-sm-12 col-lg-6 col-xs-12">
                            <div class="summary entry-summary">
                                <div class="woocommerce-product-rating" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
                                    <div  class="posted_in">
                                        <h3 class="funky-font-2 fsz-20">Cobox</h3>
                                    </div>
                                </div>

                                <div class="product_title_wrapper">
                                    <div itemprop="name" class="product_title entry-title">
                                        Flusas Denim <span class="thm-clr">Dress</span>
                                        <p class="font-3 fsz-18 no-mrgn price"> <b class="amount blk-clr">$175.00</b></p>       
                                    </div>
                                </div>

                                <div itemprop="description" class="fsz-15">
                                    <p>Qossi is an emerging company and dedicated to making high quality bags and fashions.Qossi designers are internationally renowned designers,having participated in many international fashion designing contests,and perform outstandingly</p>                                  
                                </div>


                                <form class="variations_form cart" method="post">
                                    <div class="row">
                                      
                                        <div class="col-sm-4">
                                            <div class="form-group selectpicker-wrapper">
                                                <label class="fsz-15 title-3"> <b> ?????? ?????? (?????? 10???) </b> </label>
                                                <div class="search-selectpicker selectpicker-wrapper">
                                                    <select
                                                        class="selectpicker input-price" data-live-search="true" data-width="100%" data-toggle="tooltip"
                                                        title="1">
                                                        <%for(int i=0; i<10; i++){ %>
                                                        <option> <%=i+1 %></option>
                                                        <%} %>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <button type="submit" class="single_add_to_cart_button button alt fancy-button left">Add to cart</button>
                                            </div>    
                                        </div>
                                    </div>
                                </form>
                            </div><!-- .summary -->
                        </div>  
                    </div>
                </div>
            </div>
        </section>
        <!-- / Product Preview Popup -->


        <!-- Top -->
        <div class="to-top" id="to-top"> <i class="fa fa-long-arrow-up"></i> </div>

	<%@include file="../inc/script.jsp"%>

        <!-- JS Global -->
        <script src="/resources/assets/plugins/jquery/jquery-2.1.3.js"></script>  
        <script src="/resources/assets/plugins/royalslider/jquery.royalslider.min.js"></script>
        <script src="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="/resources/assets/plugins/bootstrap-select-1.9.3/dist/js/bootstrap-select.min.js"></script>             
        <script src="/resources/assets/plugins/owl-carousel2/owl.carousel.min.js"></script> 
        <script src="/resources/assets/plugins/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.concat.min.js"></script> 
        <script src="/resources/assets/plugins/isotope-master/dist/isotope.pkgd.min.js"></script>  

        <!-- Page JS -->      
        <script src="/resources/assets/js/jquery.sticky.js"></script>
        <script src="/resources/assets/js/custom.js"></script>
        <script src="/resources/assets/plugins/nouislider/nouislider.min.js"></script>  
    </body>
</html>