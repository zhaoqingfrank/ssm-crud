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
         <table class="table table-hover" id="students_table">
         <thead>
        
           <tr>
           
                <th>#</th>
				<th>name</th>
				<th>age</th>
				<th>sex</th>
				<th>score</th>
				<th>cname</th>
				<th>操作</th>

           </tr>
          </thead>
          <tbody>
          
          </tbody> 
      </table>
      </div>
      
      <div class="row" >
         <div id="page_info_area"></div>
      
      </div>
      <div class="row" > 
           <div class="col-md-6"  id="page_nav_area">
	  
           </div>
      </div>
<script type="text/javascript">

var totalRecord,currentRecord;

$(function(){
	//alert(1);
	
	to_page(1);
	
});


function to_page(pn){
	$.ajax({
		url:"${APP_PATH }/student",
		data:"pn="+pn,
		type:"GET",
		success:function(result){
			
			build_student_list(result);
			
			build_page_info(result);
			
			build_page_nav(result);	
		}
	});	
}


function build_student_list(result){
	$("#students_table tbody").empty();
	var students = result.info.pageInfo.list;
	//alert(students);
	$.each(students,function(index, item){
		var checkboxVar=$("<td><input type='checkbox' class='check_item'/></td>");
		 /* <th>#</th>
			<th>name</th>
			<th>age</th>
			<th>sex</th>
			<th>score</th>
			<th>cname</th>
			<th>操作</th> */
		var nameVar= $("<td></td>").append(item.name);
		var ageVar= $("<td></td>").append(item.age);	
		var sexVar= $("<td></td>").append(item.sex=='m'? "男":"女" );	
		var scoreVar= $("<td></td>").append(item.score);	
		var cnameVar= $("<td></td>").append(item.classes.cname);
		
		var editbutton=$("<button></button>").addClass("btn btn-primary btn-sm")
		                       .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
		
		editbutton.attr("edit-id",item.id);
		var deletebutton=$("<button></button>").addClass("btn btn-warning btn-sm ")	
		                       .append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
		deletebutton.attr("del-id",item.id);
		var operateVar=$("<td></td>").append(editbutton).append(" ").append(deletebutton);
		$("<tr></tr>").append(checkboxVar).append(nameVar).append(ageVar).append(sexVar)
		                .append(scoreVar).append(cnameVar).append(operateVar).appendTo("#students_table tbody")
		
	});
	
	
}

function build_page_info(result){
	
	$("#page_info_area").empty();
	var pageVar=$("<span></span>").addClass("label label-default").append(result.info.pageInfo.pageNum);
	var totalVar=$("<span></span>").addClass("label label-default").append(result.info.pageInfo.pages);
	var totalRecord=$("<span></span>").addClass("label label-default").append(result.info.pageInfo.total);
	$("#page_info_area").append("当前第").append(pageVar).append("页，共有").append(totalVar).append("页，").append(totalRecord).append("条记录.");
	

	
	
}

function build_page_nav(result){
	$("#page_nav_area").empty();
	var pagevar=$("<ul></ul>").addClass("pagination");
	
	var firstVar=$("<li></li>").append(($("<a></a>").append("首页").attr("href","#")));
	var preVar= $("<li></li>").append(($("<a></a>").append("&laquo;")));
		
	var nextVar=$("<li></li>").append(($("<a></a>").append("&raquo;")));	
	var lastVar=$("<li></li>").append(($("<a></a>").append("末页").attr("href","#")));
		
	if(result.info.pageInfo.pageNum != 1){
		var pn=result.info.pageInfo.pageNum;
		pagevar.append(firstVar).append(preVar);
		firstVar.click(function(){
			to_page(1);
			
		});
		preVar.click(function(){
			
			to_page(pn-1);
			
		});
		
	}else{
		firstVar.addClass("disabled");
		pagevar.append(firstVar);
		
	}
	
	
	
	
	//var navVar=$("<nav></nav>").attr("aria-label","Page navigation")
	
	$.each(result.info.pageInfo.navigatepageNums,function(index,item){
		var indexvar=$("<li></li>").append(($("<a></a>").append(item)));
		if(item == result.info.pageInfo.pageNum ){
			indexvar.addClass("disabled");
		
		 }else{
		//	 alert(2);
			 //indexvar.addClass();
			  indexvar.click(function(){
				  to_page(item);
				
			});
			 
		 }
		pagevar.append(indexvar);
	});
	
	if(result.info.pageInfo.pageNum < result.info.pageInfo.pages ){
		var pn=result.info.pageInfo.pageNum;
		pagevar.append(nextVar).append(lastVar);
		nextVar.click(function(){
			to_page(pn+1);
			
		});
		lastVar.click(function(){
			
			to_page(result.info.pageInfo.total );
			
		});
		
	}else{
		lastVar.addClass("disabled");
		pagevar.append(lastVar);
		
	}
	
	
	pagevar.appendTo("#page_nav_area");
	
}





</script>



 
</body>
</html>