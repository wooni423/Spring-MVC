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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <title>todolist</title>
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
                </div>
            </div>
        </nav>
        <!--<h1>Header</h1>-->

    </div>

    <div class="row content">
        <div class="col">

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Search</h5>
                    <form class="searchForm" action="${pageContext.request.contextPath}/todo/list" method="get">
                        <input type="hidden" name="amount" value="${pageRequestDTO.amount}">
                        <div class="mb-3">
                            <input type="checkbox" name="finished" ${pageRequestDTO.finished ? "checked":""}>완료여부
                        </div>
                        <div class="mb-3">
                            <input type="checkbox" name="types" value="t" ${pageRequestDTO.checkType("t")? "checked":""}>제목
                            <input type="checkbox" name="types" value="w" ${pageRequestDTO.checkType("w")? "checked":""}>작성자
                            <input type="text" name="keyword" value="${pageRequestDTO.keyword}" class="form-control">
                        </div>
                        <div class="input-group mb-3 dueDateDiv">
                            <input type="date" name="from" class="form-control" value="${pageRequestDTO.from}">
                            <input type="date" name="to" class="form-control" value="${pageRequestDTO.to}">
                        </div>
                        <div class="input-group mb-3">
                            <div class="float-end">
                                <button class="btn btn-primary" type="submit">Search</button>
                                <button class="btn btn-info clearBtn" type="reset">Clear</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <script>
                /*초기화 버튼 이벤트*/
                $(".clearBtn").on("click",function (e){
                      e.preventDefault()
                      e.stopPropagation()

                      self.location ='/todo/list'
                })

            </script>

            <div class="card">
                <div class="card-header">
                    Featured
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Tno</th>
                            <th scope="col">Title</th>
                            <th scope="col">Writer</th>
                            <th scope="col">DueDate</th>
                            <th scope="col">finished</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${responseDTO.dtoList}" var="dto">
                            <tr>
                                <th scope="row"><c:out value="${dto.tno}"/></th>
                                <td><a href="/todo/read?tno=${dto.tno}&${pageRequestDTO.link}" class="text-decoration-none" data-tno="${dto.tno}">
                                    <c:out value="${dto.title}"/></a></td>
                                <td><c:out value="${dto.writer}"/></td>
                                <td><c:out value="${dto.dueDate}"/></td>
                                <td><c:out value="${dto.finished}"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <%-- Paging--%>

                    <div class="float-end">
                        <ul class="pagination flex-wrap">
                            <c:if test="${responseDTO.prev}">
                                <li class="page-item">
                                    <a class="page-link" data-num="${responseDTO.start-1}">Previous</a>
                                </li>
                            </c:if>
                            <c:forEach var="num" begin="${responseDTO.start}" end="${responseDTO.end}">
                                <li class="page-item ${responseDTO.pageNum == num ? "active":""} ">
                                    <a class="page-link" data-num="${num}">${num}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${responseDTO.next}">
                                <li class="page-item">
                                    <a class="page-link" data-num="${responseDTO.end+1}">Next</a>
                                </li>
                            </c:if>
                        </ul>

                        <%--페이징 처리 이벤트 --%>
                        <script>

                            $(".pagination").on("click", function (e) {
                                console.log("click event")
                                e.preventDefault()
                                e.stopPropagation()

                                const target = e.target

                                if (target.tagName !== 'A') {
                                    return
                                }
                                const num = target.getAttribute("data-num")
                                console.log(num)

                                const formObj = document.querySelector(".searchForm")
                                console.log(formObj)
                                formObj.innerHTML +=`<input type='hidden' name='pageNum' value='\${num}'>`

                                formObj.submit();
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






