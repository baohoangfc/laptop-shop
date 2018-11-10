<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>    
<div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Edit Profile</h4>
                            </div>
                            <div class="content">
                                <form action="${pageContext.request.contextPath }/admin/cat/edit/${objCat.cid}" method="post">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Tên Danh Mục Tin</label>
                                                <input type="text" name="cname" class="form-control"  value="${objCat.cname }">
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                             <div class="form-group">
	                                            <label>Danh mục tin cha</label>
	                                            <select name="cid" class="form-control">
	                                            	<c:forEach items="${alCatAdd }" var="obj">
												    <c:choose>
			                                            	<c:when test="${obj.cid  eq objCat.id_parent}">
			                                            		<c:set var="acti" value="selected = 'selected' "></c:set>
			                                            	</c:when>
			                                            	<c:otherwise>
			                                            		<c:set var="acti" value=""></c:set>
			                                            	</c:otherwise>
			                                            </c:choose>
														<option ${acti} value="${obj.cid}">${obj.cname }</option>
												    </c:forEach>
												</select>
                                        	</div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-info btn-fill pull-right">Update Profile</button>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>