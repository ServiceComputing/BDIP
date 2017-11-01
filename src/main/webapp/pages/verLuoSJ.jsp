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
<html>
    <head>
        <base href="<%=basePath%>">
        <meta charset="utf-8">
        <title>Drools</title>

        <script src="static/react/react.js"></script>
        <script src="static/react/react-dom.js"></script>
        <script src="static/react/browser.min.js"></script>

        <script src="static/jquery/jquery.min.js"></script>

        <script src="static/bootstrap/js/bootstrap.min.js"></script>
        <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <style type="text/css">
            #textShow {
                overflow:scroll; /*任何时候都强制显示滚动条*/
                overflow:auto; /*需要的时候会出现滚动条*/
                overflow-x:auto; /*控制X方向的滚动条*/
                overflow-y:auto; /*控制Y方向的滚动条*/
            }
            td{
                position:relative;
            }
            td div{
                position:absolute; top: 10px; left: 10px;
                background: #ffffff;
                visibility: hidden;
                z-index:999;
                word-wrap: break-word; !important;
                word-break: normal; !important;
            }

        </style>
    </head>

    <body>
    <div class="row"></div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div className="table-responsive" id="container_table2"></div>
            <div>
                <form method="post" action="lsjQuery.do" enctype="multipart/form-data" target="id_iframe">
                    <input type="file" name="uploadFile" id="files" style="display:none" onchange="ReadText()"/>
                    <input type="button" id="import" value="导入规则文件"/>
                    <input type="submit" id="update" value="上传规则文件"/>
                </form>
            </div>

            <div>
                <textarea rows="20" cols="120" id = "textShow">

                </textarea>
            </div>
        </div>
        <div class="col-md-1"></div>
        <iframe id="id_iframe" name="id_iframe" style="display:none;"></iframe>
    </div>
    </body>
    <script>
        $("#import").click(function(){//点击导入按钮，使files触发点击事件，然后完成读取文件的操作。
                $("#files").click();
        });

        function ReadText(){
            var selectedFile = document.getElementById("files").files[0];//获取读取的File对象
            var name = selectedFile.name;//读取选中文件的文件名
            var size = selectedFile.size;//读取选中文件的大小
            console.log("文件名:"+name+"大小："+size);

            var reader = new FileReader();//这里是核心！！！读取操作就是由它完成的。
            reader.readAsText(selectedFile);//读取文件的内容

            reader.onload = function(){
                var text = this.result;
                var aaa = text.split("\n");
                console.log(this.result);//当读取完成之后会回调这个函数，然后此时文件的内容存储到了result中。直接操作即可。
                $("#textShow").html(text);
            };
        };
    </script>

  <script type="text/babel">

      var string_parse = function (strInput) {
          var tmp_list = strInput.split("lm");
          var ret = [];var tmp;
          for (var x = 0; x < tmp_list.length; x++) {
              tmp = tmp_list[x].split("sp");
              var specificInfo = "上行数据包数目：" + tmp[5] + "\r\n下行数据包数目：" + tmp[6] + "\r\n上行流量：" + tmp[7]+ "\r\n下行流量：" + tmp[8]+  "\r\n上行小数据包数：" + tmp[9]+ "\r\n上下行数据包比：" + tmp[10]+ "\r\n上下行流量比：" + tmp[11]+ "\r\nSYN包占比：" + tmp[12]+
                  "\r\nPSH包占比：" + tmp[13] + "\r\n平均会话时间："  + tmp[14] + "\r\nDNS请求次数："  + tmp[15] + "\r\n小数据包占比：" + tmp[16];
              ret.push({
                  ip: tmp[0],
                  time: tmp[1],
                  model: tmp[2],
                  high: tmp[3],
                  normal: tmp[4],
                  upcount: specificInfo
              });
          }
          return ret;
      }

      class SingleRow extends React.Component{
          render(){
              return(
                      <tr>
                          {this.props.words}
                      </tr>
              )
          }
      }
      class MutliRow extends React.Component{
        render(){
            var rows = [];
            var strArray = this.props.multiinfo.split(" ");
            var i = 0;
            for (i=0;i<strArray.length;i++){
                rows.push(<SingleRow words = {strArray[i]}/>);
            }
            return(
                    <td>
                        {rows}
                    </td>
            )
        }
      }



      var ProductRow = React.createClass({
          getInitialState:function () {
              return {
                  x:0,
                  y:0
              }
          },
          handleMouseMove:function (event) {
              document.getElementById(this.props.rowId).style.visibility= "visible";
          },
          handleMouseOut:function (event) {
              document.getElementById(this.props.rowId).style.visibility= "hidden";
          },
          render:function () {
              var tmp1 = this.props.product.upcount;
              tmp1 = tmp1.split("\r\n");
              return (
                  <tr onMouseOver={this.handleMouseMove} onMouseOut={this.handleMouseOut}>
                      <td>
                          {this.props.product.ip}
                          <div id = {this.props.rowId}>{tmp1[0]}<br />{tmp1[1]}<br />{tmp1[2]}<br />{tmp1[3]}<br />{tmp1[4]}<br />{tmp1[5]}<br />{tmp1[6]}<br />{tmp1[7]}<br />{tmp1[8]}<br />{tmp1[9]}<br />{tmp1[10]}<br />{tmp1[11]}</div>
                      </td>
                      <td>{this.props.product.time}</td>
                      <MutliRow multiinfo={this.props.product.model}/>
                      <MutliRow multiinfo={this.props.product.high}/>
                      <MutliRow multiinfo={this.props.product.normal}/>
                  </tr>
              );
          }
      });
      class ProductTable extends React.Component {
          render() {
              var rows = [];
              var index = 0;
              this.props.products.forEach(function(product) {
                  rows.push(<ProductRow product={product} rowId = {index}/>);
                  index = index + 1;
              });
              return (
                  <table className={"table table-bordered table-hover table-striped"}>
                      <thead>
                      <tr>
                          <th>检测到的异常Ip</th>
                          <th>检测时间</th>
                          <th>检测异常模型</th>
                          <th>高危异常指标</th>
                          <th>普通异常指标</th>
                      </tr>
                      </thead>
                      <tbody>{rows}</tbody>
                  </table>
              );
          }
      }

      function query_LSJ_data() {
          $.ajax({
              url: "lsjQuery.do", success: function (result) {
                  var textFromServer = string_parse(result);
                  ReactDOM.render(<ProductTable
                          products={textFromServer}/>, document.getElementById('container_table2'));
              }
          })
      }

      //setInterval(query_LSJ_data,5000)
      query_LSJ_data();
  </script>
</html>