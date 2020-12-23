<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <title>Mono - Responsive Admin & Dashboard Template</title>

  <!-- GOOGLE FONTS -->
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700|Roboto" rel="stylesheet">
  <link href="assets/plugins/material/css/materialdesignicons.min.css" rel="stylesheet" />
  <link href="assets/plugins/simplebar/simplebar.css" rel="stylesheet" />

  <!-- PLUGINS CSS STYLE -->
  <link href="assets/plugins/nprogress/nprogress.css" rel="stylesheet" />
  
  
  <link href="assets/plugins/prism/prism.css" rel="stylesheet" />
  
  
  <!-- MONO CSS -->
  <link id="main-css-href" rel="stylesheet" href="assets/css/mono.css" />

  


  <!-- FAVICON -->
  <link href="assets/img/favicon.png" rel="shortcut icon" />

  <!--
    HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries
  -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <script src="assets/plugins/nprogress/nprogress.js"></script>
</head>


  <body class="navbar-fixed sidebar-fixed" id="body">
    <script>
      NProgress.configure({ showSpinner: false });
      NProgress.start();
    </script>

    

    <!-- ====================================
    �X�X�X WRAPPER
    ===================================== -->
    <div class="wrapper">
      
      
        <!-- ====================================
          �X�X�X LEFT SIDEBAR WITH OUT FOOTER
        ===================================== -->
        <aside class="left-sidebar sidebar-dark" id="left-sidebar">
          <div id="sidebar" class="sidebar sidebar-with-footer">
            <!-- Aplication Brand -->
            <div class="app-brand">
              <a href="/index.html">
                <img src="assets/img/logo.png" alt="Mono">
                <span class="brand-name">MONO</span>
              </a>
            </div>
            <!-- begin sidebar scrollbar -->
            <div class="sidebar-left" data-simplebar style="height: 100%;">
              <!-- sidebar menu -->
              <ul class="nav sidebar-inner" id="sidebar-menu">
                

                
                  <li
                   >
                    <a class="sidenav-item-link" href="index.html">
                      <i class="mdi mdi-briefcase-account-outline"></i>
                      <span class="nav-text">Business Dashboard</span>
                    </a>
                  </li>
                

                

                
                  <li
                   >
                    <a class="sidenav-item-link" href="analytics.html">
                      <i class="mdi mdi-chart-line"></i>
                      <span class="nav-text">Analytics Dashboard</span>
                    </a>
                  </li>
                

                

                
                  <li class="section-title">
                    Apps
                  </li>
                

                

                
                  <li
                   >
                    <a class="sidenav-item-link" href="chat.html">
                      <i class="mdi mdi-wechat"></i>
                      <span class="nav-text">Chat</span>
                    </a>
                  </li>
                

                

                
                  <li
                   >
                    <a class="sidenav-item-link" href="contacts.html">
                      <i class="mdi mdi-phone"></i>
                      <span class="nav-text">Contacts</span>
                    </a>
                  </li>
                

                

                
                  <li
                   >
                    <a class="sidenav-item-link" href="team.html">
                      <i class="mdi mdi-account-group"></i>
                      <span class="nav-text">Team</span>
                    </a>
                  </li>
                

                

                
                  <li
                   >
                    <a class="sidenav-item-link" href="calendar.html">
                      <i class="mdi mdi-calendar-check"></i>
                      <span class="nav-text">Calendar</span>
                    </a>
                  </li>
                

                

                
                  <li  class="has-sub" >
                    <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#email"
                      aria-expanded="false" aria-controls="email">
                      <i class="mdi mdi-email"></i>
                      <span class="nav-text">email</span> <b class="caret"></b>
                    </a>
                    <ul  class="collapse"  id="email"
                      data-parent="#sidebar-menu">
                      <div class="sub-menu">
                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="email-inbox.html">
                                <span class="nav-text">Email Inbox</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="email-details.html">
                                <span class="nav-text">Email Details</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="email-compose.html">
                                <span class="nav-text">Email Compose</span>
                                
                              </a>
                            </li>
                          
                        

                        
                      </div>
                    </ul>
                  </li>
                

                

                
                  <li class="section-title">
                    UI Elements
                  </li>
                

                

                
                  <li  class="has-sub active expand" >
                    <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#ui-elements"
                      aria-expanded="false" aria-controls="ui-elements">
                      <i class="mdi mdi-folder-outline"></i>
                      <span class="nav-text">UI Components</span> <b class="caret"></b>
                    </a>
                    <ul  class="collapse show"  id="ui-elements"
                      data-parent="#sidebar-menu">
                      <div class="sub-menu">
                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="alert.html">
                                <span class="nav-text">Alert</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="badge.html">
                                <span class="nav-text">Badge</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="breadcrumb.html">
                                <span class="nav-text">Breadcrumb</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                        <li  class="has-sub" >
                          <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#buttons"
                            aria-expanded="false" aria-controls="buttons">
                            <span class="nav-text">Buttons</span> <b class="caret"></b>
                          </a>
                          <ul  class="collapse"  id="buttons">
                            <div class="sub-menu">
                              
                              <li >
                                <a href="button-default.html">Button Default</a>
                              </li>
                              
                              <li >
                                <a href="button-dropdown.html">Button Dropdown</a>
                              </li>
                              
                              <li >
                                <a href="button-group.html">Button Group</a>
                              </li>
                              
                              <li >
                                <a href="button-social.html">Button Social</a>
                              </li>
                              
                              <li >
                                <a href="button-loading.html">Button Loading</a>
                              </li>
                              
                            </div>
                          </ul>
                        </li>
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="card.html">
                                <span class="nav-text">Card</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="carousel.html">
                                <span class="nav-text">Carousel</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="collapse.html">
                                <span class="nav-text">Collapse</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="editor.html">
                                <span class="nav-text">Editor</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="list-group.html">
                                <span class="nav-text">List Group</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="modal.html">
                                <span class="nav-text">Modal</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="pagination.html">
                                <span class="nav-text">Pagination</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="popover-tooltip.html">
                                <span class="nav-text">Popover & Tooltip</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="progress-bar.html">
                                <span class="nav-text">Progress Bar</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="spinner.html">
                                <span class="nav-text">Spinner</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="switches.html">
                                <span class="nav-text">Switches</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                        <li  class="has-sub" >
                          <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#tables"
                            aria-expanded="false" aria-controls="tables">
                            <span class="nav-text">Tables</span> <b class="caret"></b>
                          </a>
                          <ul  class="collapse"  id="tables">
                            <div class="sub-menu">
                              
                              <li >
                                <a href="bootstarp-tables.html">Bootstrap Tables</a>
                              </li>
                              
                              <li >
                                <a href="data-tables.html">Data Tables</a>
                              </li>
                              
                            </div>
                          </ul>
                        </li>
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="tab.html">
                                <span class="nav-text">Tab</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="toaster.html">
                                <span class="nav-text">Toaster</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                        <li  class="has-sub" >
                          <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#icons"
                            aria-expanded="false" aria-controls="icons">
                            <span class="nav-text">Icons</span> <b class="caret"></b>
                          </a>
                          <ul  class="collapse"  id="icons">
                            <div class="sub-menu">
                              
                              <li >
                                <a href="material-icons.html">Material Icon</a>
                              </li>
                              
                              <li >
                                <a href="flag-icons.html">Flag Icon</a>
                              </li>
                              
                            </div>
                          </ul>
                        </li>
                        

                        
                        
                        <li  class="has-sub active expand" >
                          <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#forms"
                            aria-expanded="false" aria-controls="forms">
                            <span class="nav-text">Forms</span> <b class="caret"></b>
                          </a>
                          <ul  class="collapse show"  id="forms">
                            <div class="sub-menu">
                              
                              <li  class="active" >
                                <a href="basic-input.html">Basic Input</a>
                              </li>
                              
                              <li >
                                <a href="input-group.html">Input Group</a>
                              </li>
                              
                              <li >
                                <a href="checkbox-radio.html">Checkbox & Radio</a>
                              </li>
                              
                              <li >
                                <a href="form-validation.html">Form Validation</a>
                              </li>
                              
                              <li >
                                <a href="form-advance.html">Form Advance</a>
                              </li>
                              
                            </div>
                          </ul>
                        </li>
                        

                        
                        
                        <li  class="has-sub" >
                          <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#maps"
                            aria-expanded="false" aria-controls="maps">
                            <span class="nav-text">Maps</span> <b class="caret"></b>
                          </a>
                          <ul  class="collapse"  id="maps">
                            <div class="sub-menu">
                              
                              <li >
                                <a href="google-maps.html">Google Map</a>
                              </li>
                              
                              <li >
                                <a href="vector-maps.html">Vector Map</a>
                              </li>
                              
                            </div>
                          </ul>
                        </li>
                        

                        
                        
                        <li  class="has-sub" >
                          <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#widgets"
                            aria-expanded="false" aria-controls="widgets">
                            <span class="nav-text">Widgets</span> <b class="caret"></b>
                          </a>
                          <ul  class="collapse"  id="widgets">
                            <div class="sub-menu">
                              
                              <li >
                                <a href="widgets-general.html">General Widget</a>
                              </li>
                              
                              <li >
                                <a href="widgets-chart.html">Chart Widget</a>
                              </li>
                              
                            </div>
                          </ul>
                        </li>
                        

                        
                      </div>
                    </ul>
                  </li>
                

                

                
                  <li  class="has-sub" >
                    <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#charts"
                      aria-expanded="false" aria-controls="charts">
                      <i class="mdi mdi-chart-pie"></i>
                      <span class="nav-text">Charts</span> <b class="caret"></b>
                    </a>
                    <ul  class="collapse"  id="charts"
                      data-parent="#sidebar-menu">
                      <div class="sub-menu">
                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="apex-charts.html">
                                <span class="nav-text">Apex Charts</span>
                                
                              </a>
                            </li>
                          
                        

                        
                      </div>
                    </ul>
                  </li>
                

                

                
                  <li class="section-title">
                    Pages
                  </li>
                

                

                
                  <li  class="has-sub" >
                    <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#users"
                      aria-expanded="false" aria-controls="users">
                      <i class="mdi mdi-image-filter-none"></i>
                      <span class="nav-text">User</span> <b class="caret"></b>
                    </a>
                    <ul  class="collapse"  id="users"
                      data-parent="#sidebar-menu">
                      <div class="sub-menu">
                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="user-profile.html">
                                <span class="nav-text">User Profile</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="user-activities.html">
                                <span class="nav-text">User Activities</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="user-profile-settings.html">
                                <span class="nav-text">User Profile Settings</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="user-account-settings.html">
                                <span class="nav-text">User Account Settings</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="user-planing-settings.html">
                                <span class="nav-text">User Planing Settings</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="user-billing.html">
                                <span class="nav-text">User billing</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="user-notify-settings.html">
                                <span class="nav-text">User Notify Settings</span>
                                
                              </a>
                            </li>
                          
                        

                        
                      </div>
                    </ul>
                  </li>
                

                

                
                  <li  class="has-sub" >
                    <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#authentication"
                      aria-expanded="false" aria-controls="authentication">
                      <i class="mdi mdi-account"></i>
                      <span class="nav-text">Authentication</span> <b class="caret"></b>
                    </a>
                    <ul  class="collapse"  id="authentication"
                      data-parent="#sidebar-menu">
                      <div class="sub-menu">
                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="sign-in.html">
                                <span class="nav-text">Sign In</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="sign-up.html">
                                <span class="nav-text">Sign Up</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="reset-password.html">
                                <span class="nav-text">Reset Password</span>
                                
                              </a>
                            </li>
                          
                        

                        
                      </div>
                    </ul>
                  </li>
                

                

                
                  <li  class="has-sub" >
                    <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#other-page"
                      aria-expanded="false" aria-controls="other-page">
                      <i class="mdi mdi-file-multiple"></i>
                      <span class="nav-text">Other pages</span> <b class="caret"></b>
                    </a>
                    <ul  class="collapse"  id="other-page"
                      data-parent="#sidebar-menu">
                      <div class="sub-menu">
                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="invoice.html">
                                <span class="nav-text">Invoice</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="404.html">
                                <span class="nav-text">404 page</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="page-comingsoon.html">
                                <span class="nav-text">Coming Soon</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="page-maintenance.html">
                                <span class="nav-text">Maintenance</span>
                                
                              </a>
                            </li>
                          
                        

                        
                      </div>
                    </ul>
                  </li>
                

                

                
                  <li class="section-title">
                    Documentation
                  </li>
                

                

                
                  <li
                   >
                    <a class="sidenav-item-link" href="getting-started.html">
                      <i class="mdi mdi-airplane"></i>
                      <span class="nav-text">Getting Started</span>
                    </a>
                  </li>
                

                

                
                  <li  class="has-sub" >
                    <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#customization"
                      aria-expanded="false" aria-controls="customization">
                      <i class="mdi mdi-square-edit-outline"></i>
                      <span class="nav-text">Customization</span> <b class="caret"></b>
                    </a>
                    <ul  class="collapse"  id="customization"
                      data-parent="#sidebar-menu">
                      <div class="sub-menu">
                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="navbar-customization.html">
                                <span class="nav-text">Navbar</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="sidebar-customization.html">
                                <span class="nav-text">Sidebar</span>
                                
                              </a>
                            </li>
                          
                        

                        
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="styling.html">
                                <span class="nav-text">Styling</span>
                                
                              </a>
                            </li>
                          
                        

                        
                      </div>
                    </ul>
                  </li>
                

                
              </ul>

            </div>

            <div class="sidebar-footer">
              <div class="sidebar-footer-content">
                <ul class="d-flex">
                  <li>
                    <a href="user-account-settings.html" data-toggle="tooltip" title="Profile settings"><i class="mdi mdi-settings"></i></a></li>
                  <li>
                    <a href="#" data-toggle="tooltip" title="No chat messages"><i class="mdi mdi-chat-processing"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </aside>

      

      <!-- ====================================
      �X�X�X PAGE WRAPPER
      ===================================== -->
      <div class="page-wrapper">
        
          <!-- Header -->
          <header class="main-header" id="header">
            <nav class="navbar navbar-expand-lg navbar-light" id="navbar">
              <!-- Sidebar toggle button -->
              <button id="sidebar-toggler" class="sidebar-toggle">
                <span class="sr-only">Toggle navigation</span>
              </button>

              <span class="page-title">basic input</span>

              <div class="navbar-right ">

                <!-- search form -->
                <div class="search-form">
                  <form action="index.html" method="get">
                    <div class="input-group input-group-sm" id="input-group-search">
                      <input type="text" autocomplete="off" name="query" id="search-input" class="form-control" placeholder="Search..." />
                      <div class="input-group-append">
                        <button class="btn" type="button">/</button>
                      </div>
                    </div>
                  </form>
                  <ul class="dropdown-menu dropdown-menu-search">

                    <li class="nav-item">
                      <a class="nav-link" href="index.html">Morbi leo risus</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="index.html">Dapibus ac facilisis in</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="index.html">Porta ac consectetur ac</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="index.html">Vestibulum at eros</a>
                    </li>

                  </ul>

                </div>

                <ul class="nav navbar-nav">
                  <!-- Offcanvas -->
                  <li class="custom-dropdown">
                    <a class="offcanvas-toggler active custom-dropdown-toggler" data-offcanvas="contact-off" href="javascript:" >
                      <i class="mdi mdi-contacts icon"></i>
                    </a>
                  </li>
                  <li class="custom-dropdown">
                    <button class="notify-toggler custom-dropdown-toggler">
                      <i class="mdi mdi-bell-outline icon"></i>
                      <span class="badge badge-xs rounded-circle">21</span>
                    </button>
                    <div class="dropdown-notify">

                      <header>
                        <div class="nav nav-underline" id="nav-tab" role="tablist">
                          <a class="nav-item nav-link active" id="all-tabs" data-toggle="tab" href="#all" role="tab" aria-controls="nav-home"
                            aria-selected="true">All (5)</a>
                          <a class="nav-item nav-link" id="message-tab" data-toggle="tab" href="#message" role="tab" aria-controls="nav-profile"
                            aria-selected="false">Msgs (4)</a>
                          <a class="nav-item nav-link" id="other-tab" data-toggle="tab" href="#other" role="tab" aria-controls="nav-contact"
                            aria-selected="false">Others (3)</a>
                        </div>
                      </header>

                      <div class="" data-simplebar style="height: 325px;">
                        <div class="tab-content" id="myTabContent">

                          <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tabs">

                            <div class="media media-sm bg-warning-10 p-4 mb-0">
                              <div class="media-sm-wrapper">
                                <a href="user-profile.html">
                                  <img src="assets/img/user/user-sm-02.jpg" alt="User Image">
                                </a>
                              </div>
                              <div class="media-body">
                                <a href="user-profile.html">
                                  <span class="title mb-0">John Doe</span>
                                  <span class="discribe">Extremity sweetness difficult behaviour he of. On disposal of as landlord horrible. Afraid at highly months do things on at.</span>
                                  <span class="time">
                                    <time>Just now</time>...
                                  </span>
                                </a>
                              </div>
                            </div>

                            <div class="media media-sm p-4 bg-light mb-0">
                              <div class="media-sm-wrapper bg-primary">
                                <a href="user-profile.html">
                                  <i class="mdi mdi-calendar-check-outline"></i>
                                </a>
                              </div>
                              <div class="media-body">
                                <a href="user-profile.html">
                                  <span class="title mb-0">New event added</span>
                                  <span class="discribe">1/3/2014 (1pm - 2pm)</span>
                                  <span class="time">
                                    <time>10 min ago...</time>...
                                  </span>
                                </a>
                              </div>
                            </div>

                            <div class="media media-sm p-4 mb-0">
                              <div class="media-sm-wrapper">
                                <a href="user-profile.html">
                                  <img src="assets/img/user/user-sm-03.jpg" alt="User Image">
                                </a>
                              </div>
                              <div class="media-body">
                                <a href="user-profile.html">
                                  <span class="title mb-0">Sagge Hudson</span>
                                  <span class="discribe">On disposal of as landlord Afraid at highly months do things on at.</span>
                                  <span class="time">
                                    <time>1 hrs ago</time>...
                                  </span>
                                </a>
                              </div>
                            </div>

                            <div class="media media-sm p-4 mb-0">
                              <div class="media-sm-wrapper bg-info-dark">
                                <a href="user-profile.html">
                                  <i class="mdi mdi-account-multiple-check"></i>
                                </a>
                              </div>
                              <div class="media-body">
                                <a href="user-profile.html">
                                  <span class="title mb-0">Add request</span>
                                  <span class="discribe">Add Dany Jones as your contact.</span>
                                  <div class="buttons">
                                    <a href="#" class="btn btn-sm btn-success shadow-none text-white">accept</a>
                                    <a href="#" class="btn btn-sm shadow-none">delete</a>
                                  </div>
                                  <span class="time">
                                    <time>6 hrs ago</time>...
                                  </span>
                                </a>
                              </div>
                            </div>

                            <div class="media media-sm p-4 mb-0">
                              <div class="media-sm-wrapper bg-info">
                                <a href="user-profile.html">
                                  <i class="mdi mdi-playlist-check"></i>
                                </a>
                              </div>
                              <div class="media-body">
                                <a href="user-profile.html">
                                  <span class="title mb-0">Task complete</span>
                                  <span class="discribe">Afraid at highly months do things on at.</span>
                                  <span class="time">
                                    <time>1 hrs ago</time>...
                                  </span>
                                </a>
                              </div>
                            </div>

                          </div>

                          <div class="tab-pane fade" id="message" role="tabpanel" aria-labelledby="message-tab">

                            <div class="media media-sm p-4 mb-0">
                              <div class="media-sm-wrapper">
                                <a href="user-profile.html">
                                  <img src="assets/img/user/user-sm-01.jpg" alt="User Image">
                                </a>
                              </div>
                              <div class="media-body">
                                <a href="user-profile.html">
                                  <span class="title mb-0">Selena Wagner</span>
                                  <span class="discribe">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</span>
                                  <span class="time">
                                    <time>15 min ago</time>...
                                  </span>
                                </a>
                              </div>
                            </div>

                            <div class="media media-sm p-4 mb-0">
                              <div class="media-sm-wrapper">
                                <a href="user-profile.html">
                                  <img src="assets/img/user/user-sm-03.jpg" alt="User Image">
                                </a>
                              </div>
                              <div class="media-body">
                                <a href="user-profile.html">
                                  <span class="title mb-0">Sagge Hudson</span>
                                  <span class="discribe">On disposal of as landlord Afraid at highly months do things on at.</span>
                                  <span class="time">
                                    <time>1 hrs ago</time>...
                                  </span>
                                </a>
                              </div>
                            </div>

                            <div class="media media-sm bg-warning-10 p-4 mb-0">
                              <div class="media-sm-wrapper">
                                <a href="user-profile.html">
                                  <img src="assets/img/user/user-sm-02.jpg" alt="User Image">
                                </a>
                              </div>
                              <div class="media-body">
                                <a href="user-profile.html">
                                  <span class="title mb-0">John Doe</span>
                                  <span class="discribe">Extremity sweetness difficult behaviour he of. On disposal of as landlord horrible. Afraid
                                    at highly months do things on at.</span>
                                  <span class="time">
                                    <time>Just now</time>...
                                  </span>
                                </a>
                              </div>
                            </div>

                            <div class="media media-sm p-4 mb-0">
                              <div class="media-sm-wrapper">
                                <a href="user-profile.html">
                                  <img src="assets/img/user/user-sm-04.jpg" alt="User Image">
                                </a>
                              </div>
                              <div class="media-body">
                                <a href="user-profile.html">
                                  <span class="title mb-0">Albrecht Straub</span>
                                  <span class="discribe"> Beatae quia natus assumenda laboriosam, nisi perferendis aliquid consectetur expedita non tenetur.</span>
                                  <span class="time">
                                    <time>Just now</time>...
                                  </span>
                                </a>
                              </div>
                            </div>

                          </div>
                          <div class="tab-pane fade" id="other" role="tabpanel" aria-labelledby="contact-tab">

                            <div class="media media-sm p-4 bg-light mb-0">
                              <div class="media-sm-wrapper bg-primary">
                                <a href="user-profile.html">
                                  <i class="mdi mdi-calendar-check-outline"></i>
                                </a>
                              </div>
                              <div class="media-body">
                                <a href="user-profile.html">
                                  <span class="title mb-0">New event added</span>
                                  <span class="discribe">1/3/2014 (1pm - 2pm)</span>
                                  <span class="time">
                                    <time>10 min ago...</time>...
                                  </span>
                                </a>
                              </div>
                            </div>

                            <div class="media media-sm p-4 mb-0">
                              <div class="media-sm-wrapper bg-info-dark">
                                <a href="user-profile.html">
                                  <i class="mdi mdi-account-multiple-check"></i>
                                </a>
                              </div>
                              <div class="media-body">
                                <a href="user-profile.html">
                                  <span class="title mb-0">Add request</span>
                                  <span class="discribe">Add Dany Jones as your contact.</span>
                                  <div class="buttons">
                                    <a href="#" class="btn btn-sm btn-success shadow-none text-white">accept</a>
                                    <a href="#" class="btn btn-sm shadow-none">delete</a>
                                  </div>
                                  <span class="time">
                                    <time>6 hrs ago</time>...
                                  </span>
                                </a>
                              </div>
                            </div>

                            <div class="media media-sm p-4 mb-0">
                              <div class="media-sm-wrapper bg-info">
                                <a href="user-profile.html">
                                  <i class="mdi mdi-playlist-check"></i>
                                </a>
                              </div>
                              <div class="media-body">
                                <a href="user-profile.html">
                                  <span class="title mb-0">Task complete</span>
                                  <span class="discribe">Afraid at highly months do things on at.</span>
                                  <span class="time">
                                    <time>1 hrs ago</time>...
                                  </span>
                                </a>
                              </div>
                            </div>

                          </div>
                        </div>
                      </div>

                      <footer class="border-top dropdown-notify-footer">
                        <div class="d-flex justify-content-between align-items-center py-2 px-4">
                          <span>Last updated 3 min ago</span>
                          <a id="refress-button" href="javascript:" class="btn mdi mdi-cached btn-refress"></a>
                        </div>
                      </footer>
                    </div>
                  </li>
                  <!-- User Account -->
                  <li class="dropdown user-menu">
                    <button class="dropdown-toggle nav-link" data-toggle="dropdown">
                      <img src="assets/img/user/user-xs-01.jpg" class="user-image rounded-circle" alt="User Image" />
                      <span class="d-none d-lg-inline-block">John Doe</span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right">
                      <li>
                        <a class="dropdown-link-item" href="user-profile.html">
                          <i class="mdi mdi-account-outline"></i>
                          <span class="nav-text">My Profile</span>
                        </a>
                      </li>
                      <li>
                        <a class="dropdown-link-item" href="email-inbox.html">
                          <i class="mdi mdi-email-outline"></i>
                          <span class="nav-text">Message</span>
                          <span class="badge badge-pill badge-primary">24</span>
                        </a>
                      </li>
                      <li>
                        <a class="dropdown-link-item" href="user-activities.html">
                          <i class="mdi mdi-diamond-stone"></i>
                          <span class="nav-text">Activitise</span></a>
                      </li>
                      <li>
                        <a class="dropdown-link-item" href="user-account-settings.html">
                          <i class="mdi mdi-settings"></i>
                          <span class="nav-text">Account Setting</span>
                        </a>
                      </li>

                      <li class="dropdown-footer">
                        <a class="dropdown-link-item" href="sign-in.html"> <i class="mdi mdi-logout"></i> Log Out </a>
                      </li>
                    </ul>
                  </li>
                </ul>
              </div>
            </nav>


          </header>

        <!-- ====================================
        �X�X�X CONTENT WRAPPER
        ===================================== -->
        <div class="content-wrapper">
          <div class="content"><!-- For Components documentaion -->
