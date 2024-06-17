import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_project3/secondscreen.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  var nooffields = 4;
  bool cleartext = false;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Otp Screen",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      )),
      body: Column(
        children: [
          OtpTextField(
            showCursor: true,
            numberOfFields: nooffields,
            clearText: cleartext,
            showFieldAsBox: true,
            cursorColor: Colors.black,
            textStyle: theme.textTheme.titleMedium,
            onSubmit: (String verificationcode) {
              // setState(() {
              //   cleartext = false;
              // });
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: const Text("Code verified Successfully"),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Secondscreen()));
                              },
                              child: const Text("Ok"))
                        ]);
                  });
            },
          ),
        ],
      ),
    );
  }
}
