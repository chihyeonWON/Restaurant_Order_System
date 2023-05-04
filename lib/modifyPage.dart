import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:restaurant_order/deletePage.dart';
import 'package:restaurant_order/login.dart';
import 'package:restaurant_order/modify.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ModifyPage(),
    );
  }
}

class ModifyPage extends StatefulWidget {
  const ModifyPage({Key? key}) : super(key: key);

  @override
  State<ModifyPage> createState() => _ModifyPageState();
}

class _ModifyPageState extends State<ModifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        toolbarHeight: 70,
        // appBar 높이 70
        elevation: 0,
        // 음영 0
        title: InkWell(
            onTap: () {}, // 주소 설정 페이지로 이동
            child: Text('소프트웨어 공학 5조 레스토랑 시스템메인 화면',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
        // 주소
        actions: [
          // 오른쪽 아이콘 위젯들
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.grid_view,
                  size: 27.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.circle_notifications,
                  size: 27.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  icon: Icon(Icons.account_circle_rounded),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Latest(),
          ],
        ),
      ),
    );
  }
}

class Menu1 extends StatelessWidget {
  const Menu1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {}, // 퓨전탕수육 주문 페이지로 이동
        child: Column(
          children: [
            Container(
              width: 250.0,
              height: 450.0,
              child: Stack(
                children: [
                  Positioned(
                    top: 65.0,
                    left: 20.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Opacity(
                        opacity: 0.9,
                        child: Stack(
                          children: [
                            Image.asset(
                              'asset/img/food2.jpeg',
                              width: 210,
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 270.0,
                    left: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              '후라이드 치킨',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('가격: ',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.grey,
                                )),
                            Text('18,000원',
                                style: TextStyle(
                                  fontSize: 30.0,
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Modify()));
                              },
                              child: Text('수정',
                                  style: TextStyle(
                                    fontSize: 30,
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class Latest extends StatefulWidget {
  const Latest({Key? key}) : super(key: key);

  @override
  State<Latest> createState() => _LatestState();
}

class _LatestState extends State<Latest> {
  List<int> item = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
          width: 1000.0,
          height: 900.0,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('판매 중인 상품',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text('메뉴 등록',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Menu1(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => deletePage()));
                      },
                      child: Text('삭제',
                          style: TextStyle(
                            fontSize: 30,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