<div class="card card-default">
  <div class="px-6 py-4">
    <p>Mono provides a variety of <span class="text-secondary text-capitalize"> Bootstrap Basic inputs </span> components with a
      little customization that suits its design standards. For more information, please see the official <a class="font-weight-bold" href="https://getbootstrap.com/docs/4.3/components/forms/" target="_blank"> Bootstrap documentation.</a></p>
  </div>
</div>

<div class="row">
  <div class="col-xl-6">
    <!-- Basic Examples -->
    <div class="card card-default">
      <div class="card-header">
        <h2>Basic Examples</h2>
        <a class="btn mdi mdi-code-tags" data-toggle="collapse" href="#collapse-basic-input" role="button"
          aria-expanded="false" aria-controls="collapse-basic-input"> </a>


      </div>
      <div class="card-body">
        <div class="collapse" id="collapse-basic-input">
          <pre class="language-html mb-4">
<code >
&lt;form&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlInput1"&gt;Email address&lt;/label&gt;
    &lt;input type="email" class="form-control" id="exampleFormControlInput1" placeholder="Enter Email"&gt;
    &lt;span class="mt-2 d-block"&gt;We'll never share your email with anyone else.&lt;/span&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlPassword"&gt;Password&lt;/label&gt;
    &lt;input type="password" class="form-control" id="exampleFormControlPassword" placeholder="Password"&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlSelect12"&gt;Example select&lt;/label&gt;
    &lt;select class="form-control" id="exampleFormControlSelect12"&gt;
      &lt;option&gt;1&lt;/option&gt;
      &lt;option&gt;2&lt;/option&gt;
      &lt;option&gt;3&lt;/option&gt;
      &lt;option&gt;4&lt;/option&gt;
      &lt;option&gt;5&lt;/option&gt;
    &lt;/select&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControl2"&gt;Example multiple select&lt;/label&gt;
    &lt;select multiple class="form-control" id="exampleFormControl2"&gt;
      &lt;option&gt;1&lt;/option&gt;
      &lt;option&gt;2&lt;/option&gt;
      &lt;option&gt;3&lt;/option&gt;
      &lt;option&gt;4&lt;/option&gt;
      &lt;option&gt;5&lt;/option&gt;
    &lt;/select&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlTextarea1"&gt;Example textarea&lt;/label&gt;
    &lt;textarea class="form-control" id="exampleFormControlTextarea1" rows="3"&gt;&lt;/textarea&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlFile1"&gt;Example file input&lt;/label&gt;
    &lt;input type="file" class="form-control-file" id="exampleFormControlFile1"&gt;
  &lt;/div&gt;
  &lt;div class="form-footer mt-6"&gt;
    &lt;button type="submit" class="btn btn-primary btn-pill"&gt;Submit&lt;/button&gt;
    &lt;button type="submit" class="btn btn-light btn-pill"&gt;Cancel&lt;/button&gt;
  &lt;/div&gt;
