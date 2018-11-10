<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<body>

<div class="wrapper">
    
	<tiles:insertAttribute name="left-bar"></tiles:insertAttribute>

    <div class="main-panel">
    
    <tiles:insertAttribute name="nav-bar"></tiles:insertAttribute> 
    
    <tiles:insertAttribute name="body"></tiles:insertAttribute>    


<tiles:insertAttribute name="footer"></tiles:insertAttribute> 