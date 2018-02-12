<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生列表</title>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
    System.out.print("111"+request.getAttribute("pageInfo"));

%>
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
    <div class="container"  >
    
       <div class="row">
         <div class="col-md-8">
       
            <h1>SSM CRUD</h1>
       
         </div>
               
      
      </div>
      <div class="row">
           <div class="col-md-4  col-md-offset-8">
           <button type="button" class="btn btn-primary">新增</button> 
           <button type="button" class="btn btn-danger" >删除</button> 
           </div>    
     
      
      </div>
      <div class="row">
         <table class="table table-hover">
        
           <tr>
           
                <th>#</th>
				<th>name</th>
				<th>age</th>
				<th>sex</th>
				<th>score</th>
				<th>cname</th>
				<th>操作</th>

           </tr>
         	<c:forEach items="${pageInfo.list }" var="student">
            <tr class="active" >
            <th>${student.id }</th>
            <th>${student.name }</th>
            <th>${student.age }</th><c:if test=""></c:if>
            <th>${student.sex =="m"? "男":"女" }</th>
            <th>${student.score }</th>
            <th>${student.classes.cname }</th>
            <th>
               <button type="button" class="btn btn-primary  btn-xs">
             <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>  
                                               编辑</button>
               <button type="button" class="btn btn-danger  btn-xs">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>   
                                           删除</button>
            </th>
            </tr>
           </c:forEach>
         </table>         
      
      
      </div>
      
      <div class="row">
                   当前第<span class="label label-default">${pageInfo.pageNum } </span> 页，共有<span class="label label-default">${pageInfo.pages } </span>页，总计<span class="label label-default">${pageInfo.total } </span>条记录
      
      
      </div>
      <div class="row" > 
           <div class="col-md-6">
	        <nav aria-label="Page navigation" >
			  <ul class="pagination">
			  
			   <li><a href="${APP_PATH }/student?pn=1">首页</a></li>
			   <c:if test="${pageInfo.hasPreviousPage }">
			    <li>
			      <a href="${APP_PATH }/student?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			     </li>
			   </c:if> 
			     <c:forEach items="${pageInfo.navigatepageNums }"  var="num">
			     <c:if test="${pageInfo.pageNum == num }">
			        <li><a  class="active" href="#">${num }</a></li>
			     </c:if>
			     <c:if test="${pageInfo.pageNum != num }">
			        <li><a href="${APP_PATH }/student?pn=${num }">${num }</a></li>
			     </c:if>
			       
		         </c:forEach>
		
		
		     <c:if test="${pageInfo.hasNextPage }">
			    <li>
			      <a href="${APP_PATH }/student?pn=${pageInfo.pageNum+1 }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			     </li>
			 </c:if> 
			      <li><a href="${APP_PATH }/student?pn=${pageInfo.pages}">尾页</a></li>
			  </ul>
	      </nav>
        </div>
      </div>
    </div>


 
</body>
</html>