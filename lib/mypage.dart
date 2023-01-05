import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Width : ' + MediaQuery.of(context).size.width.toString()),
            Text('Height : ' + MediaQuery.of(context).size.height.toString()),
          ],
        ),
      ),
    );
  }
}
