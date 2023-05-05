import 'package:path/path.dart';
import 'package:restaurant_order/login.dart';
import 'package:restaurant_order/menuAdd.dart';

import 'db.dart';
import 'grocery.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? selectedId;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        toolbarHeight: 70,
        // appBar 높이 70
        elevation: 0,
        // 음영 0
        title: InkWell(
            onTap: () {}, // 주소 설정 페이지로 이동
            child: Text('5조 레스토랑 시스템메인 화면',
                style: TextStyle(color:Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold))),
        // 주소
        actions: [
          // 오른쪽 아이콘 위젯들
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Padding(
                  padding:EdgeInsets.only(right:20,),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    icon: Icon(Icons.account_circle_rounded, color:Colors.black, size:30),
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
              height:50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => menuAdd()));
                  },
                  child: Text('메뉴 등록',
                      style: TextStyle(
                        fontSize: 20,
                      ))),
            ),
            SizedBox(
              height:50,
            ),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText:'수정할 메뉴 이름이 여기에 표시됩니다.',
                labelStyle:TextStyle(fontSize:20,)
              ),
            ),
            ElevatedButton(
              child:Text('메뉴 수정하기', style:TextStyle(fontSize:25,)),
              onPressed: () async {
                await DatabaseHelper.instance.update(
                  Grocery(id: selectedId, name: textController.text),
                );
                setState(() {
                  textController.clear();
                  selectedId = null;
                });
              },
            ),
            SizedBox(
              height:50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('판매 중인 메뉴 목록',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            FutureBuilder<List<Grocery>>(
              future: DatabaseHelper.instance.getGroceries(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Grocery>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text('Loading'),
                  );
                }
                return snapshot.data!.isEmpty
                    ? Center(
                        child: Text('판매 중인 상품 목록이 비어있습니다.',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                      )
                    : ListView(
                  shrinkWrap: true,
                        children: snapshot.data!.map((grocery) {
                          return Center(
                            child: Card(
                              color: selectedId == grocery.id
                                  ? Colors.white70
                                  : Colors.white,
                              child: ListTile(
                                onTap: () {
                                  setState(() {
                                    if (selectedId == null) {
                                      textController.text = grocery.name;
                                      selectedId = grocery.id;
                                    } else {
                                      textController.text = '';
                                      selectedId = null;
                                    }
                                  });
                                },
                                leading:Image.asset('./asset/img/food1.jpeg'),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(grocery.name),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          DatabaseHelper.instance
                                              .remove(grocery.id!);
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
    );
  }
}
