import 'dart:async';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:rent_app/home/dialog/payment_success.dart';

class PaymentWaiting extends StatefulWidget {
  const PaymentWaiting({Key? key}) : super(key: key);

  @override
  State<PaymentWaiting> createState() => _PaymentWaitingState();
}

class _PaymentWaitingState extends State<PaymentWaiting> {
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animated1, animated2) =>
                  const PaymentSucces(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late double sizeHeight = MediaQuery.of(context).size.height;
    late double sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Column(
      children: [
        Container(
          height: sizeHeight * 0.07,
          color: Colors.amber,
        ),
        Container(
          height: 40,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(70),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCircle(
              size: 120,
              color: Colors.amber,
              duration: Duration(seconds: 3),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'TRANSACTION IN PROGRESS',
              style: TextStyle(fontSize: 16),
            )
          ],
        ))
      ],
    ));
  }
}
