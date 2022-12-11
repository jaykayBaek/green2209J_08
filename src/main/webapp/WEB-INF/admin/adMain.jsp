<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<jsp:include page="../../include/bs4.jsp"></jsp:include>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>관리자창</title>
<head>
<style>
        body,h1,h2,h3,h4,h5,h6,span,div,strong {
            font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
            text-decoration: none !important;
        }
        ul, li{
            list-style: none;
            padding:0px;
        }
        a:hover{
            text-decoration: none;
            color:#afafaf;
            transition: color, 0.3s;
        }
        ul{
            color: #fff;
        }
        li{
            padding: 0.5em;
        }
        .admin_nav{
            height: 100%;
            background-color: #007f5f;
        }
        .btn-primary {
            border: 0px;
            background-color: #80b918;
            color: #fff;
            font-weight: bold;
        }
        .btn-primary:hover,
        .btn-primary:active {
            border: 0px;
            background-color: #2b9348;
            color: #fff;
        }
        .badge{
            position: absolute;
            transform: scale(0.8) translate(70%, -10%);
            transform-origin: top right;
            padding: 0.25em 0.4em;
            font-size: 75%;
            font-weight: 700;
            white-space: nowrap;
            border-radius: 0.35rem;
        }
        .nav_title{
            font-weight: 500;
            font-size: 1em;
            border-bottom: 1px solid #fff;
        }
        .nav_main_title{
            font-size: 2em;
            font-weight: bold;
            border-bottom: 1px solid #fff;
        }
        .nav_cont{
            color:#000;
            margin-left:1em;
        }
        .nav_setting{
            color:#000;
        }
        .amount-text{
            color: #495057 !important;
            font-weight: 500 !important;
        }
        .border-weight{
            border-left: 0.5rem solid transparent;
        }