&lt;/form&gt;

</code>
          </pre>
        </div>
        <form>
          <div class="form-group">
            <label for="exampleFormControlInput2">Email address</label>
            <input type="email" class="form-control" id="exampleFormControlInput2" placeholder="Enter Email">
            <span class="mt-2 d-block">We'll never share your email with anyone else.</span>
          </div>
          <div class="form-group">
            <label for="exampleFormControlPassword">Password</label>
            <input type="password" class="form-control" id="exampleFormControlPassword" placeholder="Password">
          </div>
          <div class="form-group">
            <label for="exampleFormControlSelect12">Example select</label>
            <select class="form-control" id="exampleFormControlSelect12">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
            </select>
          </div>
          <div class="form-group">
            <label for="exampleFormControl2">Example multiple select</label>
            <select multiple class="form-control" id="exampleFormControl2">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
            </select>
          </div>
          <div class="form-group">
            <label for="exampleFormControlTextarea1">Example textarea</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
          </div>
          <div class="form-group">
            <label for="exampleFormControlFile1">Example file input</label>
            <input type="file" class="form-control-file" id="exampleFormControlFile1">
          </div>
          <div class="form-footer mt-6">
            <button type="submit" class="btn btn-primary btn-pill">Submit</button>
            <button type="submit" class="btn btn-light btn-pill">Cancel</button>
          </div>
        </form>

      </div>
    </div>

    <!-- Custom Styles -->
    <div class="card card-default">
      <div class="card-header">
        <h2>Custom Styles</h2>
        <a class="btn mdi mdi-code-tags" data-toggle="collapse" href="#collapse-custom-input" role="button"
          aria-expanded="false" aria-controls="collapse-custom-input"> </a>


      </div>
      <div class="card-body">
        <div class="collapse" id="collapse-custom-input">
          <pre class="language-html mb-4">
