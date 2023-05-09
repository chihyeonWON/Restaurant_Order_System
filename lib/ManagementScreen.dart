import 'package:path/path.dart';
import 'package:restaurant_order/MainScreen.dart';
import 'package:restaurant_order/login.dart';
import 'package:restaurant_order/menuAdd.dart';

import 'db.dart';
import 'module.dart';
import 'package:flutter/material.dart';

// 관리자 로그인 후 시스템 메인 화면
class ManagementScreen extends StatefulWidget {
  @override
  _ManagementScreenState createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
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
              child: Text('5조 레스토랑 시스템 관리자 화면',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
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
                    child: IconButton(
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
                height: 40,
              ),
              ElevatedButton(
                // 로그아웃 버튼
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
                child: Text('로그아웃',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              TextField(
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                controller: textController,
                decoration: InputDecoration(
                    labelText: '수정할 메뉴 이름이 여기에 표시됩니다.',
                    labelStyle: TextStyle(
                      fontSize: 25,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: Text('메뉴 수정하기',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: () async {
                  await DatabaseHelper.instance.update(
                    Menu(id: selectedId, name: textController.text),
                  );
                  setState(() {
                    textController.clear();
                    selectedId = null;
                  });
                  FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
                },
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                            MaterialPageRoute(builder: (context) => menuAdd()))
                        .then((value) {
                      setState(() {});
                    });
                  },
                  child: Text('메뉴 등록하기',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ))),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('판매 중인 메뉴 목록',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              FutureBuilder<List<Menu>>(
                future: DatabaseHelper.instance.getGroceries(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Menu>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text('Loading',
                          style: TextStyle(
                            fontSize: 23,
                          )),
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
                          children: snapshot.data!.map((menu) {
                            return Center(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.grey.shade500,
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: selectedId == menu.id
                                    ? Colors.white70
                                    : Colors.white,
                                child: ListTile(
                                  onTap: () {
                                    setState(() {
                                      if (selectedId == null) {
                                        textController.text = menu.name;
                                        selectedId = menu.id;
                                      } else {
                                        textController.text = '';
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
                                        height: 200, fit: BoxFit.fill),
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(menu.name,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      IconButton(
                                        icon: Icon(Icons.delete, size: 30),
                                        onPressed: () {
                                          setState(() {
                                            DatabaseHelper.instance
                                                .remove(menu.id!);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
