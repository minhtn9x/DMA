<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Home</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">


        <!-- Tables -->
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">
            <c:set var="user" value="${sessionScope.LOGIN_USER}"/>
            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">DMA</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <hr class="sidebar-divider">
                <!-- Nav Item - Pages Collapse Menu -->
                <div class="nav-item">
                    <a class="nav-link" href="MainController?action=UserHome">
                        <i class="fas fa-fw fa-hard-drive"></i>&emsp;
                        <span>My Document</span>
                    </a>
                </div>

                <div class="nav-item active">
                    <a class="nav-link" href="MainController?action=MyProjects" 
                       data-toggle="collapse" data-target="#collapseMyProjects" 
                       aria-expanded="true" aria-controls="collapseMyProjects">
                        <i class="fas fa-fw fa-user-group"></i>&emsp;
                        <span>Group sharing</span>
                    </a>
                    <div id="collapseMyProjects" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Projects</h6>
                            <c:set var="myProjects" value="${sessionScope.MY_PROJECTS}"/>
                            <c:if test="${not empty myProjects}">
                                <c:forEach var="project" varStatus="counter" items="${myProjects}">
                                    <a class="collapse-item" href="MainController?action=GroupShare&projectId=${project.projectID}&projectName=${project.projectName}">
                                        <i class="fas fa-solid fa-rectangle-list"></i>&emsp;
                                        <span>${project.projectName}</span>
                                    </a>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>


                <!-- Divider -->
                <hr class="sidebar-divider">
                <div class="nav-item">
                    <a class="nav-link" href="MainController?action=Recent&projectId=${param.projectId}">
                        <i class="fas fa-fw fa-clock"></i>&emsp;
                        <span>Recent</span>
                    </a>
                </div>

                <div class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-fw fa-share-from-square"></i>&emsp;
                        <span>Shared with me</span>
                    </a>
                </div>

                <div class="nav-item">
                    <a class="nav-link" href="MainController?action=Starred&projectId=${param.projectId}">
                        <i class="fas fa-fw fa-star"></i>&emsp;
                        <span>Starred</span>
                    </a>

                </div><div class="nav-item">
                    <a class="nav-link" href="MainController?action=viewProject">
                        <i class="fas fa-fw fa-diagram-project"></i>&emsp;
                        <span>Project</span>
                    </a>

                </div>

                <div class="nav-item">
                    <a class="nav-link" href="MainController?action=Bin&projectId=${param.projectId}">
                        <i class="fas fa-fw fa-trash"></i>&emsp;
                        <span>Bin</span>
                    </a>
                </div>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">
                <div class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-fw fa-comment-dots"></i>&emsp;
                        <span>Feedback</span>
                    </a>
                </div>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <!-- Nav Item - Alerts -->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-bell fa-fw"></i>
                                    <!-- Counter - Alerts -->
                                    <span class="badge badge-danger badge-counter">3+</span>
                                </a>
                                <!-- Dropdown - Alerts -->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                                    <h6 class="dropdown-header">
                                        Alerts Center
                                    </h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-primary">
                                                <i class="fas fa-file-alt text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">December 12, 2019</div>
                                            <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-success">
                                                <i class="fas fa-donate text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">December 7, 2019</div>
                                            $290.29 has been deposited into your account!
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-warning">
                                                <i class="fas fa-exclamation-triangle text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">December 2, 2019</div>
                                            Spending Alert: We've noticed unusually high spending for your account.
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                                </div>
                            </li>

                            <!-- Nav Item - Messages -->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-envelope fa-fw"></i>
                                    <!-- Counter - Messages -->
                                    <span class="badge badge-danger badge-counter">7</span>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                                    <h6 class="dropdown-header">
                                        Message Center
                                    </h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                                            <div class="status-indicator bg-success"></div>
                                        </div>
                                        <div class="font-weight-bold">
                                            <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                                            <div class="small text-gray-500">Emily Fowler · 58m</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
                                            <div class="status-indicator"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
                                            <div class="small text-gray-500">Jae Chun · 1d</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
                                            <div class="status-indicator bg-warning"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
                                            <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                                            <div class="status-indicator bg-success"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
                                            <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                                </div>
                            </li>

                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                                        ${user.fullName}<br/>
                                        <span style="float: right; color: #4e73df">${user.roleID=="AD"?"Admin":"File Organizer"}</span>
                                    </span>
                                    <img class="img-profile rounded-circle" src=${user.roleID=="AD"?"images/avatar_admin.jpg":"images/avatar.jpg"}>
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="profile.jsp">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <div class="card shadow mb-4">
                            <!-- Page Heading -->
                            <div class="card-header py-3" style="margin: auto">
                                <h1 class="h3 mb-4 text-gray-800 font-weight-bold text-primary">Share '${sessionScope.FILE_NAME}'</h1>
                            </div>
                            <div class="card-body">
                                <c:if test="${not empty sessionScope.USERS}">
                                    <form action="MainController" method="POST">
                                        <input list="users" placeholder="Add people" name="userId" minlength="2" required>
                                        <datalist id="users">
                                            <c:forEach var="user" varStatus="counter" items="${sessionScope.USERS}">
                                                <option value="${user.userID}">
                                                </c:forEach>
                                        </datalist>

                                        <input type="hidden" name="fileId" value="${sessionScope.FILE_ID}" />
                                        <input type="hidden" name="fileName" value="${sessionScope.FILE_NAME}" />
                                        <input type="hidden" name="users" value="${sessionScope.USERS}" />

                                        <select id="optionSelect" onchange="document.getElementById('optionHidden').value = document.getElementById('optionSelect').value">
                                            <option value="Viewer" selected="">Viewer</option>
                                            <option value="Commenter">Commenter</option>
                                            <option value="Editor">Editor</option>
                                        </select>
                                        <input id="optionHidden" type="hidden" name="role" value="Viewer"/>

                                        <c:if test="${not empty sessionScope.FILE_USERS}">
                                            <button class="btn btn-primary px-4" type="submit" name="action" value="AddPeopleShareFile">Add</button>
                                        </c:if>
                                        <c:if test="${not empty sessionScope.FOLDER_USERS}">
                                            <button class="btn btn-primary px-4" type="submit" name="action" value="AddPeopleShareFolder">Add</button>
                                        </c:if>
                                    </form>
                                </c:if>

                                <c:if test="${not empty sessionScope.FILE_USERS}">
                                    <div class="card mb-4">
                                        <div class="card-header font-weight-bold">
                                            <i class="fas fa-table me-1"></i>
                                            People with access
                                        </div>
                                        <div class="card-body">
                                            <table id="datatablesSimple">
                                                <thead>
                                                    <tr>
                                                        <th>User ID</th>
                                                        <th>Full name</th>
                                                        <th>Role</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>User ID</th>
                                                        <th>Full name</th>
                                                        <th>Role</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <c:forEach var="user" varStatus="counter" items="${sessionScope.FILE_USERS}">
                                                        <tr>
                                                            <td>${user.userId}</td>
                                                            <td>${user.fullName}</td>
                                                            <td>${user.role}</td>
                                                            <td>
                                                                <a href="MainController?action=Delete&userID=${user.userId}" class="btn-light" style="border: none; background-color: inherit;"><i class="fa-solid fa-trash-can"></i></a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="MainController?action=Logout">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script>
            document.getElementById("optionSelect").addEventListener("change", function () {
                document.getElementById("optionHidden").value = document.getElementById("optionSelect").value;
            });
        </script>
    </body>

</html>