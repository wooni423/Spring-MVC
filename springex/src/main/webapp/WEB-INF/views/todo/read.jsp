<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--Bootstrap css-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <%--JQUERY--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <title>Bootstrap demo</title>
</head>
<body>


<div class="container-fluid">
    <div class="row">
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                               aria-expanded="false">
                                Dropdown
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled">Disabled</a>
                        </li>
                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
        <!--<h1>Header</h1>-->

    </div>

    <div class="row content">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    Featured
                </div>
                <div class="card-body">

                    <div class="input-group mb-3">
                        <span class="input-group-text">Tno</span>
                        <div class="form-floating">
                            <input type="text" name="tno" class="form-control"
                                   value='<c:out value="${dto.tno}"/>' readonly/>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Title</span>
                        <div class="form-floating">
                            <input type="text" name="title" class="form-control"
                                   value='<c:out value="${dto.title}"/>' redonly/>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">DueDate</span>
                        <div class="form-floating">
                            <input type="date" name="dueDate" class="form-control"
                                   value='<c:out value="${dto.dueDate}"/>' readonly/>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Writer</span>
                        <div class="form-floating">
                            <input type="text" name="writer" class="form-control"
                                   value='<c:out value="${dto.writer}"/>' readonly/>
                        </div>
                    </div>
                    <div class="form-check">
                        <label class="form-check-label">
                            Finished &nbsp;
                        </label>
                        <input class="form-check-input" type="checkbox" name="finished"
                        ${dto.finished?"checked":""} disabled>
                    </div>
                    <div class="my-4">
                        <div class="float-end">
                            <button type="button" class="btn btn-primary">수정</button>
                            <button type="button" class="btn btn-secondary">목록</button>
                        </div>
                    </div>

                    <script>

                        //수정 페이지로 이동하는 이벤트 처리
                        $('.btn-primary').on('click',function (){
                            self.location=`/todo/modify?tno=${dto.tno}&${pageRequestDTO.link}`
                        })

                        // 목록 페이지로 이동하는 이벤트 처리
                        $('.btn-secondary').on('click',function (){
                            self.location="/todo/list?${pageRequestDTO.link}"
                        })

                    </script>
                </div>
            </div>
        </div>
    </div>

    <div class="row content">
        <h1>Content</h1>
    </div>


    <div class="row footer">
        <!--<h1>Footer</h1>-->
        <div class="row fixed-bottom" style="z-index: -100">
            <footer class="py-1 my-1">
                <p class="text-center text-muted">Footer</p>
            </footer>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>