<code >
&lt;form&gt;
  &lt;div class="row"&gt;
    &lt;div class="col-sm-6"&gt;
      &lt;div class="form-group"&gt;
        &lt;label for="fname"&gt;First name&lt;/label&gt;
        &lt;input type="text" class="form-control" placeholder="John"&gt;
      &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class="col-sm-6"&gt;
      &lt;div class="form-group"&gt;
        &lt;label for="lname"&gt;Last name&lt;/label&gt;
        &lt;input type="text" class="form-control" placeholder="Smith"&gt;
      &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class="col-sm-6"&gt;
      &lt;div class="form-group"&gt;
        &lt;label for="city"&gt;City&lt;/label&gt;
        &lt;input type="text" class="form-control" placeholder="City Name"&gt;
      &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class="col-sm-6"&gt;
      &lt;div class="row"&gt;
        &lt;div class="col-6"&gt;
          &lt;div class="form-group"&gt;
            &lt;label for="State"&gt;State&lt;/label&gt;
            &lt;input type="text" class="form-control" placeholder="State"&gt;
          &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class="col-6"&gt;
          &lt;div class="form-group"&gt;
            &lt;label for="Zip"&gt;Zip&lt;/label&gt;
            &lt;input type="text" class="form-control" placeholder="Zip"&gt;
          &lt;/div&gt;
        &lt;/div&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
  &lt;div class="form-footer pt-5 border-top"&gt;
    &lt;button type="submit" class="btn btn-primary btn-pill"&gt;Submit&lt;/button&gt;
  &lt;/div&gt;
