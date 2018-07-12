<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Root-message.aspx.cs" Inherits="pages_Root_Root_message" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!--Tell the brower to be responsive to screen width -->
    <meta content="Width=device-width, initial-scale=1, maxmum-scale=1, user-scalable=no" name="viewport" />
    <!--Boostrap -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/bootstrap/css/bootstrap.min.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/plugins/font-awesome/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/plugins/ionicons/css/ionicons.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/dist/css/AdminLTE.min.css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/dist/css/skins/_all-skins.min.css" />

    <!-- Main Css -->
    <link rel="stylesheet" href="../../css/Root/rootMain.css" />
    <title>消息通知</title>
    <link rel="shortcut icon" href="../../img/logo.ico" />
    <!-- Main CSS -->
    <link href="../../css/Root/Root-userInformation.css" rel="stylesheet" type="text/css" />
    <link href="../../css/Root/equipment.css" rel="stylesheet" type="text/css" />
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="RootMain.aspx" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>R</b>QS</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>放疗质控系统</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              <li class="dropdown messages-menu">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-envelope-o"></i>
                      <span id="NoticeNum" class="label label-success">0</span>
                  </a>
                  <ul class="dropdown-menu">
                      <li class="header">通知公告</li>
                      <li>
                          <ul id="Notice" class="menu">
                              <li>
                                  <a href="#">
                                      <h4>无
                                      </h4>
                                      <p class="pull-right"><i class="fa fa-user"></i>&nbsp;<i class="fa fa-clock-o"></i></p>
                                  </a>
                              </li>
                          </ul>
                      </li>
                      <li class="footer"><a id="allNotice" href="javascript:;" target="_blank">查看全部</a></li>
                  </ul>
              </li>
              <li class="dropdown notifications-menu">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-bell-o"></i>
                      <span id="WarningNum" class="label label-warning">0</span>
                  </a>
                  <ul class="dropdown-menu">
                      <li id="WarningTask" class="header">你有0条工作任务预警</li>
                      <li>
                          <ul id="TaskWarning-content" class="menu">
                              <li>
                                  <a href="javascript:;">无
                                  </a>
                              </li>
                          </ul>
                      </li>
                      <li class="footer"><a href="javascript:;">请及时处理</a></li>
                  </ul>
              </li>
              <li class="dropdown tasks-menu">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-flag-o"></i>
                      <span class="label label-danger">0</span>
                  </a>
                  <ul class="dropdown-menu">
                      <li class="header">设备动态</li>
                      <li>
                          <ul class="menu">
                              <li>
                                  <a href="javascript:;">
                                      <h3>Design some buttons
                                                <small class="pull-right">20%</small>
                                      </h3>
                                      <div class="progress xs">
                                          <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                              <span class="sr-only">20% Complete</span>
                                          </div>
                                      </div>
                                  </a>
                              </li>
                          </ul>
                      </li>
                      <li class="footer">
                          <a href="javascript:;">查看详情</a>
                      </li>
                  </ul>
              </li>
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <img src="../../plugin/AdminLTE/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                      <span class="hidden-xs"><%=((UserInformation)Session["loginUser"]) == null ?  "" : ((UserInformation)Session["loginUser"]).GetUserName() %></span>
                  </a>
                  <ul class="dropdown-menu">
                      <!-- User image -->
                      <li class="user-header">
                          <img src="../../plugin/AdminLTE/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                          <p>
                              <span class="hidden-xs"><%=((UserInformation)Session["loginUser"]) == null ?  "" : ((UserInformation)Session["loginUser"]).GetUserName() %></span>
                              <small id="role">管理员</small>
                          </p>
                      </li>
                      <!-- Menu Body -->
                      <!-- Menu Footer-->
                      <li class="user-footer">
                          <div class="pull-left">
                              <a href="../Login/changeRole.aspx" class="btn btn-default btn-flat">切换角色</a>
                          </div>
                          <div class="pull-right">
                              <a id="signOut" href="#" class="btn btn-default btn-flat">注销</a>
                          </div>
                      </li>
                  </ul>
              </li>
          </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="../../plugin/AdminLTE/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
           <p id="user-name"><%=((UserInformation)Session["loginUser"]).GetUserName() %></p>
          <a href="#" id="user-role">管理员</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search..." />
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul id="menu" class="sidebar-menu">
        <li class="header">管理员导航</li>
        <li class="">
          <a href="RootMain.aspx">
            <i class="fa fa-coffee"></i> <span>主页</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li class="treeview active">
          <a href="#">
            <i class="fa fa-envelope-o"></i> <span>消息模块</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="Root-InfoManage.aspx"><i class="fa fa-circle-o"></i> 消息管理</a></li>
            <li><a href="Root-information.aspx"><i class="fa fa-circle-o"></i> 消息发布</a></li>
            <li class="active"><a href="Root-message.aspx"><i class="fa fa-circle-o"></i> 消息通知</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i> <span>用户管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="Root-userInformation.aspx"><i class="fa fa-circle-o"></i> 用户信息</a></li>
            <li><a href="Root-user2role.aspx"><i class="fa fa-circle-o"></i>用户绑定</a></li>
          </ul>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-user-plus"></i>
            <span>角色管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
              <li><a href="Root-role.aspx"><i class="fa fa-circle-o"></i> 角色信息</a></li>
              <li><a href="Root-function2role.aspx"><i class="fa fa-circle-o"></i>功能绑定</a></li>
          </ul>
        </li>
        <li>
          <a href="#">
            <i class="fa fa-briefcase"></i>
            <span>设备管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="Root-equipment.aspx"><i class="fa fa-circle-o"></i> 设备管理</a></li>
            <li><a href="EquipmentTypeManage.aspx"><i class="fa fa-circle-o"></i>设备类型管理</a></li>
            <li><a href="Root-EquipmentInspectionManage.aspx"><i class="fa fa-circle-o"></i> 设备检查管理</a></li>
            <li><a href="Root_EquipmentInspection.aspx"><i class="fa fa-circle-o"></i> 设备检查</a></li>
            <li><a href="Root-EquipmentInspectionResult.aspx"><i class="fa fa-circle-o"></i> 设备检查结果</a></li>
          </ul>
        </li>
        <%--<li class="treeview">
          <a href="#">
            <i class="fa fa-sitemap fa-fw"></i>
            <span>设备维修</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="EquipmentErrorrInformation.aspx"><i class="fa fa-circle-o"></i> 维修描述管理</a></li>
            <li><a href="EquipmentTypeManage.aspx"><i class="fa fa-circle-o"></i>设备维修</a></li>
            <li><a href="Root-EquipmentInspectionManage.aspx"><i class="fa fa-circle-o"></i> 设备维修记录</a></li>
          </ul>
        </li>--%>
          <li class="treeview">
              <a href="#">
                  <i class="fa fa-plus-square"></i><span>诊断结果管理</span>
                  <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                  </span>
              </a>
              <ul class="treeview-menu">
                  <li><a href="morphol.aspx"><i class="fa fa-circle-o"></i>病理诊断结果管理</a></li>
                  <li><a href="icdcode.aspx"><i class="fa fa-circle-o"></i>病情诊断结果管理</a></li>
              </ul>
          </li>
        <li>
          <a href="Root-function.aspx">
            <i class="fa fa-cart-plus"></i> <span>功能管理</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li>
          <a href="Root-Group.aspx">
            <i class="fa fa-group"></i> <span>分组管理</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li>
            <a href="Root-parameterSetting.aspx">
                <i class="fa fa-bars"></i> <span>基本信息管理</span>
                <span class="pull-right-container">
                </span>
            </a>
        </li>
          <li>
              <a href="Root-setWarning.aspx">
                  <i class="fa fa-warning"></i><span>流程预警设置</span>
                  <span class="pull-right-container"></span>
              </a>
          </li>
          <li>
              <a href="Root-FirstAccTime.aspx">
                  <i class="fa fa-clone"></i><span>首次治疗预约时间段</span>
                  <span class="pull-right-container"></span>
              </a>
          </li>
          <li>
              <a href="Root-WorkTimeTable.aspx">
                  <i class="fa fa-calendar-times-o"></i><span>预约日期配置</span>
                  <span class="pull-right-container"></span>
              </a>
          </li>
          <li>
              <a href="Root-PublicTemplate.aspx">
                  <i class="fa fa-clone"></i><span>公共模版设置</span>
                  <span class="pull-right-container"></span>
              </a>
          </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-bar-chart"></i>
            <span>数据统计</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
              <li><a href="EquipmentStatistics.aspx"><i class="fa fa-circle-o"></i> 设备检查统计</a></li>
          </ul>
        </li>
      </ul>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="min-height: 916px;" >


    <!-- Main content -->
    <section class="content">
        <input id="type" type="hidden" value="Root" />
        <div class="row">
            <div class="col-xs-12">
                <h1 class="page-header">消息通知</h1>
            </div>
        </div>
        <div class="row">
            <form id="frm" runat="server">
                <%--<asp:ObjectDataSource ID="equipmentObjectDataSource" runat="server" SelectMethod="Select" TypeName="equipment" OnDeleting="equipmentObjectDataSource_Deleting" DeleteMethod="Delete">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="String" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:FormParameter DefaultValue="allEquipment" FormField="EquipmentName" Name="state" Type="String" />
                        <asp:FormParameter DefaultValue="allItem" FormField="EquipmentName" Name="item" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>--%>
                <%--<div class="col-xs-12 search">
                    <div class="col-xs-4">
                        <select id="EquipmentName" class="form-control" name="EquipmentName" style="width:60%;">                
                        </select>
                    </div>
                    <div class="col-xs-4">
                        <button class="btn btn-primary" type="button" id="searchButton">查询</button>
                    </div>
                </div>--%>
                <div class="col-xs-12" id="gridContent">
                <div id="patient-content" class="box" style="border-top:0px;margin-bottom:0px;">
                    
                <div class="box-body" style="padding:0px;">
                    <div id="patient-table-content" class="scroll-content">
                        <table id="patient-table" class="table table-bordered" style="white-space:nowrap;margin-bottom:0px;"></table>
                    </div>
                    <div class="col-xs-4">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="15">体位固定装置</asp:ListItem>
                        <asp:ListItem Value="17">CT模拟定位机</asp:ListItem>
                        <asp:ListItem Value="18">Precise加速器</asp:ListItem>
                        <asp:ListItem Value="24">Axesse加速器</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                    <div class="col-xs-4">
                    <%--<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="查询" CssClass="btn btn-primary" /><br />--%>
                    </div>
                    <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="true" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged" Text="全选" />
                    <asp:Button ID="Button1" runat="server" Font-Size="9pt" Text="取消" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" runat="server" Font-Size="9pt" Text="发送" OnClick="Button2_Click" />
                    <asp:GridView ID="peoplemessageGridView" runat="server" AllowPaging="True" PageSize="132" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover">
                        <PagerSettings Mode="NextPreviousFirstLast" FirstPageText="首页" LastPageText="末页" NextPageText="下一页" PreviousPageText="上一页" />
                        
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="患者姓名" SortExpression="Name" />
                            <asp:BoundField DataField="Contact1" HeaderText="电话号码1" SortExpression="Contact1" />
                            <asp:BoundField DataField="Contact2" HeaderText="电话号码2" SortExpression="Contact2" />
                        </Columns>
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                    
                    <%--<asp:GridView ID="equipmentGridView" runat="server" AllowPaging="True" PageSize="8" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" DataSourceID="equipmentObjectDataSource">
                        <PagerSettings Mode="NextPreviousFirstLast" FirstPageText="首页" LastPageText="末页" NextPageText="下一页" PreviousPageText="上一页" />
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="设备名" />
                            <asp:TemplateField HeaderText="设备类型">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Type") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="TreatmentItem" HeaderText="隶属治疗项目" />
                        </Columns>
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>--%>
                </div>
                </div>
                </div>
            </form>
        </div>
    </section>
  </div>

  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.0
    </div>
    <strong>Copyright &copy; 2017-2017 <a href="http://www.jsph.org.cn/">江苏省人民医院</a> .</strong> 保留所有权利
  </footer>
  <!-- Control Sidebar -->
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="../../plugin/AdminLTE/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="../../plugin/AdminLTE/plugins/jQueryUI/jquery-ui.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../plugin/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="../../plugin/AdminLTE/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../plugin/AdminLTE/dist/js/demo.js"></script>
<!-- SlimScroll -->
<script src="../../plugin/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- Main js-->
<%--<script src="../../js/Root/RootMainJS.js"></script>--%>
<!-- Main JavaScript -->
<script src="../../js/Root/message.js"></script>
</body>    
</html>
