<%-- 
    Document   : more_view
    Created on : 8 Jul, 2023, 5:20:37 PM
    Author     : hp
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.jobs"%>
<%@page import="com.dao.jobDAO"%>
<%@page import="com.db.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Use:View Jobs</title>
          <%@include file="all_css.jsp" %> 
    </head>
    <body>
        
         <%@include file="navbar.jsp" %>
         
         <div class="container">
             <div class="row">
                 <div class="col-md-12">
                     <h5 class="text-center text-primary"> All Jobs</h5>
                     <%
                       String loc=request.getParameter("loc");
                       String cat=request.getParameter("cat");
                       String msg="";
                       
                       jobDAO dao=new jobDAO(DBConnection.getConn());
                       List<jobs>list=null;
                       if("lo".equals(loc)&&"cat".equals(cat)){
                           list=new ArrayList<jobs>();
                           msg="job not Available";
                       }
                       else if("lo".equals(loc)||"ca".equals(cat)){
                         list=dao.getJobsOrLocationAndCategory(cat,loc);
                     }
                       else{
                           list=dao.getJobsAndLocationAndCategory(cat,loc);
                       }
                       if(list.isEmpty()){
                            %>
                            <h4 class="text-center text-danger"Job Not Available></h4>
                            <%
                       }
                             if(list!=null){
                             
                            for(jobs j:list){
 %>                          
 <div class="card mt-2">
     <div class="card-body">
         <div class="text-center text-primary">
             <i class="far fa-clipboard fa-2x"></i>
         </div>
         <h6>
             <%=j.getTitle()%>
         </h6>
         <p><%=j.getDescription()%></p>
         <br>
                            
         <div class="form-row">
             <div class="form-group col-md-3">
                 <input type="text"class="form-control form-control-sm"
                        value="Location:<%=j.getLocation()%>"readonly>
             </div>
             <div class="form-group col-md-3">
                 <input type="text"class="form-control form-control-sm"
                        value="Category:<%=j.getCategory()%>"readonly>
             </div>
             
         </div>
             
             <h6>Publish Date: <%=j.getPdate().toString()%></h6>
             <div class="text-center">
                 <a href="one_view.jsp?id<%=j.getId()%>"class="btn btn-sm bg-success text-white"></a>
             </div>
                   
     </div>
 </div>
                                 
                 <%     }

                          }
                          else{
                          %>
                          <h4 class="text-center text-danger"<%=msg%></h4>
                          <%
                          }
              %>


                    
                     
                 </div>
             </div>
         </div>
    </body>
</html>
