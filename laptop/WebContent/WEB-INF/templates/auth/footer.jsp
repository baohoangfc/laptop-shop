<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer id="footer" class="footer color-bg">

    <div class="footer-bottom inner-bottom-sm">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-3">
                    <div class="module-heading outer-bottom-xs">
                        <h4 class="module-title">category</h4>
                    </div><!-- /.module-heading -->

                    <div class="module-body">
                        <ul class='list-unstyled'>
                            <li><a href="#">Order History</a></li>
                            <li><a href="#">Returns</a></li>
                            <li><a href="#">Libero Sed rhoncus</a></li>
                            <li><a href="#">Venenatis augue tellus</a></li>
                            <li><a href="#">My Vouchers</a></li>
                        </ul>
                    </div><!-- /.module-body -->
                </div><!-- /.col -->

                <div class="col-xs-12 col-sm-6 col-md-3">
                    <div class="module-heading outer-bottom-xs">
                        <h4 class="module-title">my account</h4>
                    </div><!-- /.module-heading -->

                    <div class="module-body">
                        <ul class='list-unstyled'>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Customer Service</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Site Map</a></li>
                            <li><a href="#">Search Terms</a></li>
                        </ul>
                    </div><!-- /.module-body -->
                </div><!-- /.col -->

                <div class="col-xs-12 col-sm-6 col-md-3">
                    <div class="module-heading outer-bottom-xs">
                        <h4 class="module-title">our services</h4>
                    </div><!-- /.module-heading -->

                    <div class="module-body">
                        <ul class='list-unstyled'>
                            <li><a href="#">Order History</a></li>
                            <li><a href="#">Returns</a></li>
                            <li><a href="#">Libero Sed rhoncus</a></li>
                            <li><a href="#">Venenatis augue tellus</a></li>
                            <li><a href="#">My Vouchers</a></li>
                        </ul>
                    </div><!-- /.module-body -->
                </div><!-- /.col -->

                <div class="col-xs-12 col-sm-6 col-md-3">
                    <div class="module-heading outer-bottom-xs">
                        <h4 class="module-title">help & support</h4>
                    </div><!-- /.module-heading -->

                    <div class="module-body">
                        <ul class='list-unstyled'>
                            <li><a href="#">Knowledgebase</a></li>
                            <li><a href="#">Terms of Use</a></li>
                            <li><a href="#">Contact Support</a></li>
                            <li><a href="#">Marketplace Blog</a></li>
                            <li><a href="#">About Unicase</a></li>
                        </ul>
                    </div><!-- /.module-body -->
                </div>
            </div>
        </div>
    </div>

    <div class="copyright-bar">
        <div class="container">
            <div class="col-xs-12 col-sm-6 no-padding">
                <div class="copyright">
                   Copyright © 2014
                    <a href="home.html">Unicase Shop.</a>
                    - All rights Reserved
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 no-padding">
                <div class="clearfix payment-methods">
                    <ul>
                        <li><img src="${pageContext.request.contextPath }/templates/public/assets/images/payments/1.png" alt=""></li>
                        <li><img src="${pageContext.request.contextPath }/templates/public/assets/images/payments/2.png" alt=""></li>
                        <li><img src="${pageContext.request.contextPath }/templates/public/assets/images/payments/3.png" alt=""></li>
                        <li><img src="${pageContext.request.contextPath }/templates/public/assets/images/payments/4.png" alt=""></li>
                        <li><img src="${pageContext.request.contextPath }/templates/public/assets/images/payments/5.png" alt=""></li>
                    </ul>
                </div><!-- /.payment-methods -->
            </div>
        </div>
    </div>
</footer>
<!-- ============================================================= FOOTER : END============================================================= -->


	<!-- JavaScripts placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath }/templates/public/assets/js/jquery-1.11.1.min.js"></script>
	
	<script src="${pageContext.request.contextPath }/templates/public/assets/js/bootstrap.min.js"></script>
	
	<script src="${pageContext.request.contextPath }/templates/public/assets/js/bootstrap-hover-dropdown.min.js"></script>
	<script src="${pageContext.request.contextPath }/templates/public/assets/js/owl.carousel.min.js"></script>
	
	<script src="${pageContext.request.contextPath }/templates/public/assets/js/echo.min.js"></script>
	<script src="${pageContext.request.contextPath }/templates/public/assets/js/jquery.easing-1.3.min.js"></script>
	<script src="${pageContext.request.contextPath }/templates/public/assets/js/bootstrap-slider.min.js"></script>
    <script src="${pageContext.request.contextPath }/templates/public/assets/js/jquery.rateit.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/templates/public/assets/js/lightbox.min.js"></script>
    <script src="${pageContext.request.contextPath }/templates/public/assets/js/bootstrap-select.min.js"></script>
    <script src="${pageContext.request.contextPath }/templates/public/assets/js/wow.min.js"></script>
	<script src="${pageContext.request.contextPath }/templates/public/assets/js/scripts.js"></script>

	<!-- For demo purposes – can be removed on production -->
	
	<script src="${pageContext.request.contextPath }/templates/public/switchstylesheet/switchstylesheet.js"></script>
	
	<script>
		$(document).ready(function(){ 
			$(".changecolor").switchstylesheet( { seperator:"color"} );
			$('.show-theme-options').click(function(){
				$(this).parent().toggleClass('open');
				return false;
			});
		});

		$(window).bind("load", function() {
		   $('.show-theme-options').delay(2000).trigger('click');
		});
	</script>
	<!-- For demo purposes – can be removed on production : End -->

	

</body>
</html>