</form>

</code>
          </pre>
        </div>
        <form>
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="fname">First name</label>
                <input type="text" class="form-control" placeholder="John">
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="lname">Last name</label>
                <input type="text" class="form-control" placeholder="Smith">
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="city">City</label>
                <input type="text" class="form-control" placeholder="City Name">
              </div>
            </div>
            <div class="col-sm-6">
              <div class="row">
                <div class="col-6">
                  <div class="form-group">
                    <label for="State">State</label>
                    <input type="text" class="form-control" placeholder="State">
                  </div>
                </div>
                <div class="col-6">
                  <div class="form-group">
                    <label for="Zip">Zip</label>
                    <input type="text" class="form-control" placeholder="Zip">
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="form-footer pt-5 border-top">
            <button type="submit" class="btn btn-primary btn-pill">Submit</button>
          </div>
        </form>
      </div>
    </div>

    <!-- Inline Form -->
    <div class="card card-default">
      <div class="card-header">
        <h2>Inline Form</h2>
        <a class="btn mdi mdi-code-tags" data-toggle="collapse" href="#collapse-inline-input" role="button"
          aria-expanded="false" aria-controls="collapse-inline-input"> </a>


      </div>
      <div class="card-body">
        <div class="collapse" id="collapse-inline-input">
          <pre class="language-html mb-4">
