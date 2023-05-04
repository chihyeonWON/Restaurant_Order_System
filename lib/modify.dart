import 'package:flutter/material.dart';
import 'package:restaurant_order/main.dart';
import 'package:restaurant_order/modifyPage.dart';

// 첫 번째 페이지
class Modify extends StatefulWidget {
  @override
  _ModifyState createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
  final _formKey = GlobalKey<FormState>(); // 폼의 상태를 얻기 위한 키

  final _heightController = TextEditingController(); // 키 컨트롤러 객체
  final _weightContoller = TextEditingController(); // 몸무게 컨트롤러 객체

  @override
  void dispose() {
    _heightController.dispose(); // 다 사용한 컨트롤러 해제
    _weightContoller.dispose(); // 다 사용한 컨트롤러 해제
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메뉴 수정 페이지'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // 키 할당
          child: Column(
              children: <Widget>[
          TextFormField(
          decoration: InputDecoration(
              // 외곽선이 있고 힌트로 '아이디'를 표시
              border: OutlineInputBorder(),
          hintText: '수정할 메뉴의 이름을 입력하세요', // placeholder 아이디
        ),
        controller: _heightController, // 키 컨트롤러 연결
        validator: (value) {
          if (value!.trim().isEmpty) {
            return '메뉴이름을 입력하세요';
          }
          return null;
        },
      ),
      SizedBox(
        height: 16.0,
      ),
      TextFormField(
        decoration: InputDecoration(
          // 외곽선이 있고 힌트로 '가격'를 표시
          border: OutlineInputBorder(),
          hintText: '수정할 가격을 입력하세요', // placeholder 비밀번호
        ),
        controller: _weightContoller,
        keyboardType: TextInputType.number, // 숫자만 입력할 수 있음
        validator: (value) {
          if (value!.trim().isEmpty) {
            return '수정할 가격을ㄴㅇ 입력하세요';
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
              if (_formKey.currentState!.validate()) {
                // 키와 몸무게 값이 검증되었다면 화면 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModifyPage()),
                );
              }
            },
            child:Center(
              child: Text('수정하기',
                  style: TextStyle(
                    fontSize: 30,
                  )),
            )),
      ),
    ],
    ),
    ),
    ),
    );
    }
}
