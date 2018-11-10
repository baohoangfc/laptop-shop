<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>     
<div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Striped Table with Hover</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
						   <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                    	<th>ID</th>
                                    	<th>Ảnh</th>
										<th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listSlide }" var="obj">
                                        <tr>
                                        	<td>${obj.id_slide }</td>
                                        	<td>
                                        		<img width="175px" height="175px" src="${pageContext.request.contextPath }/files/${obj.image}" alt="" />
                                        	</td>
                                        	<td>
                                        	   <a href="${pageContext.request.contextPath }/admin/slide/edit/${obj.id_slide}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Sửa</a>
		                                       <a href="${pageContext.request.contextPath }/admin/slide/del/${obj.id_slide}" onclick="return confirm('Bạn có muốn xóa danh mục này không')" title="" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Xóa</a>
                                        	</td>
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