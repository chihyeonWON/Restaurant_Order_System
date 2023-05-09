import 'package:flutter/material.dart';

class menuPayment extends StatefulWidget {
  const menuPayment({Key? key}) : super(key: key);

  @override
  State<menuPayment> createState() => _menuPaymentState();
}

class _menuPaymentState extends State<menuPayment> {
  int? selectedId;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 70,
        // appBar 높이 70
        elevation: 0,
        // 음영 0
        title: InkWell(
            onTap: () {},
            child: Text(textController.text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Image.asset('./asset/img/food2.jpeg',
                      height: 200, fit: BoxFit.cover),
                ),
              ],
            ),
            SizedBox(
              height:20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '가격',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '21,000원',
                    style:TextStyle(fontSize:30, fontWeight:FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height:250,
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Container( // 결제 창 이동
                child:Row(
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(right:15.0),
                      child: Column(
                        children: [
                          Text('배달최소금액', style:TextStyle(fontSize:20.0,color: Colors.grey[600])),
                          Text('11,000원', style:TextStyle(fontSize:20.0,)),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed:() { }, // 결제 창으로 이동
                      child: Padding(
                        padding: const EdgeInsets.only(top:10.0, bottom:10.0, right:20, left:20,),
                        child: Text('21,000원 담기', style:TextStyle(fontSize:30,)),
                      ),
                    )
                  ]
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
