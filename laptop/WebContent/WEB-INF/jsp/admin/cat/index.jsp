<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>    
 <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                            	<p><a href="${pageContext.request.contextPath }/admin/cat/add" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Thêm</a></p>
                                <h4 class="title" style="color:red" >${msg }</h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
	                                    <th>ID</th>
	                                    <th>Tên Danh Mục</th>
										<th>Danh Mục Cha</th>
										<th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                     	<c:forEach items="${alCat }" var="obj">
                                        <tr>
                                       		<c:if test="${obj.cid != 0 }">
	                                        	<td>${obj.cid }</td>
	                                       		<td>${obj.cname }</td>
                                        	<c:forEach items="${alCat }" var="objCat">
                                        		<c:choose>
                                        			<c:when test="${objCat.cid == obj.id_parent }">
                                        				<td>${objCat.cname }</td>
                                        			</c:when>
                                        		</c:choose>
                                        	</c:forEach>
                                        	<td>
                                        	   <a href="${pageContext.request.contextPath }/admin/cat/edit/${obj.cid}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Sửa</a>
		                                       <a href="${pageContext.request.contextPath }/admin/cat/del/${obj.cid}" onclick="return confirm('Bạn có muốn xóa danh mục này không')" title="" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Xóa</a>
                                        	</td>
                                        	</c:if>
                                        </tr>
                                        </c:forEach> 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>