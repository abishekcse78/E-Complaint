import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

import 'text_title.dart';
import 'textfield_content.dart';

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
  String dropdownValue = 'select error code';

  @override
  Widget build(BuildContext context) {
    var _onQRViewCreated;
    var qrKey;
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
            const Text(
              'QR Code',
              style: TextStyle(color: Colors.blue),
              textAlign: TextAlign.left,
            ),
            Center(
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            const Divider(),
            const TextTitle(label: 'Error Code'),
            DropdownButton(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['select error code', 'E1', 'E2', 'E3', 'E4', 'E5']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
