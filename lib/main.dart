import 'package:flutter/material.dart';

import 'main_page.dart';

void main() => runApp(Ecomplaint());

class Ecomplaint extends StatefulWidget {
  const Ecomplaint({Key? key}) : super(key: key);

  @override
  _EcomplaintState createState() => _EcomplaintState();
}

class _EcomplaintState extends State<Ecomplaint> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('E-Smart Complaints'),
          elevation: 0,
        ),
        body: MainPage(),
      ),
    );
  }
}
