<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <base href="<%=basePath%>">
    <meta name=”viewport” content=”width=device-width, initial-scale=1″ />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <style type="text/css">
        .spec_input {
            padding-left: 0px !important;
        }
        fieldset {
            padding-top: 17px !important;
        }
        #start_query{
            padding-left: 13px !important;
            margin-left: 30px !important;
        }
        #page-wrapper{
            margin-left: 50px !important;
            margin-right: 50px !important;
        }
        .notification_panel{
            padding-top: 20px !important;
        }
        .tab_text{
            font-size:20px !important;
        }
        #custom_border {
            border-width: 1px;
            border-style: solid;
            border-color: #E3E3E3 #ECECEC #E0E0E0 #E3E3E3;
            -moz-border-top-colors: none;
            -moz-border-right-colors: none;
            -moz-border-bottom-colors: none;
            -moz-border-left-colors: none;
            border-image: none;
            box-shadow: 1px 2px 1px rgba(0, 0, 0, 0.07);
            padding: 8px 9px 14px 7px;
            margin-bottom: 20px;
        }
        h2 {
            text-align: center;
            vertical-align: middle !important;
        }
        #spec_link h3 {
            text-align: center;
            vertical-align: middle !important;
        }
        .text_div {
            margin-left: 15px;
            margin-right: 15px;
            background-color:#eeffff;
        }
        .huge1 {
            font-size:25px !important;
        }
        @media only screen and (max-width:449px){
            .col1{
                font-size:15px !important;
            }
            .col2{
                font-size:9px !important;
            }
        }
        .bootstrap-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn) {
            width: 400px !important;
        }
        .clear{ clear:both}
    </style>
    <title>U928</title>
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/bootstrap/css/bootstrap-datetimepicker11.min.css" rel="stylesheet">
    <link href="static/bootstrap/css/bootstrap-select.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="static/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="static/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="static/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="static/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <script src="static/bootstrap/js/bootstrap-select.min.js"></script>
    <script src="static/bootstrap/js/bootstrap-datetimepicker.js"></script>
    <script src="static/bootstrap/js/bootstrap-datetimepicker.fr.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="static/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src= "static/dist/js/sb-admin-2.js"></script>

    <script src="static/react/react.js"></script>

    <script src="static/react/react-dom.js"></script>

    <script src="static/react/browser.min.js"></script>

    <script src= "static/highcharts/highcharts.js"></script>

    <script src="static/highcharts/highcharts-more.js"></script>

    <script src="static/highcharts/solid-gauge.js"></script>

    <script src="static/highcharts/highcharts-zh_CN.js"></script>
    <script>
        var url1 = 'http://10.255.0.10:5601/app/kibana#/dashboard/HTTP?_g=%28%29&_a=%28filters:!%28%29,options:%28darkTheme:!f%29,panels:!%28%28col:9,id:HTTP-top-%E5%9F%9F%E5%90%8D,panelIndex:1,row:5,size_x:4,size_y:4,type:visualization%29,%28col:1,id:HTTP-%E6%BA%90-ip,panelIndex:2,row:3,size_x:3,size_y:5,type:visualization%29,%28col:4,id:HTTP-%E8%AF%B7%E6%B1%82%E5%88%86%E7%B1%BB,panelIndex:3,row:1,size_x:4,size_y:4,type:visualization%29,%28col:1,id:HTTP-%E8%AF%B7%E6%B1%82%E6%95%B0,panelIndex:4,row:1,size_x:3,size_y:2,type:visualization%29,%28col:8,id:HTTP-%E5%9B%9E%E5%A4%8D,panelIndex:5,row:1,size_x:5,size_y:4,type:visualization%29,%28col:4,id:HTTP-%E6%B5%81%E9%87%8F,panelIndex:6,row:5,size_x:5,size_y:4,type:visualization%29%29,query:%28query_string:%28analyze_wildcard:!t,query:%27srcIP:%20'
        var url2 = '%27%29%29,title:HTTP,uiState:%28P-2:%28vis:%28params:%28sort:%28columnIndex:!n,direction:!n%29%29%29%29%29%29'
        var url3 = 'http://10.255.0.10:5601/app/kibana#/dashboard/xflow?_g=()&_a=(filters:!(),options:(darkTheme:!f),panels:!((col:5,id:netflow-chart,panelIndex:1,row:1,size_x:5,size_y:5,type:visualization),(col:1,id:netflow-table,panelIndex:2,row:1,size_x:4,size_y:5,type:visualization)),query:(query_string:(analyze_wildcard:!t,query:\'srcIP:'
        var url4 = '\')),title:xflow,uiState:(P-2:(vis:(params:(sort:(columnIndex:!n,direction:!n))))))'
        var url5 = 'http://10.255.0.10:5601/app/kibana#/dashboard/DNS?_g=()&_a=(filters:!(),options:(darkTheme:!f),panels:!((col:1,id:DNS-top-ip,panelIndex:1,row:1,size_x:3,size_y:5,type:visualization),(col:1,id:DNS-top-%E5%9F%9F%E5%90%8D,panelIndex:2,row:6,size_x:3,size_y:6,type:visualization),(col:9,id:DNS-top-%E5%9F%9F%E5%90%8D-pie,panelIndex:3,row:5,size_x:4,size_y:4,type:visualization),(col:4,id:DNS-top-%E6%9C%8D%E5%8A%A1%E5%99%A8,panelIndex:4,row:5,size_x:5,size_y:4,type:visualization),(col:4,id:DNS-%E8%AF%B7%E6%B1%82-slash-%E5%9B%9E%E5%A4%8D,panelIndex:5,row:1,size_x:4,size_y:4,type:visualization),(col:8,id:DNS-%E8%AF%B7%E6%B1%82%E7%B1%BB%E5%9E%8B,panelIndex:6,row:1,size_x:5,size_y:4,type:visualization)),query:(query_string:(analyze_wildcard:!t,query:\'dstIP:%20'
        var url6 = '\')),title:DNS,uiState:(P-1:(vis:(params:(sort:(columnIndex:!n,direction:!n)))),P-2:(vis:(params:(sort:(columnIndex:!n,direction:!n))))))'
        var url7 = 'http://10.255.0.10:5601/app/kibana#/dashboard/Syslog?_g=(refreshInterval:(\'$$hashKey\':\'object:2648\',display:\'5%20seconds\',pause:!f,section:1,value:5000),time:(from:now-15m,mode:quick,to:now))&_a=(filters:!(),options:(darkTheme:!f),panels:!((col:3,id:syslog%E9%A5%BC%E7%8A%B6%E5%9B%BE%E5%A4%8D%E6%9D%82,panelIndex:2,row:1,size_x:4,size_y:5,type:visualization),(col:1,columns:!(Level,syslog_message),id:syslog-message,panelIndex:3,row:6,size_x:12,size_y:4,sort:!(\'@timestamp\',asc),type:search),(col:1,id:syslog%E8%AF%B4%E6%98%8E,panelIndex:4,row:1,size_x:2,size_y:5,type:visualization),(col:7,id:syslog-bar,panelIndex:5,row:1,size_x:5,size_y:5,type:visualization)),query:(query_string:(analyze_wildcard:!t,query:\'*\')),title:Syslog,uiState:(P-5:(vis:(legendOpen:!t))))'
        var url8 = 'http://10.255.0.10:5601/app/kibana#/dashboard/NAT?_g=(refreshInterval:(\'$$hashKey\':\'object:7598\',display:\'30%E7%A7%92%E5%88%B7%E6%96%B0\',pause:!f,section:1,value:30000),time:(from:now-15m,mode:quick,to:now))&_a=(filters:!(),options:(darkTheme:!f),panels:!((col:1,id:NAT-chart,panelIndex:1,row:1,size_x:8,size_y:8,type:visualization),(col:9,id:NAT-%E5%85%AC%E7%BD%91-slash-%E5%86%85%E7%BD%91-ip%E6%95%B0,panelIndex:2,row:1,size_x:4,size_y:2,type:visualization),(col:9,id:NAT-%E6%98%A0%E5%B0%84%E8%A1%A8,panelIndex:3,row:3,size_x:4,size_y:6,type:visualization)),query:(query_string:(analyze_wildcard:!t,query:\'*\')),title:NAT,uiState:(P-3:(vis:(params:(sort:(columnIndex:!n,direction:!n))))))'
    </script>

