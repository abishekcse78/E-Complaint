import 'package:flutter/material.dart';

import '../pages/qr_scan.dart';

class QRSection extends StatefulWidget {
  const QRSection({Key? key, required this.onPress}) : super(key: key);

  final Function onPress;

  @override
  State<QRSection> createState() => _QRSectionState();
}

class _QRSectionState extends State<QRSection> {
  String machineID = '';
  String qrCode = '';
  late String receivedString;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: qrCode == ''
              ? Padding(
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
                              builder: (context) => const QRScanPage(),
                            ),
                          );
                          setState(
                            () {
                              qrCode = receivedString;
                              machineID = qrCode.trim().substring(14, 18);
                            },
                          );

                          widget.onPress(receivedString);
                        },
                      ),
                    ),
                  ),
                )
              : Column(
                  children: [
                    TextButton(
                      child: const Text(
                        'Scan again',
                      ),
                      onPressed: () async {
                        receivedString = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QRScanPage()));

                        setState(
                          () {
                            qrCode = receivedString;
                            machineID = qrCode.trim().substring(14, 18);
                          },
                        );

                        widget.onPress(receivedString);
                      },
                    ),
                    const Divider(),
                  ],
                ),
        ),
        qrCode == ''
            ? const Text(
                'Open QR Scanner',
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Machine ID',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Text(
                      machineID,
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
