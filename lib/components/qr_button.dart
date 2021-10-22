import 'package:flutter/material.dart';

import 'pages/qr_scan.dart';

class QRButton extends StatelessWidget {
  const QRButton({Key? key, required this.onPress}) : super(key: key);

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 150,
          height: 150,
          child: Expanded(
            child: TextButton(
              child: const Image(
                image: AssetImage('images/qrcode.png'),
                fit: BoxFit.fill,
              ),
              onPressed: () async {
                var receivedString = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QRScanPage()));
                onPress(receivedString);
              },
            ),
          ),
        ),
      ),
    );
  }
}
