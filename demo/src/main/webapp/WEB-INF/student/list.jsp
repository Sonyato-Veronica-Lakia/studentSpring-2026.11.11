<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
        <script src="/js/page-change.js"></script>
        <style>
            #app {
                width: 800px;
                margin: 30px auto;
                margin-bottom: 300px;
            }

            table {
                width: 750px;
            }

            table,
            tr,
            td,
            th {
                border: 1px solid black;
                border-collapse: collapse;
                padding: 5px 10px;
                text-align: center;
            }

            th {
                background-color: beige;
            }

            tr:nth-child(even) {
                background-color: azure;
            }

            #paging {
                text-align: center;
                margin-top: 15px;
            }

            #paging a {
                margin-right: 6px;
                font-size: 20px;
                text-decoration: none;
                color: gray;
                cursor: pointer;
            }

            #paging .active {
                font-weight: bold;
                color: black;
            }

            .table select {
                margin-bottom: 10px;
                width: 80px;
                text-align: center;
            }

            .search {
                text-align: center;
                margin-bottom: 15px;
            }

            .search input {
                height: 25px;
            }

            .btn-area {
                text-align: center;
                margin-top: 15px;
            }

            .btn-area button {
                height: 30px;
                width: 100px;
                margin: 5px;
                background-color: rgb(186, 236, 237);
                border: 1px solid rgb(106, 187, 188);
                box-shadow: 2px 2px 2px black;
                cursor: pointer;
                border-radius: 5px;
            }
        </style>
    </head>

    <body>
        <div id="app">
            <!-- html 코드는 id가 app인 태그 안에서 작업 -->
            <div class="table">
                <table>
                    <tr>
                        <th>학번</th>
                        <th>이름</th>
                        <th>학년</th>
                        <th>성별</th>
                        <th>학과</th>
                    </tr>
                    <tr v-for="item in list">
                        <td>{{item.stuNo}}</td>
                        <td>{{item.name}}</td>
                        <td>{{item.grade}}</td>
                        <td>{{item.gender}}</td>
                        <td>{{item.dName}}</td>
                    </tr>
                </table>
            </div>
            <div class="btn-area">
                <button type="button" @click="fnMoveAdd">학생 추가</button>
            </div>
        </div>
    </body>

    </html>

    <script>
        const app = Vue.createApp({
            data() {
                return {
                    // 변수 - (key : value)
                    list: [],
                };
            },
            methods: {
                // 함수(메소드) - (key : function())
                fnList: function () {
                    let self = this;
                    let param = {};
                    $.ajax({
                        url: "http://localhost:8081/student/list.dox",
                        dataType: "json",
                        type: "POST",
                        data: param,
                        success: function (data) {
                            console.log(data);
                            self.list = data.stuList;

                        }
                    });
                },

                fnMoveAdd: function () {
                    location.href = "http://localhost:8081/student/add.do";
                }
            }, // methods
            mounted() {
                // 처음 시작할 때 실행되는 부분
                let self = this;
                self.fnList();
            }
        });

        app.mount('#app');
    </script>