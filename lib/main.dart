import 'package:flutter/material.dart';
import 'package:payment_methods/Features/checkout/presentation/views/my_cart_view.dart';

void main() {
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyCartView(),
    );
  }
}

// paymentIntentObject create payment intent (amount , currency )
// init payment sheet (paymentIntentClientSecret)
// presentPaymentSheet()