<code >
&lt;form class="form-inline"&gt;
  &lt;label class="sr-only" for="inlineFormInputName2"&gt;Name&lt;/label&gt;
  &lt;input type="text" class="form-control mb-2 mr-sm-2" id="inlineFormInputName2" placeholder="Jane Doe"&gt;
  &lt;label class="sr-only" for="inlineFormInputGroupUsername2"&gt;Username&lt;/label&gt;
  &lt;div class="input-group mb-2 mr-sm-2"&gt;
    &lt;div class="input-group-prepend"&gt;
      &lt;div class="input-group-text"&gt;@&lt;/div&gt;
    &lt;/div&gt;
    &lt;input type="text" class="form-control" id="inlineFormInputGroupUsername2" placeholder="Username"&gt;
  &lt;/div&gt;
  &lt;button type="submit" class="btn btn-primary btn-pill mb-2"&gt;Submit&lt;/button&gt;
&lt;/form&gt;
&lt;form&gt;
  &lt;p class="text-dark mb-4"&gt;Custom form controls and selects are also supported.&lt;/p&gt;
  &lt;label class="text-dark"&gt;Preference&lt;/label&gt;
  &lt;select class="custom-select my-1 mr-sm-2 w-auto" id="inlineFormCustomSelectPref"&gt;
    &lt;option selected&gt;Choose...&lt;/option&gt;
    &lt;option value="1"&gt;One&lt;/option&gt;
    &lt;option value="2"&gt;Two&lt;/option&gt;
    &lt;option value="3"&gt;Three&lt;/option&gt;
  &lt;/select&gt;
  &lt;label class="control control-checkbox d-inline-block"&gt;Remember my preference
    &lt;input type="checkbox" name="checkbox1" /&gt;
    &lt;div class="control-indicator"&gt;&lt;/div&gt;
  &lt;/label&gt;
  &lt;button type="submit" class="btn btn-primary btn-pill ml-2"&gt;Submit&lt;/button&gt;
&lt;/form&gt;
</code>
          </pre>
        </div>
        <p class="text-dark mb-3">Auto-sizing</p>
        <form class="form-inline">
          <label class="sr-only" for="inlineFormInputName2">Name</label>
          <input type="text" class="form-control mb-2 mr-sm-2" id="inlineFormInputName2" placeholder="Jane Doe">
          <label class="sr-only" for="inlineFormInputGroupUsername2">Username</label>
          <div class="input-group mb-2 mr-sm-2">
            <div class="input-group-prepend">
              <div class="input-group-text">@</div>
            </div>
            <input type="text" class="form-control" id="inlineFormInputGroupUsername2" placeholder="Username">
          </div>
          <button type="submit" class="btn btn-primary btn-pill mb-2">Submit</button>
        </form>
        <hr>
        <form>
          <p class="text-dark mb-4">Custom form controls and selects are also supported.</p>
          <label class="text-dark">Preference</label>
          <select class="custom-select my-1 mr-sm-2 w-auto" id="inlineFormCustomSelectPref">
            <option selected>Choose...</option>
            <option value="1">One</option>
            <option value="2">Two</option>
            <option value="3">Three</option>
          </select>
          <label class="control control-checkbox d-inline-block">Remember my preference
            <input type="checkbox" name="checkbox1" />
            <div class="control-indicator"></div>
          </label>
          <button type="submit" class="btn btn-primary btn-pill ml-2">Submit</button>
        </form>
      </div>
    </div>

    <!-- Form Pill -->
    <div class="card card-default">
      <div class="card-header">
        <h2>Form Pill</h2>
        <a class="btn mdi mdi-code-tags" data-toggle="collapse" href="#collapse-input-pill" role="button"
          aria-expanded="false" aria-controls="collapse-input-pill"> </a>


      </div>
      <div class="card-body">
        <div class="collapse" id="collapse-input-pill">
          <pre class="language-html mb-4">
<code >
&lt;form&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlInput3"&gt;Email address&lt;/label&gt;
    &lt;input type="email" class="form-control rounded-pill" id="exampleFormControlInput3" placeholder="Enter Email"&gt;
    &lt;span class="mt-2 d-block"&gt;We'll never share your email with anyone else.&lt;/span&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlPassword31"&gt;Password&lt;/label&gt;
    &lt;input type="password" class="form-control rounded-pill" id="exampleFormControlPassword31" placeholder="Password"&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlSelect13"&gt;Example select&lt;/label&gt;
    &lt;select class="form-control rounded-pill" id="exampleFormControlSelect13"&gt;
      &lt;option&gt;1&lt;/option&gt;
      &lt;option&gt;2&lt;/option&gt;
      &lt;option&gt;3&lt;/option&gt;
      &lt;option&gt;4&lt;/option&gt;
      &lt;option&gt;5&lt;/option&gt;
    &lt;/select&gt;
  &lt;/div&gt;
  &lt;div class="form-footer mt-4"&gt;
    &lt;button type="submit" class="btn btn-primary btn-pill"&gt;Submit&lt;/button&gt;
    &lt;button type="submit" class="btn btn-light btn-pill"&gt;Cancel&lt;/button&gt;
  &lt;/div&gt;
&lt;/form&gt;

</code>
          </pre>
        </div>
        <form>
          <div class="form-group">
            <label for="exampleFormControlInput3">Email address</label>
            <input type="email" class="form-control rounded-pill" id="exampleFormControlInput3" placeholder="Enter Email">
            <span class="mt-2 d-block">We'll never share your email with anyone else.</span>
          </div>
          <div class="form-group">
            <label for="exampleFormControlPassword12">Password</label>
            <input type="password" class="form-control rounded-pill" id="exampleFormControlPassword12" placeholder="Password">
          </div>
          <div class="form-group">
            <label for="exampleFormControlSelect13">Example select</label>
            <select class="form-control rounded-pill" id="exampleFormControlSelect13">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
            </select>
          </div>
          <div class="form-footer mt-4">
            <button type="submit" class="btn btn-primary btn-pill">Submit</button>
            <button type="submit" class="btn btn-light btn-pill">Cancel</button>
          </div>
        </form>
      </div>
    </div>



  </div>
  <div class="col-xl-6">
    <!-- Form Square -->
    <div class="card card-default">
      <div class="card-header">
        <h2>Form Square</h2>
        <a class="btn mdi mdi-code-tags" data-toggle="collapse" href="#collapse-input-square" role="button"
          aria-expanded="false" aria-controls="collapse-input-square"> </a>


      </div>
      <div class="card-body">
        <div class="collapse" id="collapse-input-square">
          <pre class="language-html mb-4">
