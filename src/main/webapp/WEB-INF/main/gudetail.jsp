<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
#micrograph {
	min-width: 320px;
	max-width: 600px;
	margin: 0 auto;
}
</style>

<script type="text/javascript">
$(function(){

	var chart = Highcharts.chart('micrograph', {

	    title: {
	        text: '대기 먼지 정보'
	    },

/* 	    subtitle: {
	        text: 'Plain'
	    }, */

	    xAxis: {
	        categories: ['일산화탄소','오존','이산화질소','미세먼지 농도']
	    },

	    series: [{
	        type: 'column',
	        colorByPoint: true,
	        data: <%=request.getAttribute("value")%>,
	        showInLegend: false
	    }],
	    
	    chart: {
            inverted: false,
            polar: false
        }

	});


	$('#plain').click(function () {
	    chart.update({
	        chart: {
	            inverted: false,
	            polar: false
	        },
	        subtitle: {
	            text: 'Plain'
	        }
	    });
	});

	$('#inverted').click(function () {
	    chart.update({
	        chart: {
	            inverted: true,
	            polar: false
	        },
	        subtitle: {
	            text: 'Inverted'
	        }
	    });
	});

	$('#polar').click(function () {
	    chart.update({
	        chart: {
	            inverted: false,
	            polar: true
	        },
	        subtitle: {
	            text: 'Polar'
	        }
	    });
	});
	
	var $play = $('.play'),
    $detail  = $('.detail'),
    $movie = $('.movie', $detail),
    $close = $('.close');

$('.movies .movie').click(function(){
  $movie.html($(this).html());
  $play.appendTo($movie);

  $poster = $('.poster', this).addClass('active');

  $('.poster', $detail).css({
    top: $poster.position().top,
    left: $poster.position().left,
    width: $poster.width(),
    height: $poster.height()
  }).data({
    top: $poster.position().top,
    left: $poster.position().left,
    width: $poster.width(),
    height: $poster.height()
  })

  $detail.show();

  $('.poster', $detail).delay(10).queue(function(next) {
    $detail.addClass('ready');

    next();
  }).delay(100).queue(function(next){
    $(this).css({
      top: '-10%',
      left: '-6%',
      width: 266,
      height: 400
    });
    next();
  })
})


/*--------------------
Close
--------------------*/
function close(){
  console.log('asd');
  $p = $('.detail .poster');
  console.log($p)
  $p.css({
    top: $p.data('top'),
    left: $p.data('left'),
    width: $p.data('width'),
    height: $p.data('height'),
  })
  $detail.removeClass('ready').delay(500).queue(function(next){
    $(this).hide();
    $poster.removeClass('active');
    next();
  });
}

$close.click(close);
$('body').click(function(e){
  $p = $(e.target).parents();
  if ($p.is('.app')){
    return false;
  } else {
    close();
  }
})


/*--------------------
CodePen Thumbnail
--------------------*/
setTimeout(function(){
  $('.movie:eq(0)').click();
}, 300);
setTimeout(function(){
  close();
},1700);

	
	});
</script>
<body>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-sm-8">
				<div class="panel panel-info">
					<div class="panel-heading">마포구</div>
					<div class="panel-body">
						<table class="table table-hover">
							<tr>
								<td class="info text-center" width=50%>현재 미세먼지 (시간 넣을 곳)</td>
								<td class="info text-center" width=50%>행동요령</td>
							</tr>
							<tr>
								<td class="text-center">
									<table class="table">
										<tr>
											<td class="text-left">미세먼지 농도 : ${vo.pm10Value } ㎍/㎥</td>
										</tr>
										<tr>
											<td class="text-left">${state }</td>
										</tr>
									</table>
								</td>
								<td class="text-center">
									<table class="table">
										<tr>
											<td class="text-center">
												<img src="image/${vo.pm10Grade }.png">
											</td>
										</tr>

									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="info"><strong>미세먼지 예보</strong></td>
							</tr>
							<tr>
								<td colspan="2">
									<table class="table">
										<tr>
											<td class="text-center">오늘 오전</td>
											<td class="text-center">오늘 오후</td>
											<td class="text-center">내일 오전</td>
											<td class="text-center">내일 오후</td>
											<td class="text-center">모레 오전</td>
											<td class="text-center">모레 오후</td>
										</tr>
										<tr>
											<td class="text-center">보통</td>
											<td class="text-center">보통</td>
											<td class="text-center">보통</td>
											<td class="text-center">보통</td>
											<td class="text-center">보통</td>
											<td class="text-center">보통</td>
										</tr>
									</table>
									
								</td>

							</tr>
						</table>
					</div>
				</div>
			</div>
			<!-- /.col-lg-8 -->
			<!-- col-lg-4 -->
			<div class="col-sm-4">
				<div id="micrograph"></div>
			</div>
		</div>
		<!-- /.row -->		
		<!--  row -->
		<div class="row">
			<div class="col-sm-12">
				<div class="panel panel-info">
					<div class="panel-heading">종합결과 밑 추천</div>
					<div class="panel-body">
						<div class="col-sm-3">
							<table class="table">
								<tr>
									<td class="text-center" width="20%">결과</td>
								</tr>
								<tr>
									<td>안</td>
								</tr>
							</table>
						</div>
						<div class="col-sm-9">
							<div class="gallery">
								<ul>
									<li><img
										src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/53819/9.png"></li>
									<li><img
										src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/53819/2.png"></li>
									<li><img
										src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/53819/3.png"></li>
									<li><img
										src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/53819/1.png"></li>
									<li><img
										src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/53819/4.png"></li>
									<li><img
										src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/53819/5.png"></li>
									<li><img
										src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/53819/7.png"></li>
									<li><img
										src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/53819/8.png"></li>
									<li><img
										src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/53819/6.png"></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%-- <div class="row">
			<div class="col-sm-12">
				<div class="panel panel-info">
					<div class="panel-heading">종합결과 밑 추천</div>
					<div class="panel-body">
						<div class="col-sm-3">
							<table class="table">
								<tr>
									<td class="text-center" width="20%">결과</td>
								</tr>
								<tr>
									<td>안</td>
								</tr>
							</table>
						</div>
						<div class="col-sm-9">
							<table class="table">
								<tr>
									<td class="text-center" width="80%">추천</td>
								</tr>
								<tr>
									<td><c:forEach begin="0" end="4" step="1">
											<img src="image/none.png" class="img-thumbnail" width=22%>
										</c:forEach></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div> --%>

	</div>
		
		<!-- / row -->
		<!-- /#page-wrapper -->
	<!-- /#wrapper -->
</body>
</html>