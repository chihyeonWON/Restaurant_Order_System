import 'package:flutter/material.dart';
import 'package:restaurant_order/paymentMethod.dart';

class menuPayment extends StatefulWidget {
  menuPayment({Key? key, required this.name}) : super(key: key);

  final String name;

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
            onTap: () {print(widget.name);},
            child: Text("${widget.name} 주문 페이지",
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
              height:30,
            ),
            Container(
              child: Text('고소하고 담백한 맛의 치킨입니다.', style:TextStyle(fontSize:20,)),
            ),
            SizedBox(
              height:190,
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
                      onPressed: () { // 결제창으로 이동
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => paymentMethod(name: widget.name)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top:10.0, bottom:10.0, right:15, left:15,),
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