<code >
&lt;form&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlInput4"&gt;Email address&lt;/label&gt;
    &lt;input type="email" class="form-control rounded-0" id="exampleFormControlInput4" placeholder="Enter Email"&gt;
    &lt;span class="mt-2 d-block"&gt;We'll never share your email with anyone else.&lt;/span&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlPasswor3"&gt;Password&lt;/label&gt;
    &lt;input type="password" class="form-control rounded-0" id="exampleFormControlPasswor3" placeholder="Password"&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlSelect14"&gt;Example select&lt;/label&gt;
    &lt;select class="form-control rounded-0" id="exampleFormControlSelect14"&gt;
      &lt;option&gt;1&lt;/option&gt;
      &lt;option&gt;2&lt;/option&gt;
      &lt;option&gt;3&lt;/option&gt;
      &lt;option&gt;4&lt;/option&gt;
      &lt;option&gt;5&lt;/option&gt;
    &lt;/select&gt;
  &lt;/div&gt;
  &lt;div class="form-footer"&gt;
    &lt;button type="submit" class="btn btn-secondary btn-pill"&gt;Submit&lt;/button&gt;
    &lt;button type="submit" class="btn btn-light btn-pill"&gt;Cancel&lt;/button&gt;
  &lt;/div&gt;

&lt;/form&gt;

</code>
          </pre>
        </div>
        <form>
          <div class="form-group">
            <label for="exampleFormControlInput44">Email address</label>
            <input type="email" class="form-control rounded-0" id="exampleFormControlInput4" placeholder="Enter Email">
            <span class="mt-2 d-block">We'll never share your email with anyone else.</span>
          </div>
          <div class="form-group">
            <label for="exampleFormControlPasswor3">Password</label>
            <input type="password" class="form-control rounded-0" id="exampleFormControlPasswor3" placeholder="Password">
          </div>
          <div class="form-group">
            <label for="exampleFormControlSelect14">Example select</label>
            <select class="form-control rounded-0" id="exampleFormControlSelect14">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
            </select>
          </div>
          <div class="form-footer">
            <button type="submit" class="btn btn-secondary btn-pill">Submit</button>
            <button type="submit" class="btn btn-light btn-pill">Cancel</button>
          </div>

        </form>

      </div>
    </div>

    <!-- Solid Style Input -->
    <div class="card card-default">
      <div class="card-header">
        <h2>Solid Style Input</h2>
        <a class="btn mdi mdi-code-tags" data-toggle="collapse" href="#collapse-input-light-bg" role="button"
          aria-expanded="false" aria-controls="collapse-input-light-bg"> </a>


      </div>
      <div class="card-body">
        <div class="collapse" id="collapse-input-light-bg">
          <pre class="language-html mb-4">
<code >
&lt;form&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlInput5"&gt;Email address&lt;/label&gt;
    &lt;input type="email" class="form-control rounded-0 bg-light" id="exampleFormControlInput5" placeholder="Enter Email"&gt;
    &lt;span class="mt-2 d-block"&gt;We'll never share your email with anyone else.&lt;/span&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlPassword4"&gt;Password&lt;/label&gt;
    &lt;input type="password" class="form-control rounded-0 bg-light" id="exampleFormControlPassword4"
      placeholder="Password"&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlSelect15"&gt;Example select&lt;/label&gt;
    &lt;select class="form-control rounded-0 bg-light" id="exampleFormControlSelect15"&gt;
      &lt;option&gt;1&lt;/option&gt;
      &lt;option&gt;2&lt;/option&gt;
      &lt;option&gt;3&lt;/option&gt;
      &lt;option&gt;4&lt;/option&gt;
      &lt;option&gt;5&lt;/option&gt;
    &lt;/select&gt;
  &lt;/div&gt;
  &lt;div class="form-footer"&gt;
    &lt;button type="submit" class="btn btn-secondary btn-pill"&gt;Submit&lt;/button&gt;
    &lt;button type="submit" class="btn btn-light btn-pill"&gt;Cancel&lt;/button&gt;
  &lt;/div&gt;
&lt;/form&gt;

</code>
          </pre>
        </div>
        <form>
          <div class="form-group">
            <label for="exampleFormControlInput5">Email address</label>
            <input type="email" class="form-control rounded-0 bg-light" id="exampleFormControlInput5" placeholder="Enter Email">
            <span class="mt-2 d-block">We'll never share your email with anyone else.</span>
          </div>
          <div class="form-group">
            <label for="exampleFormControlPassword4">Password</label>
            <input type="password" class="form-control rounded-0 bg-light" id="exampleFormControlPassword4" placeholder="Password">
          </div>
          <div class="form-group">
            <label for="exampleFormControlSelect16">Example select</label>
            <select class="form-control rounded-0 bg-light" id="exampleFormControlSelect16">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
            </select>
          </div>
          <div class="form-footer">
            <button type="submit" class="btn btn-secondary btn-pill">Submit</button>
            <button type="submit" class="btn btn-light btn-pill">Cancel</button>
          </div>
        </form>

      </div>
    </div>

    <!-- Disabled Form -->
    <div class="card card-default">
      <div class="card-header">
        <h2>Disabled Form</h2>
        <a class="btn mdi mdi-code-tags" data-toggle="collapse" href="#collapse-input-disabled" role="button"
          aria-expanded="false" aria-controls="collapse-input-disabled"> </a>


      </div>
      <div class="card-body">
        <div class="collapse" id="collapse-input-disabled">
          <pre class="language-html mb-4">
<code >
&lt;form&gt;
  &lt;fieldset disabled&gt;
    &lt;div class="form-group"&gt;
      &lt;label for="disabledTextInput"&gt;Disabled input&lt;/label&gt;
      &lt;input type="text" id="disabledTextInput" class="form-control" placeholder="Disabled input"&gt;
    &lt;/div&gt;
    &lt;div class="form-group"&gt;
      &lt;label for="disabledSelect"&gt;Disabled select menu&lt;/label&gt;
      &lt;select id="disabledSelect" class="form-control"&gt;
        &lt;option&gt;Disabled select&lt;/option&gt;
      &lt;/select&gt;
    &lt;/div&gt;
    &lt;div class="form-group"&gt;
      &lt;div class="form-check"&gt;
        &lt;input class="form-check-input" type="checkbox" id="disabledFieldsetCheck" disabled&gt;
        &lt;label class="form-check-label" for="disabledFieldsetCheck"&gt;
          Can't check this
        &lt;/label&gt;
      &lt;/div&gt;
    &lt;/div&gt;
    &lt;button type="submit" class="btn btn-primary"&gt;Submit&lt;/button&gt;
  &lt;/fieldset&gt;
