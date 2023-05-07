import 'package:path/path.dart';
import 'package:restaurant_order/MainScreen.dart';

import 'db.dart';
import 'module.dart';
import 'package:flutter/material.dart';

class menuAdd extends StatefulWidget {
  @override
  _menuAddState createState() => _menuAddState();
}

class _menuAddState extends State<menuAdd> {
  int? selectedId;
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('신규 메뉴 등록 페이지'),
      ),
      backgroundColor: Colors.white,
      body: TextField(
        style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          controller: textController,
          decoration: InputDecoration(
            labelText:'등록할 메뉴의 이름을 입력해주세요',
            labelStyle:TextStyle(fontSize:25,),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          selectedId != null
              ? await DatabaseHelper.instance.update(
            Module(id: selectedId, name: textController.text),
          )
              : await DatabaseHelper.instance.add(
            Module(name: textController.text),
          );
          Navigator.pop(context, true);
          setState(() {
            textController.clear();
            selectedId = null;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

