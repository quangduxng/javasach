
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="js/jquery-1.11.1.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"><script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<style>
	body {  
padding-top: 0px;
}
.carousel-indicators {  
bottom:15px;    
left:10px;  
width:auto; 
margin-left:0;
}
.carousel-indicators li {   
border-radius:0;    
width:8px;  
height:8px; 
background:#fff;
}
.carousel-indicators .active {  
width:10px; 
height:10px;    
background:#3276b1; 
border-color:#3276b1;
}</style>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="HTSach">NHÀ SÁCH</a>
    </div>
    <ul class="nav navbar-nav">
   
			<li><a href="QuanlytaikhoanController"><em
					class="fa fa-calendar">&nbsp;</em> Quản lý tài khoản</a></li>
			<li ><a href="QuanlysachController"><em
					class="fa fa-book">&nbsp;</em> Quản lý sách</a></li>
			<li ><a href="QuanlyloaiController"><em
					class="fa fa-edit">&nbsp;</em> Quản lý loại sách</a></li>	
    </ul>
  </div>
</nav>
  <div class="container"> 
 <div class="row"> 
  <h1 class="text-center">NHÀ SÁCH DEMO</h1> 
  <div class="col-md-6 col-md-offset-3"> 
   <div id="myCarousel" class="carousel slide"> 
    <ol class="carousel-indicators"> 
     <li data-target="#myCarousel" data-slide-to="0" class="active"></li> 
     <li data-target="#myCarousel" data-slide-to="1"></li> 
     <li data-target="#myCarousel" data-slide-to="2"></li> 
     <li data-target="#myCarousel" data-slide-to="3"></li> 
     <li data-target="#myCarousel" data-slide-to="4"></li> 
    </ol> 
    <div class="carousel-inner"> 
     <figure class="item active"> <img class="thumbnail" src="http://www.minhkhai.com.vn/store2/slides/8935280907393.jpg" alt="Slide1"> 
     </figure> 
     <figure class="item"> <img class="thumbnail" src="http://www.minhkhai.com.vn/store2/slides/8935251416398.jpg" alt="Slide2"> 
     </figure> 
     <figure class="item"> <img class="thumbnail" src="http://www.minhkhai.com.vn/store2/slides/8935251414936.jpg" alt="Slide3"> 
     </figure> 
     <figure class="item"> <img class="thumbnail" src="http://www.minhkhai.com.vn/store2/slides/8935251411980.jpg" alt="Slide4"> 
     </figure> 
     <figure class="item"> <img class="thumbnail" src="http://www.minhkhai.com.vn/store2/slides/8935235228894.jpg" alt="Slide5"> 
     </figure> 
    </div> 
   </div> 
  </div> 
 </div>
</div>
  <script>   
$('#myCarousel').carousel({ 
    interval:   4000    
});
</script>


</body>
</html>