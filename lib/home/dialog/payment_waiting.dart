import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rent_app/home/dialog/payment_success.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PaymentWaiting extends StatelessWidget {
  const PaymentWaiting({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    late double sizeHeight = MediaQuery.of(context).size.height;

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animated1, animated2) =>
              const PaymentSuccess(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero));
    });

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
                  children: const [
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