</style>
</head>
<body>
    <div class="container-fluid d-flex flex-row">
    <jsp:include page="/include/adNav.jsp"/>
    
        <!-- 관리자 메인뷰 -->
        <div class="col-10 d-flex flex-column mt-2">
            <!-- 관리자 메인뷰의 메뉴판(검색창, 메시지, 알림) -->
            <nav class="d-flex justify-content-center align-items-center" style="width:100%; height: 10ch;">
                <div class="col-6">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small" placeholder="검색해보세요" aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <ul class="d-flex justify-content-end">
                        <li class="pr-3">
                            <a href="#">
                                <span class="badge badge-danger badge-counter">9+</span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="#d1d3e2" class="bi bi-bell-fill" viewBox="0 0 16 16">
                                    <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
                                </svg>
                            </a>
                        </li>
                        <li class="pr-3" style="border-right:1px solid grey">
                            <a href="#">
                                <span class="badge badge-danger badge-counter">9+</span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="#d1d3e2" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                    <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"/>
                                </svg>
                            </a>
                        </li>
                        <li class="pr-3 nav_setting">
                            <span>안녕하세요, 관리자님</span>
                            <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="#d1d3e2" class="bi bi-gear-fill" viewBox="0 0 16 16">
                                <path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"/>
                            </svg>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- 관리자 메인뷰의 컨텐츠 -->
            <div class="h2 font-weight-bold">Sales Chart</div>
            <div class="row">
                <div class="col">
                    <div class="card border-info border-weight border-right-0 border-top-0 border-bottom-0 shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        매출(연간)
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <span class="amount-text">&#8361 400,000</span>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-coin" viewBox="0 0 16 16">
                                        <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
                                        0-11 5.5 5.5 0 0 1 0 11zm0 .5A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"/>
                                    </svg>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card border-weight border-warning border-right-0 border-top-0 border-bottom-0 shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                        매출(월별)
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <span class="amount-text">&#8361 400,000</span>
                                    </div>
                                </div>
                                <div class="col-auto text-warning">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-coin" viewBox="0 0 16 16">
                                        <path d="M5.5 9.511c.076.954.83 1.697 2.182 1.785V12h.6v-.709c1.4-.098 2.218-.846 2.218-1.932 0-.987-.626-1.496-1.745-1.76l-.473-.112V5.57c.6.068.982.396 1.074.85h1.052c-.076-.919-.864-1.638-2.126-1.716V4h-.6v.719c-1.195.117-2.01.836-2.01 1.853 0 .9.606 1.472 1.613 1.707l.397.098v2.034c-.615-.093-1.022-.43-1.114-.9H5.5zm2.177-2.166c-.59-.137-.91-.416-.91-.836 0-.47.345-.822.915-.925v1.76h-.005zm.692 1.193c.717.166 1.048.435 1.048.91 0 .542-.412.914-1.135.982V8.518l.087.02z"/>
                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                        <path d="M8 13.5a5.5 5.5 0 1 1 0-11 5.5 5.5 0 0 1 0 11zm0 .5A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"/>
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card border-weight border-danger border-right-0 border-top-0 border-bottom-0 shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                        매출(주별)
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <span class="amount-text">&#8361 40,000</span>
                                    </div>
                                </div>
                                <div class="col-auto text-danger">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="495057" class="bi bi-coin" viewBox="0 0 16 16">
                                        <path d="M5.5 9.511c.076.954.83 1.697 2.182 1.785V12h.6v-.709c1.4-.098 2.218-.846 2.218-1.932 0-.987-.626-1.496-1.745-1.76l-.473-.112V5.57c.6.068.982.396 1.074.85h1.052c-.076-.919-.864-1.638-2.126-1.716V4h-.6v.719c-1.195.117-2.01.836-2.01 1.853 0 .9.606 1.472 1.613 1.707l.397.098v2.034c-.615-.093-1.022-.43-1.114-.9H5.5zm2.177-2.166c-.59-.137-.91-.416-.91-.836 0-.47.345-.822.915-.925v1.76h-.005zm.692 1.193c.717.166 1.048.435 1.048.91 0 .542-.412.914-1.135.982V8.518l.087.02z"/>
                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                        <path d="M8 13.5a5.5 5.5 0 1 1 0-11 5.5 5.5 0 0 1 0 11zm0 .5A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"/>
                                    </svg>                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card border-weight border-dark border-right-0 border-top-0 border-bottom-0 shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">
                                        질의응답
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <span class="amount-text">&#8361 7건</span>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="495057" class="bi bi-wechat" viewBox="0 0 16 16">
                                        <path d="M11.176 14.429c-2.665 0-4.826-1.8-4.826-4.018 0-2.22 2.159-4.02 4.824-4.02S16 8.191 16 10.411c0 1.21-.65 2.301-1.666 3.036a.324.324 0 0 0-.12.366l.218.81a.616.616 0 0 1 .029.117.166.166 0 0 1-.162.162.177.177 0 0 1-.092-.03l-1.057-.61a.519.519 0 0 0-.256-.074.509.509 0 0 0-.142.021 5.668 5.668 0 0 1-1.576.22ZM9.064 9.542a.647.647 0 1 0 .557-1 .645.645 0 0 0-.646.647.615.615 0 0 0 .09.353Zm3.232.001a.646.646 0 1 0 .546-1 .645.645 0 0 0-.644.644.627.627 0 0 0 .098.356Z"/>
                                        <path d="M0 6.826c0 1.455.781 2.765 2.001 3.656a.385.385 0 0 1 .143.439l-.161.6-.1.373a.499.499 0 0 0-.032.14.192.192 0 0 0 .193.193c.039 0 .077-.01.111-.029l1.268-.733a.622.622 0 0 1 .308-.088c.058 0 .116.009.171.025a6.83 6.83 0 0 0 1.625.26 4.45 4.45 0 0 1-.177-1.251c0-2.936 2.785-5.02 5.824-5.02.05 0 .1 0 .15.002C10.587 3.429 8.392 2 5.796 2 2.596 2 0 4.16 0 6.826Zm4.632-1.555a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Zm3.875 0a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Z"/>
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-5">

                <div class="col-4">
                    <!-- 인기 카테고리 -->
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary h4">인기 카테고리</h6>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-pie pt-4 pb-2"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                <div id="piechart"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-8">
                    
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-danger h4">수익 추세</h6>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['카테고리', '인기 카테고리'],
                ['판타지', 5.85],
                ['고전문학', 1.66],
                ['로맨스', 10.316],
                ['인문', 5.0791]
            ])

            var options = {
                legend: 'none',
                pieSliceText: 'label',
                pieStartAngle: 100,
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
            chart.draw(data, options);
        }
    </script>
</body>
</html>
</body>
</html>