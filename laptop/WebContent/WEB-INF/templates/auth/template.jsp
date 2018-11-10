<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>

<tiles:insertAttribute name="header"></tiles:insertAttribute>

<!-- ============================================== HEADER : END ============================================== -->
<div class="body-content outer-top-xs" id="top-banner-and-menu">
	<div class="container">
	<div class="row">
	<!-- ============================================== SIDEBAR ============================================== -->	
		<!-- ============================================== SIDEBAR : END ============================================== -->

		<!-- ============================================== CONTENT ============================================== -->
<tiles:insertAttribute name="body"></tiles:insertAttribute>
	</div><!-- /.row -->

	</div><!-- /.container -->
</div><!-- /#top-banner-and-menu -->


<!-- ============================================================= FOOTER ============================================================= -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>