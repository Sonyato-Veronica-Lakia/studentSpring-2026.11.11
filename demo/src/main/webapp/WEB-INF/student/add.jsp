<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>학생 추가</title>
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
        <!-- <script src="/js/page-change.js"></script> -->
        <style>
            #app {
                width: 800px;
                margin: 30px auto;
                margin-bottom: 300px;
            }

            table,
            tr,
            td,
            th {
                border: 1px solid black;
                border-collapse: collapse;
                padding: 10px 15px;
                text-align: center;
            }

            th {
                background-color: beige;
                width: 20%;
                font-weight: bold;
            }

            td {
                text-align: left;
            }

            td input {
                width: 95%;
                height: 30px;
                padding: 0 5px;
                box-sizing: border-box;
            }

            .contents {
                width: 750px;
            }

            table {
                width: 100%;
            }

            .btn-area {
                text-align: center;
                margin-top: 20px;
            }

            .btn-area button {
                height: 35px;
                width: 110px;
                margin: 5px;
                background-color: rgb(186, 236, 237);
                border: 1px solid rgb(106, 187, 188);
                box-shadow: 2px 2px 2px black;
                cursor: pointer;
                border-radius: 5px;
                font-weight: bold;
            }
        </style>
    </head>

    <body>
        <div id="app">
            <div class="contents">
                <h2>신규 학생 등록</h2>
                <hr style="margin-bottom: 20px;">

                <table>
                    <tr>
                        <th>학번</th>
                        <td>
                            <input type="text" v-model="stuNo" placeholder="학번을 입력하세요 (예: 9811)">
                        </td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>
                            <input type="text" v-model="stuName" placeholder="이름을 입력하세요">
                        </td>
                    </tr>
                    <tr>
                        <th>학년</th>
                        <td>
                            <input type="text" v-model="grade" placeholder="학년을 입력하세요 (예: 1)">
                        </td>
                    </tr>
                    <tr>
                        <th>주민번호</th>
                        <td>
                            <input type="text" v-model="jumin" placeholder="주민등록번호 13자리를 하이픈 없이 입력하세요">
                        </td>
                    </tr>
                    <tr>
                        <th>아이디</th>
                        <td>
                            <input type="text" v-model="stuId" placeholder="아이디를 입력하세요">
                        </td>
                    </tr>
                </table>

                <div class="btn-area">
                    <button type="button" @click="fnAdd">추가</button>
                    <button type="button" @click="fnBack">되돌아가기</button>
                </div>
            </div>
        </div>
    </body>

    </html>

    <script>
        const app = Vue.createApp({
            data() {
                return {
                    stuNo: "9999",
                    stuName: "테스트",
                    grade: "1",
                    jumin: "990101-1234567",
                    stuId: "test"
                };
            },
            methods: {
                fnAdd: function () {
                    let self = this;

                    if (self.stuNo.trim() === "") { alert("학번을 입력해주세요."); return; }
                    if (self.stuName.trim() === "") { alert("이름을 입력해주세요."); return; }
                    if (self.grade.trim() === "") { alert("학년을 입력해주세요."); return; }
                    if (self.jumin.trim() === "") { alert("주민번호를 입력해주세요."); return; }
                    if (self.stuId.trim() === "") { alert("아이디를 입력해주세요."); return; }
                    
                    let param = {
                        stuNo: self.stuNo,
                        name: self.stuName,
                        grade: self.grade,
                        jumin: self.jumin.replace(/-/g, "").trim(),
                        stuId: self.stuId
                    };

                    $.ajax({
                        url: "http://localhost:8081/student/add.dox",
                        dataType: "json",
                        type: "POST",
                        data: param,
                        success: function (data) {
                            if (data.result === "success") {
                                alert("성공적으로 등록되었습니다.");
                                self.fnBack();
                            } else {
                                alert("학생 등록에 실패했습니다.");
                            }
                        },
                        error: function (err) {
                            alert("서버 통신 중 오류가 발생했습니다.");
                            console.log(err);
                        }
                    });
                },
                fnBack: function () {
                    location.href = "http://localhost:8081/student/list.do";
                }
            }
        });

        app.mount('#app');
    </script>