&lt;/form&gt;

</code>
          </pre>
        </div>
        <form>
          <fieldset disabled>
            <div class="form-group">
              <label for="disabledTextInput">Disabled input</label>
              <input type="text" id="disabledTextInput" class="form-control" placeholder="Disabled input">
            </div>
            <div class="form-group">
              <label for="disabledSelect">Disabled select menu</label>
              <select id="disabledSelect" class="form-control">
                <option>Disabled select</option>
              </select>
            </div>
            <div class="form-group">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" id="disabledFieldsetCheck" disabled>
                <label class="form-check-label" for="disabledFieldsetCheck">
                  Can't check this
                </label>
              </div>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          </fieldset>
        </form>

      </div>
    </div>

    <!-- Form Sizing -->
    <div class="card card-default">
      <div class="card-header">
        <h2>Form Sizing</h2>
        <a class="btn mdi mdi-code-tags" data-toggle="collapse" href="#collapse-input-sizing" role="button"
          aria-expanded="false" aria-controls="collapse-input-sizing"> </a>


      </div>
      <div class="card-body">
        <div class="collapse" id="collapse-input-sizing">
          <pre class="language-html mb-4">
<code >
&lt;form&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlInput6"&gt;Large input&lt;/label&gt;
    &lt;input class="form-control form-control-lg" type="text" placeholder="Large input"&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlInput7"&gt;Default input&lt;/label&gt;
    &lt;input class="form-control" type="text" placeholder="Default input"&gt;
  &lt;/div&gt;
  &lt;div class="form-group"&gt;
    &lt;label for="exampleFormControlInput8"&gt;Small input&lt;/label&gt;
    &lt;input class="form-control form-control-sm" type="text" placeholder="Small input"&gt;
  &lt;/div&gt;
&lt;/form&gt;

</code>
          </pre>
        </div>
        <form>
          <div class="form-group">
            <label for="exampleFormControlInput6">Large input</label>
            <input class="form-control form-control-lg" type="text" placeholder="Large input">
          </div>
          <div class="form-group">
            <label for="exampleFormControlInput7">Default input</label>
            <input class="form-control" type="text" placeholder="Default input">
          </div>
          <div class="form-group">
            <label for="exampleFormControlInput8">Small input</label>
            <input class="form-control form-control-sm" type="text" placeholder="Small input">
          </div>
        </form>

      </div>
    </div>

    <!-- Column Sizing -->
    <div class="card card-default">
      <div class="card-header">
        <h2>Column Sizing</h2>
        <a class="btn mdi mdi-code-tags" data-toggle="collapse" href="#collapse-colum-sizing" role="button"
          aria-expanded="false" aria-controls="collapse-colum-sizing"> </a>


      </div>
      <div class="card-body">
        <div class="collapse" id="collapse-colum-sizing">
          <pre class="language-html mb-4">
<code >
&lt;form&gt;
  &lt;div class="form-row"&gt;
    &lt;div class="col-6"&gt;
      &lt;input type="text" class="form-control" placeholder="col-6"&gt;
    &lt;/div&gt;
    &lt;div class="col-3"&gt;
      &lt;input type="text" class="form-control" placeholder="col-3"&gt;
    &lt;/div&gt;
    &lt;div class="col-3"&gt;
      &lt;input type="text" class="form-control" placeholder="col-3"&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/form&gt;

</code>
          </pre>
        </div>
        <form>
          <div class="form-row">
            <div class="col-6">
              <input type="text" class="form-control" placeholder="col-6">
            </div>
            <div class="col-3">
              <input type="text" class="form-control" placeholder="col-3">
            </div>
            <div class="col-3">
              <input type="text" class="form-control" placeholder="col-3">
            </div>
          </div>
        </form>

      </div>
    </div>

  </div>
</div>

</div>
          
        </div>
        
          <!-- Footer -->
          <footer class="footer mt-auto">
            <div class="copyright bg-white">
              <p>
                &copy; <span id="copy-year"></span> Copyright Mono Dashboard Bootstrap Template by <a class="text-primary" href="http://www.iamabdus.com/" target="_blank" >Abdus</a>.
              </p>
            </div>
            <script>
                var d = new Date();
                var year = d.getFullYear();
                document.getElementById("copy-year").innerHTML = year;
            </script>
          </footer>

      </div>
    </div>
    
                    <!-- Card Offcanvas -->
                    <div class="card card-offcanvas" id="contact-off" >
                      <div class="card-header">
                        <h2>Contacts</h2>
                        <a href="#" class="btn btn-primary btn-pill px-4">Add New</a>
                      </div>
                      <div class="card-body">

                        <div class="mb-4">
                          <input type="text" class="form-control form-control-lg form-control-secondary rounded-0" placeholder="Search contacts...">
                        </div>

                        <div class="media media-sm">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="assets/img/user/user-sm-01.jpg" alt="User Image">
                              <span class="active bg-primary"></span>
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title">Selena Wagner</span>
                              <span class="discribe">Designer</span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="assets/img/user/user-sm-02.jpg" alt="User Image">
                              <span class="active bg-primary"></span>
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title">Walter Reuter</span>
                              <span>Developer</span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="assets/img/user/user-sm-03.jpg" alt="User Image">
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title">Larissa Gebhardt</span>
                              <span>Cyber Punk</span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="assets/img/user/user-sm-04.jpg" alt="User Image">
                            </a>

                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title">Albrecht Straub</span>
                              <span>Photographer</span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="assets/img/user/user-sm-05.jpg" alt="User Image">
                              <span class="active bg-danger"></span>
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title">Leopold Ebert</span>
                              <span>Fashion Designer</span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="assets/img/user/user-sm-06.jpg" alt="User Image">
                              <span class="active bg-primary"></span>
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title">Selena Wagner</span>
                              <span>Photographer</span>
                            </a>
                          </div>
                        </div>

                      </div>
                    </div>



    
                    <script src="assets/plugins/jquery/jquery.min.js"></script>
                    <script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <script src="assets/plugins/simplebar/simplebar.min.js"></script>
                    <script src="https://unpkg.com/hotkeys-js/dist/hotkeys.min.js"></script>

                    
                    
                    <script src="assets/plugins/prism/prism.js"></script>
                    
                    
                    <script src="assets/js/mono.js"></script>
                    <script src="assets/js/chart.js"></script>
                    <script src="assets/js/map.js"></script>
                    <script src="assets/js/custom.js"></script>

                    


                    <!--  -->


  </body>
</html>