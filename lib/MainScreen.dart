import 'package:path/path.dart';
import 'package:restaurant_order/login.dart';
import 'package:restaurant_order/menuAdd.dart';
import 'package:restaurant_order/menuPayment.dart';

import 'db.dart';
import 'module.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

// 로그인 전 시스템 메인 화면
class _MainScreenState extends State<MainScreen> {
  int? selectedId;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          toolbarHeight: 70,
          // appBar 높이 70
          elevation: 0,
          // 음영 0
          title: InkWell(
              onTap: () {},
              child: Text('5조 레스토랑 시스템메인 화면',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold))),
          actions: [
            // 오른쪽 아이콘 위젯들
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                    ),
                    child: IconButton( // 시스템 관리자 로그인 버튼
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      icon: Icon(Icons.account_circle_rounded,
                          color: Colors.white, size: 30),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height:20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('판매 중인 메뉴 목록',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(
                height:40,
              ),
              FutureBuilder<List<Menu>>(
                future: DatabaseHelper.instance.getGroceries(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Menu>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text('Loading', style:TextStyle(fontSize:23,)),
                    );
                  }
                  return snapshot.data!.isEmpty
                      ? Center(
                    child: Text('판매 중인 상품 목록이 비어있습니다.',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  )
                      : ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: snapshot.data!.map((module) {
                      return Center(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey.shade500,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: selectedId == module.id
                              ? Colors.white70
                              : Colors.white,
                          child: ListTile(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => menuPayment(name: textController.text)));
                              setState(() {
                                if (selectedId == null) {
                                  textController.text = module.name;
                                  selectedId = module.id;
                                } else {
                                  textController.text = module.name;
                                  selectedId = null;
                                }
                              });
                            },
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 16.0),
                            leading: Container(
                              width: 100,
                              height: 600,
                              child: Image.asset('./asset/img/food2.jpeg',
                                  height:200,
                                  fit: BoxFit.fill),
                          ),
                          title: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(module.name, style:TextStyle(fontSize:20, fontWeight:FontWeight.bold)),

                            ],
                          ),
                        ),
                      )
                      ,
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
