import 'package:flutter/material.dart';
import 'package:restaurant_order/ManagementScreen.dart';
import 'package:restaurant_order/main.dart';
import 'package:restaurant_order/MainScreen.dart';

// 관리자 로그인 화면
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>(); // 폼의 상태를 얻기 위한 키

  final _idController = TextEditingController(); // 아이디 컨트롤러 객체
  final _passwordController = TextEditingController(); // 패스워드 컨트롤러 객체

  @override
  void dispose() {
    _idController.dispose(); // 다 사용한 컨트롤러 해제
    _passwordController.dispose(); // 다 사용한 컨트롤러 해제
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('시스템 관리자 로그인 페이지', style:TextStyle(fontSize:23, fontWeight:FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // 키 할당
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    right: 230.0,
                    top: 30,
                    bottom: 30,
                  ),
                  child: Text('Login',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    // 외곽선이 있고 힌트로 '아이디'를 표시
                    border: OutlineInputBorder(),
                    hintText: '시스템 관리자 ID를 입력하세요', // placeholder 아이디
                  ),
                  controller: _idController, // 키 컨트롤러 연결
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return '아이디를 입력해 주세요';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    // 외곽선이 있고 힌트로 '비밀번호'를 표시
                    border: OutlineInputBorder(),
                    hintText: '시스템 관리자 비밀번호를 입력하세요', // placeholder 비밀번호
                  ),
                  controller: _passwordController,
                  keyboardType: TextInputType.number, // 숫자만 입력할 수 있음
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return '비밀번호를 입력하세요';
                    }
                    return null;
                  },
                ),
                Container(
                  // 버튼 여백,배치
                  margin: const EdgeInsets.only(top: 16.0), // 위 쪽에만 16크기의 여백
                  alignment: Alignment.centerRight, // 오른쪽 가운데에 위치
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          _idController.text == "원치현" &&
                          _passwordController.text == "1234") {
                        // 아이디와 비밀번호 값이 검증되었다면 화면 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ManagementScreen()),
                        );
                      }
                    },
                    child: Text('로그인',
                        style: TextStyle(
                          fontSize: 30,
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
