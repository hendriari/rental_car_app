import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:rent_app/home/home_page.dart';

class PaymentSucces extends StatefulWidget {
  const PaymentSucces({Key? key}) : super(key: key);

  @override
  State<PaymentSucces> createState() => _PaymentSuccesState();
}

class _PaymentSuccesState extends State<PaymentSucces> {
  late double sizeHeight = MediaQuery.of(context).size.height;
  late double sizeWidth = MediaQuery.of(context).size.width;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 2500), () {
      //push and delete the preveious route
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (Route<dynamic> route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
                height: 100,
                width: 100,
                child: Lottie.asset('images/payment/successAnimation.json')),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'TRANSACTION SUCCESS',
              style: TextStyle(fontSize: 16),
            )
          ],
        ))
      ],
    ));
  }
}