</head>

<body>
    <div id="wrapper">
        <!-- Navigation -->
        <div class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">SJTU U928</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <!-- /.navbar-static-side -->
        </div>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge1 col1" id = "http_tips">异常事件管理</div>
                                </div>
                            </div>
                        </div>
                        <a href="http://10.255.0.10:11025/polls/pages/eventManage.html" id="http_tips_url" target="_blank">
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
                                    <div class="huge1 col1" id = "dns_tips">Drools 规则引擎</div>
                                </div>
                            </div>
                        </div>
                        <a href="pages/verLuoSJ.jsp" id="dns_tips_url" target="_blank">
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
                                    <div class="huge1 col1">服务器异常流量检测</div>
                                </div>
                            </div>
                        </div>
                        <a href="pages/Server.jsp" target="_blank">
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
                                    <i class="fa fa-warning fa-fw fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge1 col1" id="syslog_tips">Critical</div>
                                    <div class="col2">警报等级最高的Syslog</div>
                                </div>
                            </div>
                        </div>
                        <a href="#" id="syslog_tips_url" target="_blank">
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
                <div class="col-4">
                    <div class="col-md-4 switch-right" id="custom_border">
                        <div class="switch-right-grid">
                            <div class="switch-right-grid1">
                                <div class="col-lg-6 col-md-6">
                                    <div>
                                        <h2>上行流量</h2>
                                        <div id="spec_link">
                                            <h3 id="spec_link"><a href="http://10.255.0.10:5601/app/kibana#/dashboard/mac%E6%B5%81%E9%87%8F%E5%92%8C%E5%8D%8F%E8%AE%AE%E5%8C%85%E4%B8%AA%E6%95%B0?_g=(refreshInterval:(%27$$hashKey%27:%27object:228%27,display:%275%E7%A7%92%E5%88%B7%E6%96%B0%27,pause:!f,section:1,value:5000),time:(from:now-15m,interval:%2710s%27,mode:quick,timezone:Asia%2FShanghai,to:now))&_a=(filters:!(),options:(darkTheme:!f),panels:!((col:4,id:packet,panelIndex:1,row:1,size_x:9,size_y:4,type:visualization),(col:4,id:mac%E6%B5%81%E9%87%8F,panelIndex:3,row:5,size_x:9,size_y:4,type:visualization),(col:1,id:%E6%AF%8F%E7%A7%92%E6%9C%80%E5%A4%A7%E5%8C%85%E6%95%B0%E7%9B%AE,panelIndex:4,row:1,size_x:3,size_y:4,type:visualization),(col:1,id:%E6%AF%8F%E7%A7%92%E6%9C%80%E5%A4%A7%E5%87%BA%E6%B5%81%E9%87%8F,panelIndex:5,row:7,size_x:3,size_y:2,type:visualization),(col:1,id:%E6%AF%8F%E7%A7%92%E6%9C%80%E5%A4%A7%E5%85%A5%E6%B5%81%E9%87%8F,panelIndex:6,row:5,size_x:3,size_y:2,type:visualization)),query:(query_string:(analyze_wildcard:!t,query:%27*%27)),title:mac%E6%B5%81%E9%87%8F%E5%92%8C%E5%8D%8F%E8%AE%AE%E5%8C%85%E4%B8%AA%E6%95%B0,uiState:())" target="view_window" id="through_put1">0Mbps</a></h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div>
                                        <h2>下行流量</h2>
                                        <div id="spec_link">
                                            <h3 id="spec_link"><a href="http://10.255.0.10:5601/app/kibana#/dashboard/mac%E6%B5%81%E9%87%8F%E5%92%8C%E5%8D%8F%E8%AE%AE%E5%8C%85%E4%B8%AA%E6%95%B0?_g=(refreshInterval:(%27$$hashKey%27:%27object:228%27,display:%275%E7%A7%92%E5%88%B7%E6%96%B0%27,pause:!f,section:1,value:5000),time:(from:now-15m,interval:%2710s%27,mode:quick,timezone:Asia%2FShanghai,to:now))&_a=(filters:!(),options:(darkTheme:!f),panels:!((col:4,id:packet,panelIndex:1,row:1,size_x:9,size_y:4,type:visualization),(col:4,id:mac%E6%B5%81%E9%87%8F,panelIndex:3,row:5,size_x:9,size_y:4,type:visualization),(col:1,id:%E6%AF%8F%E7%A7%92%E6%9C%80%E5%A4%A7%E5%8C%85%E6%95%B0%E7%9B%AE,panelIndex:4,row:1,size_x:3,size_y:4,type:visualization),(col:1,id:%E6%AF%8F%E7%A7%92%E6%9C%80%E5%A4%A7%E5%87%BA%E6%B5%81%E9%87%8F,panelIndex:5,row:7,size_x:3,size_y:2,type:visualization),(col:1,id:%E6%AF%8F%E7%A7%92%E6%9C%80%E5%A4%A7%E5%85%A5%E6%B5%81%E9%87%8F,panelIndex:6,row:5,size_x:3,size_y:2,type:visualization)),query:(query_string:(analyze_wildcard:!t,query:%27*%27)),title:mac%E6%B5%81%E9%87%8F%E5%92%8C%E5%8D%8F%E8%AE%AE%E5%8C%85%E4%B8%AA%E6%95%B0,uiState:())" target="view_window" id="through_put2">0Mbps</a></h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="sparkline" id="dns1">
                        </div>
                    </div>
                    <div class="col-md-4 switch-right" id="custom_border">
                        <div class="switch-right-grid" id="text2">
                        </div>
                        <div class="sparkline" id="dns2">
                        </div>
                    </div>
                    <div class="col-md-4 switch-right" id="custom_border">
                        <div class="switch-right-grid" id = "text3">
                        </div>
                        <div class="sparkline" id="dns3">
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <div class="row">
                <div class="col-4">
                    <div class="col-md-4 switch-right" id="custom_border">
                        <div class="switch-right-grid">
                            <div class="switch-right-grid1" id="text4">
                            </div>
                        </div>
                        <div class="sparkline" id="dns4">
                        </div>
                    </div>
                    <div class="col-md-4 switch-right" id="custom_border">
                        <div class="switch-right-grid" id="text5">
                        </div>
                        <div class="sparkline" id="dns5">
                        </div>
                    </div>
                    <div class="col-md-4 switch-right" id="custom_border">
                        <div class="switch-right-grid" id = "text6">
                        </div>
                        <div class="sparkline" id="dns6">
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!-- /.row -->
            <div class = "row">
                <div class="col-lg-12" id="container_table2">
                </div>
            </div>
            <div class="row" id = "alarm_try">

            </div>
    </div>

    <script type="text/babel">
        var attack_info = [["DNS  放大攻击","4 minutes ago"],["LAND 攻击","12 minutes ago"],["TCP SYN 攻击","27 minutes ago"],["长ICMP报文攻击","11:32 AM"],
            ["ACK缺陷TCP报文攻击","11:13 AM"],["分片IP报文攻击","11:13 AM"],["分片IP报文攻击","10:57 AM"],["SMUURF攻击","9:49 AM"],["VTY攻击","Yesterday"]];
        var attack_info2 = [["Syslog Critical","PIC0 of LPU 1 is failed, perhaps RXPowLowAlarm of XFP0 ALARM is abnormal.(EntityPhysicalIndex=16843009, EntityPhysicalIndex=16843009, EntPhysicalName=\"GigabitEthernet1/0/0\", EntityTrapFaultID=136196)","设备ID: DXY-SHOU-HW-NE40E-01"],
            ["Syslog Error","The optical module failed. (Reason=\"Card0 XFP RX power low alarm, Current Rxpower is -25.85dBm, threshold is -26.02dBm.\")","设备ID: DXY-SHOU-HW-NE40E-01"],
            ["Syslog Warning"," The optical module recovered from total failure.(EntityPhysicalIndex=16843009, EntityPhysicalIndex=16843009, EntPhysicalName=\"GigabitEthernet1/0/0\", EntityTrapFaultID=136192)","设备ID: DXY-SHOU-HW-NE40E-01"],
            ["DNS 放大攻击","放大攻击（也称为杠杆攻击，英文名DNS Amplification Attack），利用回复包比请求包大的特点（放大流量），伪造请求包的源IP地址，将应答包引向被攻击的目标。对于DNS服务器来说，只需要抛弃不是自己发出去的请求包的应答包即可。","DNS服务器的ip为   202.121.64.5"]];
        var Specific_infomation = React.createClass({
            render: function(){
                return(
                        <div className="col-lg-8">
                            <div className="panel panel-default">
                                <div className="col-md-12 notification_panel">
                                    <div className="thumbnail">
                                        <div className="caption-full">
                                            <h3><a href={this.props.attackurl} target="blank_window">{this.props.attackname}</a></h3>
                                            <br/>
                                            <p>{this.props.attackinfo}</p>
                                            <br/>
                                            <h4><p>{this.props.attackdevice}</p></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                );
            }
        })
        var AlarmTotal =  React.createClass({
            getInitialState: function() {
                return{
                    data: attack_info,
                    specfic_info: [attack_info2[3][0],attack_info2[3][1],attack_info2[3][2]]
                };
            },
            componentDidMount(){
                setInterval(function () {
                    var myDate = new Date();
                    var index = Math.ceil(Math.random()*3);
                    attack_info.splice(9,1);
                    attack_info.unshift([attack_info2[index][0] , myDate.getHours()+":"+myDate.getMinutes()+":"+myDate.getSeconds()]);
                    var update_info = [attack_info2[index][0],attack_info2[index][1],attack_info2[index][2]]
                    this.setState({data:attack_info});
                    this.setState({specfic_info:update_info});
                }.bind(this),10000);
            },
            render: function() {
                var index=0;
                var rows = [];
                var lastCategory = null;
                this.state.data.forEach(function(product) {
                    if(index<9) {
                        rows.push(<AlarmUint attackName={product[0]} attackTime={product[1]} />);
                    }
                    index = index + 1;
                });
                return (
                        <div className="row">
                            <Specific_infomation attackname={this.state.specfic_info[0]} attackinfo={this.state.specfic_info[1]} attackdevice={this.state.specfic_info[2]} attackurl={url7}/>
                            <div className="col-lg-4">
                                <div className="panel panel-default">
                                    <div className="panel-heading">
                                        <i className="fa fa-bell fa-fw"></i> Notifications Panel
                                    </div>
                                    <div className="panel-body">
                                        <div className="list-group">
                                            {rows}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                );
            }
        });
        var AlarmUint = React.createClass({
            render: function() {
                return (
                        <a href="#" className="list-group-item">
                            <i className="fa fa-warning fa-fw"></i> {this.props.attackName}
                            <span className="pull-right text-muted small"><em>{this.props.attackTime}</em>
                    </span>
                        </a>
                );
            }
        });
        ReactDOM.render(
                <AlarmTotal products={attack_info}/>, document.getElementById('alarm_try')
        );
    </script>

    <script type="text/babel">
        var get_text = function(type){
            const comment = {
                title1: main_title[type-1],
                title2: sub_title[type-1],
                title3: third_title[type-1]
            }
            return comment;
        }
        var string_parse = function (my_list) {
            var tmp_list = my_list.split(",");
            var ret = [];
            var total = 0;
            for (var x = 0; x < tmp_list.length/2; x++) {
                total = total + parseInt(tmp_list[x*2+1]);
              }
            return new Array(total,parseInt(tmp_list[1]),tmp_list[0]);
        }
        function Clock(props) {
          return (
            <div className="row">
                  <div className="text_div">
                      <h2>{props.sub_title}</h2>
                      <div id="spec_link">
                          <h3 id="spec_link"><a href={props.target_url} target="view_window">{props.third_title}</a></h3>
                      </div>
                    </div>
            </div>
          );
        }
        var gaugeOptions = {
            chart: {
                type: 'solidgauge'
            },
            title: null,
            pane: {
                center: ['50%', '85%'],
                size: '140%',
                startAngle: -90,
                endAngle: 90,
                background: {
                    backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
                    innerRadius: '60%',
                    outerRadius: '100%',
                    shape: 'arc'
                }
            },
            tooltip: {
                enabled: true
            },
            // the value axis
            yAxis: {
                stops: [
                    [0.1, '#55BF3B'], // green
                    [0.5, '#DDDF0D'], // yellow
                    [0.9, '#DF5353'] // red
                ],
                lineWidth: 0,
                minorTickInterval: null,
                tickPixelInterval: 400,
                tickWidth: 0,
                title: {
                    y: -70
                },
                labels: {
                    y: 16
                }
            },
            plotOptions: {
                solidgauge: {
                    dataLabels: {
                        y: 5,
                        borderWidth: 0,
                        useHTML: true
                    }
                }
            }
        };
        var column_handle = function paint_column(div_id,result){
            var my_data = string_parse(result);
            var tmp_max = my_data[1];
            $(function () {
                $('#'+div_id).highcharts({
                    chart: {
                        type: 'gauge',
                        plotBackgroundColor: null,
                        plotBackgroundImage: null,
                        plotBorderWidth: 0,
                        plotShadow: false
                    },
                    title: {
                        text: ''
                    },
                    credits:{
                        enabled:false
                    },
                    pane: {
                        startAngle: -150,
                        endAngle: 150,
                        background: [{
                            backgroundColor: {
                                linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                                stops: [
                                    [0, '#FFF'],
                                    [1, '#333']
                                ]
                            },
                            borderWidth: 0,
                            outerRadius: '109%'
                        }, {
                            backgroundColor: {
                                linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                                stops: [
                                    [0, '#333'],
                                    [1, '#FFF']
                                ]
                            },
                            borderWidth: 1,
                            outerRadius: '107%'
                        }, {
                            // default background
                        }, {
                            backgroundColor: '#DDD',
                            borderWidth: 0,
                            outerRadius: '105%',
                            innerRadius: '103%'
                        }]
                    },
                    // the value axis
                    yAxis: {
                        min: 0,
                        max: 10,
                        minorTickInterval: 'auto',
                        minorTickWidth: 1,
                        minorTickLength: 10,
                        minorTickPosition: 'inside',
                        minorTickColor: '#666',
                        tickPixelInterval: 30,
                        tickWidth: 2,
                        tickPosition: 'inside',
                        tickLength: 10,
                        tickColor: '#666',
                        labels: {
                            step: 2,
                            rotation: 'auto',
                        },
                        title: {
                            style: {
                                fontSize:'25px'  //字体
                            },
                            text: (tmp_max/1000000000).toString().substring(0,3)+'Gbph'
                        },
                        plotBands: [{
                            from: 0,
                            to: 6,
                            color: '#55BF3B' // green
                        }, {
                            from: 6,
                            to: 8,
                            color: '#DDDF0D' // yellow
                        }, {
                            from: 8,
                            to: 10,
                            color: '#DF5353' // red
                        }]
                    },
                    tooltip: {
                        style: {
                            fontSize:'25px'  //字体
                        }
                    },
                    series: [{
                        name: '吞吐量',
                        data: [Math.round(tmp_max/10000000)/100],
                        tooltip: {
                            valueSuffix: 'Gbph'
                        }
                    }]
                });
            });
            return my_data;
        }
        var http_handle = function paint_column(div_id,result,on_off){
            var my_data = string_parse(result);
            var tmp_max = my_data[1];
            $(function () {
                $('#'+div_id).highcharts({
                    chart: {
                        type: 'gauge',
                        plotBackgroundColor: null,
                        plotBackgroundImage: null,
                        plotBorderWidth: 0,
                        plotShadow: false
                    },
                    title: {
                        text: ''
                    },
                    credits:{
                        enabled:false
                    },
                    pane: {
                        startAngle: -150,
                        endAngle: 150,
                        background: [{
                            backgroundColor: {
                                linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                                stops: [
                                    [0, '#FFF'],
                                    [1, '#333']
                                ]
                            },
                            borderWidth: 0,
                            outerRadius: '109%'
                        }, {
                            backgroundColor: {
                                linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                                stops: [
                                    [0, '#333'],
                                    [1, '#FFF']
                                ]
                            },
                            borderWidth: 1,
                            outerRadius: '107%'
                        }, {
                            // default background
                        }, {
                            backgroundColor: '#DDD',
                            borderWidth: 0,
                            outerRadius: '105%',
                            innerRadius: '103%'
                        }]
                    },
                    // the value axis
                    yAxis: {
                        min: 0,
                        max: 100,
                        minorTickInterval: 'auto',
                        minorTickWidth: 1,
                        minorTickLength: 10,
                        minorTickPosition: 'inside',
                        minorTickColor: '#666',
                        tickPixelInterval: 30,
                        tickWidth: 2,
                        tickPosition: 'inside',
                        tickLength: 10,
                        tickColor: '#666',
                        labels: {
                            step: 2,
                            rotation: 'auto',
                        },
                        title: {
                            style: {
                                fontSize:'22px'  //字体
                            },
                            text: (tmp_max/1000).toString().substring(0,3)+'千次请求/小时'
                        },
                        plotBands: [{
                            from: 0,
                            to: 60,
                            color: '#55BF3B' // green
                        }, {
                            from: 60,
                            to: 80,
                            color: '#DDDF0D' // yellow
                        }, {
                            from: 80,
                            to: 100,
                            color: '#DF5353' // red
                        }]
                    },
                    tooltip: {
                        style: {
                            fontSize:'25px'  //字体
                        }
                    },
                    series: [{
                        name: '吞吐量',
                        data: [tmp_max/1000],
                        tooltip: {
                            valueSuffix: '千次请求/小时'
                        }
                    }]
                });
            });
            return my_data;
        }
        var syslog_handle = function paint_pie(div_id,result){
            var my_data = string_parse(result);
            $(function () {
                $('#'+div_id).highcharts({
                        chart: {
                            type: 'gauge',
                            plotBackgroundColor: null,
                            plotBackgroundImage: null,
                            plotBorderWidth: 0,
                            plotShadow: false
                        },
                        credits:{
                            enabled:false
                        },
                        title: {
                            text: ''
                        },
                        pane: {
                            startAngle: -150,
                            endAngle: 150,
                            background: [{
                                backgroundColor: {
                                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                                    stops: [
                                        [0, '#FFF'],
                                        [1, '#333']
                                    ]
                                },
                                borderWidth: 0,
                                outerRadius: '109%'
                            }, {
                                backgroundColor: {
                                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                                    stops: [
                                        [0, '#333'],
                                        [1, '#FFF']
                                    ]
                                },
                                borderWidth: 1,
                                outerRadius: '107%'
                            }, {
                                // default background
                            }, {
                                backgroundColor: '#DDD',
                                borderWidth: 0,
                                outerRadius: '105%',
                                innerRadius: '103%'
                            }]
                        },
                        // the value axis
                        yAxis: {
                            min: 0,
                            max: 100,
                            minorTickInterval: 'auto',
                            minorTickWidth: 1,
                            minorTickLength: 10,
                            minorTickPosition: 'inside',
                            minorTickColor: '#666',
                            tickPixelInterval: 30,
                            tickWidth: 2,
                            tickPosition: 'inside',
                            tickLength: 10,
                            tickColor: '#666',
                            labels: {
                                step: 2,
                                rotation: 'auto'
                            },
                            title: {
                                style: {
                                    fontSize:'22px'  //字体
                                },
                                text: '当前小时所占百分比'
                            },
                            plotBands: [{
                                from: 0,
                                to: 60,
                                color: '#55BF3B' // green
                            }, {
                                from: 60,
                                to: 80,
                                color: '#DDDF0D' // yellow
                            }, {
                                from: 80,
                                to: 100,
                                color: '#DF5353' // red
                            }]
                        },
                        tooltip: {
                            style: {
                                fontSize:'25px'  //字体
                            }
                        },
                        series: [{
                            name: my_data[2]+'所占比例',
                            data: [Math.round(my_data[1]/my_data[0]*100)],
                            tooltip: {
                                valueSuffix: ' %'
                            }
                        }]
                    },
                    function (chart) {
                    });
            });
            return my_data;
        }
        var nat_handle = function paint_pie(div_id,result){
            var my_data = string_parse(result);
            $(function () {
                $('#'+div_id).highcharts({
                        chart: {
                            type: 'gauge',
                            plotBackgroundColor: null,
                            plotBackgroundImage: null,
                            plotBorderWidth: 0,
                            plotShadow: false
                        },
                        title: {
                            text: ''
                        },
                        credits:{
                            enabled:false
                        },
                        pane: {
                            startAngle: -150,
                            endAngle: 150,
                            background: [{
                                backgroundColor: {
                                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                                    stops: [
                                        [0, '#FFF'],
                                        [1, '#333']
                                    ]
                                },
                                borderWidth: 0,
                                outerRadius: '109%'
                            }, {
                                backgroundColor: {
                                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                                    stops: [
                                        [0, '#333'],
                                        [1, '#FFF']
                                    ]
                                },
                                borderWidth: 1,
                                outerRadius: '107%'
                            }, {
                                // default background
                            }, {
                                backgroundColor: '#DDD',
                                borderWidth: 0,
                                outerRadius: '105%',
                                innerRadius: '103%'
                            }]
                        },
                        // the value axis
                        yAxis: {
                            min: 0,
                            max: 100,
                            minorTickInterval: 'auto',
                            minorTickWidth: 1,
                            minorTickLength: 10,
                            minorTickPosition: 'inside',
                            minorTickColor: '#666',
                            tickPixelInterval: 30,
                            tickWidth: 2,
                            tickPosition: 'inside',
                            tickLength: 10,
                            tickColor: '#666',
                            labels: {
                                step: 2,
                                rotation: 'auto'
                            },
                            title: {
                                style: {
                                    fontSize:'22px'  //字体
                                },
                                text: '当前小时所占百分比'
                            },
                            plotBands: [{
                                from: 0,
                                to: 60,
                                color: '#55BF3B' // green
                            }, {
                                from: 60,
                                to: 80,
                                color: '#DDDF0D' // yellow
                            }, {
                                from: 80,
                                to: 100,
                                color: '#DF5353' // red
                            }]
                        },
                        tooltip: {
                            style: {
                                fontSize:'25px'  //字体
                            }
                        },
                        series: [{
                            name: '内网IP所占比例',
                            data: [Math.round(my_data[1]/100000*100)],
                            tooltip: {
                                valueSuffix: ' %'
                            }
                        }]
                    },
                    function (chart) {
                    });
            });
            my_data[2] = my_data[1];
            return my_data;
        }
        var dns_handle = function paint_pie(div_id,result) {
            result = result.split(' ');
            var my_data1 = string_parse(result[0]);
            var my_data2 = string_parse(result[1]);
            var max = my_data1[1];
            var max2 = my_data2[1];
            if (max>max2){
                var result = my_data1[0];
            }else{
                max = max2;
                var result = my_data2[0];
                my_data1 = my_data2;
            }
            var tmp_max = max;
            $(function () {
                $('#'+div_id).highcharts({
                        chart: {
                            type: 'gauge',
                            plotBackgroundColor: null,
                            plotBackgroundImage: null,
                            plotBorderWidth: 0,
                            plotShadow: false
                        },
                        title: {
                            text: ''
                        },
                        credits:{
                            enabled:false
                        },
                        pane: {
                            startAngle: -150,
                            endAngle: 150,
                            background: [{
                                backgroundColor: {
                                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                                    stops: [
                                        [0, '#FFF'],
                                        [1, '#333']
                                    ]
                                },
                                borderWidth: 0,
                                outerRadius: '109%'
                            }, {
                                backgroundColor: {
                                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                                    stops: [
                                        [0, '#333'],
                                        [1, '#FFF']
                                    ]
                                },
                                borderWidth: 1,
                                outerRadius: '107%'
                            }, {
                                // default background
                            }, {
                                backgroundColor: '#DDD',
                                borderWidth: 0,
                                outerRadius: '105%',
                                innerRadius: '103%'
                            }]
                        },
                        // the value axis
                        yAxis: {
                            min: 0,
                            max: 150,
                            minorTickInterval: 'auto',
                            minorTickWidth: 1,
                            minorTickLength: 10,
                            minorTickPosition: 'inside',
                            minorTickColor: '#666',
                            tickPixelInterval: 50,
                            tickWidth: 2,
                            tickPosition: 'inside',
                            tickLength: 10,
                            tickColor: '#666',
                            labels: {
                                step: 2,
                                rotation: 'auto'
                            },
                            title: {
                                style: {
                                    fontSize:'22px'  //字体
                                },
                                text: (tmp_max/10000).toString().substring(0,4)+'万次请求/小时'
                            },
                            plotBands: [{
                                from: 0,
                                to: 90,
                                color: '#55BF3B' // green
                            }, {
                                from: 90,
                                to: 120,
                                color: '#DDDF0D' // yellow
                            }, {
                                from: 120,
                                to: 150,
                                color: '#DF5353' // red
                            }]
                        },
                        tooltip: {
                            style: {
                                fontSize:'25px'  //字体
                            }
                        },
                        series: [{
                            name: '吞吐量',
                            data: [Math.round(tmp_max/10000)],
                            tooltip: {
                                valueSuffix: '万次请求/每小时'
                            }
                        }]
                    },
                    function (chart) {
                    });
            });
            return my_data1;
        }
        var handle_list = new Array(column_handle,nat_handle,dns_handle,column_handle,http_handle,syslog_handle)
        var main_title=["Http请求流量排名","Nat量排名","DNS请求与回复排名","NetFlow流量排名","网页访问次数排名","Syslog警报占比"]
        var sub_title=["Http请求流量排名","Nat转换次数最多的Ip","DNS流量最大的Ip","NetFlow流量最大的Ip","物理接口裸流量大小","Syslog最高级别的警报","正在访问外网的内网Ip数"]
        var third_title=["Ip地址：","Ip地址:","Ip地址:","Ip地址:","流量大小:","最高级别的警告:","Ip个数:"]

        function paint_picture(text_part,dns_part,type,extra_cmd,handle_type) {
            $.ajax({url:"./ajaxRequest.do?input="+type,success:function(result){
                var tmp2 = handle_list[handle_type-1](dns_part,result);
                if (extra_cmd == 7){
                    type = 5;
                    tmp2[2] = '12345678910';
                }
                var tmp = get_text(type);
                var title3 = third_title[type-1]+tmp2[2];
                var url_alt = url1 + tmp2[2] +url2;
                if (type == 4){
                    url_alt = url3 + tmp2[2] +url4;
                }else if (type == 3){
                    url_alt = url5 + tmp2[2] +url6;
                }else if (type == 6){
                    url_alt = url7;
                }else if (type == 7){
                    url_alt = url8;
                }
                ReactDOM.render(
                  <Clock
                    main_title={tmp.title1}
                    sub_title={tmp.title2}
                    third_title={title3}
                    target_url={url_alt}/>,
                  document.getElementById(text_part)
                );
            }})
        }

        function query_raw_data() {
          $.ajax({url:"./sqlRequest.do",success:function(result){
            ReactDOM.render(
              <Clock
                main_title={result}
                sub_title={result}
                third_title={result}
                target_url={result}/>,
              document.getElementById('text1')
            );
          }})
        }

        $(function () {
          $('#dns1').highcharts({
              chart: {
                type: 'gauge',
                plotBackgroundColor: null,
                plotBackgroundImage: null,
                plotBorderWidth: 0,
                plotShadow: false
              },
              title: {
                text: ''
              },
              pane: {
                startAngle: -150,
                endAngle: 150,
                background: [{
                  backgroundColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                    stops: [
                      [0, '#FFF'],
                      [1, '#333']
                    ]
                  },
                  borderWidth: 0,
                  outerRadius: '109%'
                }, {
                  backgroundColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                    stops: [
                      [0, '#333'],
                      [1, '#FFF']
                    ]
                  },
                  borderWidth: 1,
                  outerRadius: '107%'
                }, {
                  // default background
                }, {
                  backgroundColor: '#DDD',
                  borderWidth: 0,
                  outerRadius: '105%',
                  innerRadius: '103%'
                }]
              },
              // the value axis
              yAxis: {
                min: 0,
                max: 1000,
                minorTickInterval: 'auto',
                minorTickWidth: 1,
                minorTickLength: 10,
                minorTickPosition: 'inside',
                minorTickColor: '#666',
                tickPixelInterval: 30,
                tickWidth: 2,
                tickPosition: 'inside',
                tickLength: 10,
                tickColor: '#666',
                labels: {
                  step: 2,
                  rotation: 'auto'
                },
                title: {
                  text: ''
                },
                plotBands: [{
                  from: 0,
                  to: 600,
                  color: '#55BF3B' // green
                }, {
                  from: 600,
                  to: 800,
                  color: '#DDDF0D' // yellow
                }, {
                  from: 800,
                  to: 1000,
                  color: '#DF5353' // red
                }]
              },
              series: [{
                name: '吞吐量',
                data: [{
                  id: 'hour',
                  y: [0],
                  dial: {
                    radius: '60%',
                    baseWidth: 4,
                    baseLength: '95%',
                    rearLength: 0,
                    backgroundColor: '#0066FF'
                  }
                }, {
                  id: 'minute',
                  y: [0],
                  name: '吞吐量',
                  dial: {
                    backgroundColor: '#009933'
                  }
                }],
                tooltip: {valueSuffix: 'Mbps'},
                animation: false,
                dataLabels: {
                  enabled: false
                }
              }],
              credits:{
                enabled:false
              }
            },
            // Add some l
            function (chart) {
              if (!chart.renderer.forExport) {
                setInterval(function () {
                  var point = chart.get('hour'), point2 = chart.get('minute');
                  $.ajax({url:"./sqlRequest.do",success:function(result){
                    var result_set = result.split(' ');
                    point.update(parseInt(result_set[0]));
                    point2.update(parseInt(result_set[1]));
                    document.getElementById("through_put1").innerHTML = result_set[0]+'Mbps';
                    document.getElementById("through_put2").innerHTML = result_set[1]+'Mbps';
                  }})
                }, 2000);
              }
            });
        });
        //paint_picture('text1','dns1',1,7,1);
        //query_raw_data();
        paint_picture('text2','dns2',4,1,4);
        paint_picture('text3','dns3',1,0,5);
        paint_picture('text4','dns4',7,0,2);
        paint_picture('text5','dns5',3,2,3);
        paint_picture('text6','dns6',6,3,6);
    </script>
      <script type="text/babel">
          var dic = {"dns_part1": "http://10.255.0.10:5601/app/kibana#/dashboard/DNS?_g=(refreshInterval:(%27$$hashKey%27:%27object:908%27,display:%275%E7%A7%92%E5%88%B7%E6%96%B0%27,pause:!t,section:1,value:5000),time:(",
              "dns_part2": "))&_a=(filters:!(),options:(darkTheme:!f),panels:!((col:1,id:DNS-top-ip,panelIndex:1,row:1,size_x:3,size_y:5,type:visualization),(col:1,id:DNS-top-%E5%9F%9F%E5%90%8D,panelIndex:2,row:6,size_x:3,size_y:5,type:visualization),(col:9,id:DNS-top-%E5%9F%9F%E5%90%8D-pie,panelIndex:3,row:6,size_x:4,size_y:5,type:visualization),(col:4,id:DNS-top-%E6%9C%8D%E5%8A%A1%E5%99%A8,panelIndex:4,row:6,size_x:5,size_y:5,type:visualization),(col:4,id:DNS-%E8%AF%B7%E6%B1%82-slash-%E5%9B%9E%E5%A4%8D,panelIndex:5,row:1,size_x:4,size_y:5,type:visualization),(col:8,id:DNS-%E8%AF%B7%E6%B1%82%E7%B1%BB%E5%9E%8B,panelIndex:6,row:1,size_x:5,size_y:5,type:visualization)),query:(query_string:(analyze_wildcard:!t,query:",
              "dns_part3": ")),title:DNS,uiState:(P-1:(vis:(params:(sort:(columnIndex:!n,direction:!n)))),P-2:(vis:(params:(sort:(columnIndex:!n,direction:!n))))))",
              "nat_part1": "http://10.255.0.10:5601/app/kibana#/dashboard/NAT?_g=(refreshInterval:(%27$$hashKey%27:%27object:558%27,display:%2730%E7%A7%92%E5%88%B7%E6%96%B0%27,pause:!f,section:1,value:30000),time:(",
              "nat_part2": "))&_a=(filters:!(),options:(darkTheme:!f),panels:!((col:1,id:NAT-chart,panelIndex:1,row:1,size_x:8,size_y:8,type:visualization),(col:9,id:NAT-%E5%85%AC%E7%BD%91-slash-%E5%86%85%E7%BD%91-ip%E6%95%B0,panelIndex:2,row:1,size_x:4,size_y:2,type:visualization),(col:9,id:NAT-%E6%98%A0%E5%B0%84%E8%A1%A8,panelIndex:3,row:3,size_x:4,size_y:6,type:visualization)),query:(query_string:(analyze_wildcard:!t,query:",
              "nat_part3": ")),title:NAT,uiState:(P-3:(vis:(params:(sort:(columnIndex:!n,direction:!n))))))",
              "netflow_part1": "http://10.255.0.10:5601/app/kibana#/dashboard/xflow?_g=(refreshInterval:(%27$$hashKey%27:%27object:556%27,display:%275%E7%A7%92%E5%88%B7%E6%96%B0%27,pause:!f,section:1,value:5000),time:(",
              "netflow_part2": "))&_a=(filters:!(),options:(darkTheme:!f),panels:!((col:5,id:netflow-chart,panelIndex:1,row:1,size_x:5,size_y:5,type:visualization),(col:1,id:netflow-table,panelIndex:2,row:1,size_x:4,size_y:5,type:visualization)),query:(query_string:(analyze_wildcard:!t,query:",
              "netflow_part3": ")),title:xflow,uiState:(P-2:(vis:(params:(sort:(columnIndex:!n,direction:!n))))))",
              "http_part1": "http://10.255.0.10:5601/app/kibana#/dashboard/HTTP?_g=(refreshInterval:('$$hashKey':'object:1291',display:'5%E7%A7%92%E5%88%B7%E6%96%B0',pause:!f,section:1,value:5000),time:(",
              "http_part2": "))&_a=(filters:!(),options:(darkTheme:!f),panels:!((col:9,id:HTTP-top-%E5%9F%9F%E5%90%8D,panelIndex:1,row:5,size_x:4,size_y:4,type:visualization),(col:1,id:HTTP-%E6%BA%90-ip,panelIndex:2,row:3,size_x:3,size_y:6,type:visualization),(col:4,id:HTTP-%E8%AF%B7%E6%B1%82%E5%88%86%E7%B1%BB,panelIndex:3,row:1,size_x:4,size_y:4,type:visualization),(col:1,id:HTTP-%E8%AF%B7%E6%B1%82%E6%95%B0,panelIndex:4,row:1,size_x:3,size_y:2,type:visualization),(col:8,id:HTTP-%E5%9B%9E%E5%A4%8D,panelIndex:5,row:1,size_x:5,size_y:4,type:visualization),(col:4,id:HTTP-%E6%B5%81%E9%87%8F,panelIndex:6,row:5,size_x:5,size_y:4,type:visualization)),query:(query_string:(analyze_wildcard:!t,query:",
              "http_part3": ")),title:HTTP,uiState:(P-2:(vis:(params:(sort:(columnIndex:!n,direction:!n))))))"
          };
          var start_time = 0;
          var end_time = -1;
          var query_type = 0;
          var QueryTable = React.createClass({
              getInitialState: function() {
                  return {
                      ip_throughput: [],
                      my_graph: []
                  };
              },
              componentDidMount(){
                  var graph ;
                  this.setState({
                      my_graph: graph
                  });
                  this.setState({
                      ip_throughput: []
                  });
                  $('.form_datetime').datetimepicker({
                      //language:  'fr',
                      weekStart: 1,
                      todayBtn:  1,
                      autoclose: 1,
                      todayHighlight: 1,
                      startView: 2,
                      forceParse: 0,
                      showMeridian: 1,
                      minuteStep: 30
                  });
                  $('#time1')
                      .datetimepicker({
                          format: 'yyyy-mm-dd hh:ii'
                      }).on('changeDate', function(ev){
                          //start_time = to_utc($('#dtp_input1').val())
                          start_time = to_kibana($('#dtp_input1').val());
                          if (start_time == "Tundefined"){
                              start_time ='0';
                              end_time = '0';
                          }
                      });
                  $('#time2')
                      .datetimepicker({format: 'yyyy-mm-dd hh:ii'})
                      .on('changeDate', function(ev){
                          end_time = to_kibana($('#dtp_input2').val());
                          if (end_time == "Tundefined"){
                              start_time ='0';
                              end_time = '0';
                          }
                      });
                  function to_utc(my_time){
                      var part = my_time.split(" ");
                      var result = part[0].split("-").concat(part[1].split(":"));
                      return Date.UTC(result[0],result[1],result[2],result[3],result[4],result[5])
                  }
                  function to_kibana(my_time){
                      var part = my_time.split(" ");
                      return part[0]+'T'+part[1];
                  }
                  $("#start_query").click(function(){
                      var src_ip = "*";var dst_ip = "*";var ip_part="";var time_part="";
                      src_ip = document.getElementById('ip_address1').value;
                      dst_ip = document.getElementById('ip_address2').value;
                      if (start_time != '0' && end_time !='0'){
                          if (start_time>end_time) {
                              alert("Error! start time must be ealier than end time");
                              return;
                          }else{
                              time_part = "from:%27" + start_time + ".000Z%27,mode:absolute,to:%27" + end_time + ".000Z%27";
                          }
                      }else{
                          time_part = "from:now-15m,mode:quick,to:now";
                      }
                      var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/;//正则表达式
                      if (src_ip != ""){
                          if(re.test(src_ip)) {
                              if( RegExp.$1<256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256){
                              }
                              else{alert("源 IP有误！");return}
                          }else{alert("源 IP有误！");return}
                      }
                      if (dst_ip != "") {
                          if (re.test(dst_ip)) {
                              if (RegExp.$1 < 256 && RegExp.$2 < 256 && RegExp.$3 < 256 && RegExp.$4 < 256) {
                              }
                              else {alert("目的 IP有误！");return}
                          } else {alert("目的 IP有误！");return}
                      }
                      if (src_ip!="" || dst_ip!=""){
                        if(src_ip=="" && dst_ip!=""){
                            ip_part = "%27dstIP:" + dst_ip + "%27";
                        }else if(src_ip!="" && dst_ip==""){
                            ip_part = "%27srcIP:" + src_ip + "%27";
                        }else{
                            ip_part = "%27srcIP:" + src_ip + "%20AND%20" + "dstIP:" + dst_ip +"%27";
                        }
                      }else{ip_part = "%27*%27"}
                      //var final_url = "http://10.255.0.10:5601/app/kibana#/dashboard/DNS?_g=(refreshInterval:(%27$$hashKey%27:%27object:908%27,display:%275%E7%A7%92%E5%88%B7%E6%96%B0%27,pause:!t,section:1,value:5000),time:(from:%27"2017-03-16T00:00:00.000Z%27,mode:absolute,to:%272017-03-16T00:30:00".000Z%27))&_a=(filters:!(),options:(darkTheme:!f),panels:!((col:1,id:DNS-top-ip,panelIndex:1,row:1,size_x:3,size_y:5,type:visualization),(col:1,id:DNS-top-%E5%9F%9F%E5%90%8D,panelIndex:2,row:6,size_x:3,size_y:5,type:visualization),(col:9,id:DNS-top-%E5%9F%9F%E5%90%8D-pie,panelIndex:3,row:6,size_x:4,size_y:5,type:visualization),(col:4,id:DNS-top-%E6%9C%8D%E5%8A%A1%E5%99%A8,panelIndex:4,row:6,size_x:5,size_y:5,type:visualization),(col:4,id:DNS-%E8%AF%B7%E6%B1%82-slash-%E5%9B%9E%E5%A4%8D,panelIndex:5,row:1,size_x:4,size_y:5,type:visualization),(col:8,id:DNS-%E8%AF%B7%E6%B1%82%E7%B1%BB%E5%9E%8B,panelIndex:6,row:1,size_x:5,size_y:5,type:visualization)),query:(query_string:(analyze_wildcard:!t,query:%27*%27)),title:DNS,uiState:(P-1:(vis:(params:(sort:(columnIndex:!n,direction:!n)))),P-2:(vis:(params:(sort:(columnIndex:!n,direction:!n))))))"
                        var query_type = $("#usertype").val()
                      if (query_type == 0){
                          var final_url = dic["http_part1"] + time_part + dic["http_part2"] + ip_part + dic["http_part3"];
                      }else if (query_type == 1){
                          var final_url = dic["dns_part1"] + time_part + dic["dns_part2"] + ip_part + dic["dns_part3"];
                      }else if (query_type == 2){
                          var final_url = dic["nat_part1"] + time_part + dic["nat_part2"] + ip_part + dic["nat_part3"];
                      }else{
                          var final_url = dic["netflow_part1"] + time_part + dic["netflow_part2"] + ip_part + dic["netflow_part3"];
                      }
                      window.open(final_url);
                      //alert(final_url);
                    });
                },
                handleTextChange1: function(arg) {
                    document.getElementById("change_label").style="white-space:pre;";
                    if (arg!=5){
                        document.getElementById('ip_address').disabled='disabled'
                    }else{
                        document.getElementById('ip_address').disabled=''
                    }
                    if (arg==1){document.getElementById("change_label").innerHTML = "Http Response  "}
                    else if (arg==2){document.getElementById("change_label").innerHTML = "Http Request   "}
                    else if (arg==3){document.getElementById("change_label").innerHTML = "DNS Source     "}
                    else if (arg==4){document.getElementById("change_label").innerHTML = "DNS Destination"}
                    else if (arg==5){document.getElementById("change_label").innerHTML = "IP Correlation "}
                    query_type = arg;
                },
                query_info: function() {
                    var ip = "empty";
                    if (query_type == 5){
                        ip = document.getElementById('ip_address').value;
                        var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/;//正则表达式
                        if(re.test(ip)) {
                           if( RegExp.$1<256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256){}
                           else{alert("IP有误！");return}
                        }else{alert("IP有误！");return}
                    }else{ip = "empty";}
                    if (start_time>end_time){
                        alert("Error! start time must be ealier than end time");
                    }else{
                        $.get("http://127.0.0.1:8000/polls/pages/query/"+start_time+"/"+end_time+"/"+query_type+"/"+ip, function(result) {
                            this.state.my_graph.setData(ip_throughput12);
                        }.bind(this));
                    }
                },
                render(){
                    return(
                        <div className="panel panel-default">
                            <div className="panel-heading">
                                <i className="fa fa-bar-chart-o fa-fw"></i> 条件查询
                            </div>
                            <form action="" className="form-horizontal">
                                <fieldset>
                                    <div className="col-xs-24 col-sm-12 col-md-8">
                                        <div className="col-xs-24 col-sm-12 col-md-6">
                                            <label for="dtp_input1" className="col-md-12">起始时间</label>
                                            <div className="input-group date form_datetime col-md-8" id="time1" data-date="2017-01-01T00:00:00Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                                                <input className="form-control" size="16" type="text" value="" readonly/>
                                                <span className="input-group-addon"><span className="glyphicon glyphicon-remove"></span></span>
                                                <span className="input-group-addon"><span className="glyphicon glyphicon-th"></span></span>
                                            </div>
                                            <input type="hidden" id="dtp_input1" value="" /><br/>
                                        </div>
                                        <div className="col-xs-24 col-sm-12 col-md-6">
                                                    <label for="dtp_input2" className="col-md-12">截止时间</label>
                                                    <div className="input-group date form_datetime col-md-8" id="time2" data-date="2017-01-01T00:00:00Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input2">
                                                        <input className="form-control" size="16" type="text" value="" readonly/>
                                                        <span className="input-group-addon"><span className="glyphicon glyphicon-remove"></span></span>
                                                        <span className="input-group-addon"><span className="glyphicon glyphicon-th"></span></span>
                                                    </div>
                                            <input type="hidden" id="dtp_input2" value="" /><br/>
                                        </div>
                                        <div className="col-xs-24 col-sm-12 col-md-6">
                                            <label className="col-lg-12">源ip地址</label>
                                            <div className="col-xs-24 col-sm-12 col-lg-12 spec_input">
                                                <input type="text" className="form-control" id="ip_address1" placeholder="输入查询源ip地址, ip查询模式下有效"/>
                                            </div>
                                         </div>
                                        <div className="col-xs-24 col-sm-12 col-md-6">
                                            <label className="col-lg-12">目的ip地址</label>
                                            <div className="col-xs-24 col-sm-12 col-md-12 spec_input">
                                                <input type="text" className="form-control" id="ip_address2" placeholder="输入查询源目的 ip地址, ip查询模式下有效"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="col-xs-24 col-sm-12 col-md-4">
                                        <label className="col-lg-12">选择查询种类</label>
                                        <select id="usertype" name="usertype" class="selectpicker show-tick form-control" data-live-search="true">
                                            <option value="0">Http 查询</option>
                                            <option value="1">Dns 查询</option>
                                            <option value="2">NAT 查询</option>
                                            <option value="3">NetFlow 查询</option>
                                        </select>
                                    </div>
                                </fieldset>
                                <br/>
                                <p><button  id="start_query" className="btn btn-primary" data-toggle="button">提交查询</button></p>
                            </form>
                        </div>
                    )
                }
            });
            ReactDOM.render(<QueryTable />, document.getElementById('container_table2'));
          $(function () {
            $('#container').highcharts({
                chart: {
                  type: 'gauge',
                  plotBackgroundColor: null,
                  plotBackgroundImage: null,
                  plotBorderWidth: 0,
                  plotShadow: false
                },
                title: {
                  text: 'ËÙ¶ÈÒÇ'
                },
                pane: {
                  startAngle: -150,
                  endAngle: 150,
                  background: [{
                    backgroundColor: {
                      linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                      stops: [
                        [0, '#FFF'],
                        [1, '#333']
                      ]
                    },
                    borderWidth: 0,
                    outerRadius: '109%'
                  }, {
                    backgroundColor: {
                      linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                      stops: [
                        [0, '#333'],
                        [1, '#FFF']
                      ]
                    },
                    borderWidth: 1,
                    outerRadius: '107%'
                  }, {
                    // default background
                  }, {
                    backgroundColor: '#DDD',
                    borderWidth: 0,
                    outerRadius: '105%',
                    innerRadius: '103%'
                  }]
                },
                // the value axis
                yAxis: {
                  min: 0,
                  max: 200,
                  minorTickInterval: 'auto',
                  minorTickWidth: 1,
                  minorTickLength: 10,
                  minorTickPosition: 'inside',
                  minorTickColor: '#666',
                  tickPixelInterval: 30,
                  tickWidth: 2,
                  tickPosition: 'inside',
                  tickLength: 10,
                  tickColor: '#666',
                  labels: {
                    step: 2,
                    rotation: 'auto'
                  },
                  title: {
                    text: 'km/h'
                  },
                  plotBands: [{
                    from: 0,
                    to: 120,
                    color: '#55BF3B' // green
                  }, {
                    from: 120,
                    to: 160,
                    color: '#DDDF0D' // yellow
                  }, {
                    from: 160,
                    to: 200,
                    color: '#DF5353' // red
                  }]
                },
                series: [{
                  data: [{
                    id: 'hour',
                    y: [10],
                    dial: {
                      radius: '60%',
                      baseWidth: 4,
                      baseLength: '95%',
                      rearLength: 0,
                      backgroundColor: '#FFD700'
                    }
                  }, {
                    id: 'minute',
                    y: [20],
                  }],
                  animation: false,
                  dataLabels: {
                    enabled: false
                  }
                }]
              },
              // Add some l
              function (chart) {
                if (!chart.renderer.forExport) {
                  setInterval(function () {
                    var point = chart.get('hour'),
                      point2 = chart.get('minute'),
                      newVal,
                      inc = Math.round((Math.random() - 0.5) * 20);
                    point.update(inc*10);
                    point2.update(inc*30);
                  }, 3000);
                }
              });
          });
          </script>
        <script>
            $(window).on('load', function () {
            $('#usertype').selectpicker({
                'selectedText': 'cat'
            })});
        </script>
    </div>
</body>
</html>