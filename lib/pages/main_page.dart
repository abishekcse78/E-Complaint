import 'package:e_complaint/components/dropdown.dart';
import 'package:e_complaint/components/qr_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/text_title.dart';
import '../components/textfield_content.dart';

_makingPhoneCall() async {
  const url = 'tel:6374274980';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _selectedError = 'Select Error Code';
  String _qrCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'COMPLAINT DETAILS',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            const TextTitle(label: 'QR Code'),
            QRSection(
              onPress: (receivedString) async {
                String newQR = await receivedString;
                setState(
                  () {
                    _qrCode = newQR;
                  },
                );
              },
              //rqCode = newQR;
            ),
            const Divider(),
            const TextTitle(label: 'Error Code'),
            CustomDropdown(
              onChange: (value) {
                setState(() {
                  _selectedError = value;
                });
              },
              selectedError: _selectedError,
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            const TextTitle(label: 'Name'),
            const TextFieldContent(hint: 'User Name'),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            const TextTitle(label: 'Phone No'),
            const TextFieldContent(hint: 'Phone Number'),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            const TextTitle(label: 'Comments'),
            const TextFieldContent(hint: 'Optional'),
            const Divider(),
            ElevatedButton(
              style: const ButtonStyle(),
              onPressed: () {},
              child: const Text('SUBMIT COMPLAINT'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Click below to call E Smart Systems',
              style: TextStyle(color: Colors.blue),
              textAlign: TextAlign.left,
            ),
            const TextButton(
              /*style: TextButton.styleFrom(
                padding: const EdgeInsets.all(10.0),
                backgroundColor: Colors.red,
              ),*/
              style: ButtonStyle(
                alignment: Alignment.centerLeft,
              ),
              onPressed: _makingPhoneCall,
              child: Text(
                '+91 6374274980',
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
