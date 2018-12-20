<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/pareto.js"></script>
<script type="text/javascript">
$(function(){
	  var chart =   
		// Create the chart
		  Highcharts.chart('container', {
    chart: {
        renderTo: 'container',
        type: 'column'
    },
    title: {
        text: 'Restaurants Complaints'
    },
    tooltip: {
        shared: true
    },
    xAxis: {
        categories: [
            'Overpriced',
            'Small portions',
            'Wait time',
            'Food is tasteless',
            'No atmosphere',
            'Not clean',
            'Too noisy',
            'Unfriendly staff'
        ],
        crosshair: true
    },
    yAxis: [{
        title: {
            text: ''
        }
    }, {
        title: {
            text: ''
        },
        minPadding: 0,
        maxPadding: 0,
        max: 100,
        min: 0,
        opposite: true,
        labels: {
            format: "{value}%"
        }
    }],
    series: [{
        type: 'pareto',
        name: 'Pareto',
        yAxis: 1,
        zIndex: 10,
        baseSeries: 1
    }, {
        name: 'Complaints',
        type: 'column',
        zIndex: 2,
        data: [755, 222, 151, 86, 72, 51, 36, 10]
    }]
});
});
</script>
</head>
<body>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">메인페이지</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">26</div>
                                    <div>New Comments!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">12</div>
                                    <div>New Tasks!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">124</div>
                                    <div>New Orders!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div> 
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">13</div>
                                    <div>Support Tickets!</div>    
                                </div>    
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Seoul Map
                        </div>
                            <div class="pull-left">
                                 <div class="seoulmap">
										<img src="http://gis.seoul.go.kr/image1/main/seoulmap.jpg" width="800" height="500px" alt="생활지도로 이동. 원하시는 지역을 선택하세요." id="seoul-map-image" usemap="#seoul_map">
										<map id="seoul_map" name="seoul_map">
											<area alt="관악구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="153,316,169,303,178,303,184,296,187,299,207,298,210,301,216,298,216,308,223,321,239,321,245,333,245,341,247,347,231,357,220,368,204,369,194,373,194,368,183,358,177,347,170,344,162,323,168,318,161,312,155,318" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EA%B4%80%EC%95%85%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(1);" onfocus="fn_ShowSeoulGu(1);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="금천구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="126,305,130,305,141,317,152,317,154,319,157,319,161,315,165,318,160,322,167,335,168,346,176,349,181,359,160,378,154,373,153,365,145,353,145,352,139,350,138,337,127,314" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EA%B8%88%EC%B2%9C%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(2);" onfocus="fn_ShowSeoulGu(2);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="구로구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="58,296,71,279,78,278,84,285,102,275,108,280,113,278,115,281,121,281,132,270,147,279,150,303,156,308,152,316,142,316,130,304,125,304,122,299,108,311,96,314,97,321,91,327,84,321,71,320,63,324,68,302,63,301,58,295" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EA%B5%AC%EB%A1%9C%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(3);" onfocus="fn_ShowSeoulGu(3);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="양천구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="68,234,75,225,81,229,83,247,89,253,111,251,116,247,113,227,116,219,123,225,133,224,140,239,140,245,131,255,131,269,121,280,115,281,112,277,108,280,102,275,84,285,77,277,74,280,71,279,69,268,78,255,78,248,69,244," shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EC%96%91%EC%B2%9C%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(4);" onfocus="fn_ShowSeoulGu(4);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="강동구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="377,227,383,218,384,210,387,199,395,191,422,192,435,179,446,176,449,181,449,192,458,209,454,212,458,222,451,229,436,229,429,236,428,246,422,253,415,266,400,257,386,250,387,246,391,237,378,229" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EA%B0%95%EB%8F%99%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(5);" onfocus="fn_ShowSeoulGu(5);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="송파구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="355,259,350,259,366,248,378,229,391,236,386,252,404,259,313,265,408,273,408,276,413,281,422,281,431,290,429,301,420,307,415,315,406,324,400,324,400,331,393,333,380,312,379,307,370,296,359,293,334,279,333,262" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EC%86%A1%ED%8C%8C%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(6);" onfocus="fn_ShowSeoulGu(6);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="강남구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="275,252,279,248,280,245,296,238,304,246,317,252,323,257,334,258,332,262,332,280,357,294,370,298,378,308,379,313,391,333,386,345,376,341,372,344,365,344,365,341,357,336,357,331,346,320,327,330,314,329,315,327,309,320,307,313,300,307,295,307,286,280,287,271" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EA%B0%95%EB%82%A8%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(7);" onfocus="fn_ShowSeoulGu(7);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="서초구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="234,274,250,272,274,253,285,272,284,279,294,398,300,309,305,315,309,322,313,327,311,330,318,332,329,332,345,322,355,333,356,337,363,343,363,345,349,366,338,369,337,379,335,381,329,381,325,386,316,385,300,370,300,351,296,344,296,340,292,336,289,341,281,349,275,351,267,343,267,339,261,334,256,334,256,339,248,343,247,331,240,320,239,316,244,311,242,288,234,276" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EC%84%9C%EC%B4%88%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(8);" onfocus="fn_ShowSeoulGu(8);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="동작구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="183,268,209,261,211,264,222,271,232,274,232,277,240,289,242,310,238,314,238,319,226,320,224,319,218,306,218,297,210,298,209,296,190,298,184,293,177,301,168,302,159,306,165,297,173,291" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EB%8F%99%EC%9E%91%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(9);" onfocus="fn_ShowSeoulGu(9);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="영등포구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="129,204,169,234,188,232,200,236,204,241,202,244,210,260,183,268,172,292,164,298,157,309,148,303,145,279,132,270,130,256,140,243,140,239,132,223" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EC%98%81%EB%93%B1%ED%8F%AC%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(10);" onfocus="fn_ShowSeoulGu(10);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="강서구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="43,158,46,153,60,157,128,205,132,222,124,223,116,216,111,227,111,236,114,236,110,250,90,251,84,246,83,228,75,223,67,234,57,233,53,230,43,238,38,237,36,231,28,227,18,226,11,217,11,214,15,214,21,209,20,203,29,195,31,186,37,186,38,182,47,171" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EA%B0%95%EC%84%9C%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(11);" onfocus="fn_ShowSeoulGu(11);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="용산구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="203,242,219,227,219,219,225,215,230,214,234,217,240,214,250,222,264,221,264,224,261,228,275,246,278.246.277,249,250,270,233,272,212,263" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EC%9A%A9%EC%82%B0%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(12);" onfocus="fn_ShowSeoulGu(12);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="마포구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="133,167,154,187170,203,184,222,210,222,217,214,217,226,203,240,197,234,191,231,167,233,112,187,124,186,130,170" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EB%A7%88%ED%8F%AC%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(13);" onfocus="fn_ShowSeoulGu(13);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="광진구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="336,208,351,194,355,196,368,189,371,191,371,199,366,206,370,210,380,210,380,219,361,245,352,252,329,254,317,247,323,228," shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EA%B4%91%EC%A7%84%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(14);" onfocus="fn_ShowSeoulGu(14);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="성동구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="263,228,268,219,281,195,283,193,285,193,287,195,296,195,305,189,313,198,316,198,324,206,333,207,333,209,322,228,314,249,307,245,297,236,275,245,263,228,266,223,280,196,284,192" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EC%84%B1%EB%8F%99%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(15);" onfocus="fn_ShowSeoulGu(15);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="중구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="219,211,225,206,224,201,229,195,238,195,243,198,258,198,261,195,271,195,274,193,280,193,277,197,265,221,264,219,251,222,240,213,234,215,229,213,223,214,219,217" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EC%A4%91%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(16);" onfocus="fn_ShowSeoulGu(16);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="서대문구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="156,186,164,176,164,172,169,172,169,176,175,176,183,167,183,166,189,160,191,160,197,153,197,147,206,140,204,181,208,194,217,202,223,204,223,206,209,220,186,221,170,201" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EC%84%9C%EB%8C%80%EB%AC%B8%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(17);" onfocus="fn_ShowSeoulGu(17);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="중랑구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="337,130,347,130,349,128,352,130,366,129,371,126,379,126,386,129,386,141,382,146,382,155,385,158,382,161,379,163,371,188,368,187,355,194,351,192,348,193,336,206,343,186,335,167,334,164,334,154,337,150,337,145,336,142,336,132" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EC%A4%91%EB%9E%91%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(18);" onfocus="fn_ShowSeoulGu(18);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="동대문구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="282,185,295,170,313,154,320,154,333,143,336,148,332,153,334,168,341,187,334,205,325,204,317,196,314,196,305,188,303,188,295,193,288,193,284,191" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EB%8F%99%EB%8C%80%EB%AC%B8%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(19);" onfocus="fn_ShowSeoulGu(19);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="은평구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="161,90,167,90,169,92,173,92,192,82,199,74,204,74,219,89,220,96,226,106,230,110,212,115,202,128,202,132,206,134,206,139,203,140,196,148,196,152,191,158,187,159,181,165,181,168,174,174,171,174,168,169,162,171,162,175,156,182,133,165,134,161,138,160,137,167,143,172,148,168,153,167,153,163,156,160,155,148,153,144,152,136,157,131,159,124,162,122," shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EC%9D%80%ED%8F%89%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(20);" onfocus="fn_ShowSeoulGu(20);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="종로구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="202,130,211,115,234,110,244,128,246,146,236,156,244,165,252,166,254,164, 257,164,264,172,265,178,274,179,284,185,284,193,274,193,271,195,261,195,258,198,243,197,239,193,228,194,222,200,210,195,205,179,208,134" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EC%A2%85%EB%A1%9C%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(21);" onfocus="fn_ShowSeoulGu(21);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="성북구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="242,105,254,117,258,118,284,149,306,148,317,136,315,123,324,133,330,134,334,130,334,141,319,152,313,153,293,170,283,184,275,180,266,178,265,172,258,164,251,166,244,165,236,156,245,147,244,127,234,113,234,111" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EC%84%B1%EB%B6%81%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(22);" onfocus="fn_ShowSeoulGu(22);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="노원구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="310,36,323,25,336,25,344,22,353,32,362,32,361,42,358,47,366,53,365,67,358,76,362,91,369,89,378,93,381,107,379,111,373,119,373,125,366,129,352,130,349,128,346,130,334,130,330,134,325,134,304,111,313,95,316,95,316,85" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EB%85%B8%EC%9B%90%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(23);" onfocus="fn_ShowSeoulGu(23);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="도봉구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="267,39,270,35,270,26,276,17,291,17,297,27,305,24,309,28,319,29,312,38,312,69,315,81,318,85,318,97,315,97,306,111,283,87,274,86,272,83,272,70,279,62" shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EB%8F%84%EB%B4%89%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(24);" onfocus="fn_ShowSeoulGu(24);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
											<area alt="강북구. 생활지도로 이동. 원하시는 지역을 선택하세요." coords="251,45,256,39,268,39,281,61,274,71,274,83,284,86,315,121,317,136,307,148,285,149,258,119,242,105,242,90,238,85,237,81,244,70,253,66,252,59," shape="poly" target="_blank" title="새창열림" href="http://gis.seoul.go.kr/SeoulGis/Naver/newLifeMap.jsp?mode=mainMove&amp;query=%EA%B0%95%EB%B6%81%EA%B5%AC&amp;tr_code=area" onmouseover="fn_ShowSeoulGu(25);" onfocus="fn_ShowSeoulGu(25);" onblur="fn_SeoulGuOut()" onmouseout="fn_SeoulGuOut()">
										</map>
									</div>
                            </div>
                    </div>
                    <!-- /.panel -->
                    
                    <!-- /.panel -->
                    
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i> Notifications Panel
                        </div> 
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small"><em>4 minutes ago</em>
                                    </span>
                                </a> 
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small"><em>12 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small"><em>27 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small"><em>11:32 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-bolt fa-fw"></i> Server Crashed!
                                    <span class="pull-right text-muted small"><em>11:13 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-warning fa-fw"></i> Server Not Responding
                                    <span class="pull-right text-muted small"><em>10:57 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-shopping-cart fa-fw"></i> New Order Placed
                                    <span class="pull-right text-muted small"><em>9:49 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-money fa-fw"></i> Payment Received
                                    <span class="pull-right text-muted small"><em>Yesterday</em>
                                    </span>
                                </a>
                            </div>
                            <!-- /.list-group -->
                            <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                   
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
        </div>
        <!-- /#page-wrapper -->
     <div id="container"></div>
    </div>
    <!-- /#wrapper -->
   
</body>
</html>