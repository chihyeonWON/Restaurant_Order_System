import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'default_payment.dart';

class paymentMethod extends StatefulWidget {

  paymentMethod({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<paymentMethod> createState() => _paymentMethodState();
}

class _paymentMethodState extends State<paymentMethod> {


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
            child: Text('${widget.name} 결제창',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold))),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            children: [
              TextButton(
                  onPressed: () => Get.to(DefaultPayment()),
                  child: const Text('1. PG일반 결제 테스트', style: TextStyle(fontSize: 16.0))
              ),
            ],
          ),
        ),
      ),
    );
  }
}