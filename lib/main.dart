import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_methods/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:payment_methods/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment_methods/core/utils/api_keys.dart';

void main() {
  Stripe.publishableKey = ApiKeys.puplishableKey;
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
      routes: {
        '/thank-you': (context) => const ThankYouView(),
      },
      home: MyCartView(),
    );
  }
}

// steps to make payment:
// paymentIntentObject create payment intent (amount , currency, (optional)customerId(if i will save card inf for future) )
// init payment sheet (paymentIntentClientSecret)
// presentPaymentSheet()

// steps to make payment and save card information:
// return paymentIntentModel <- create payment intent (amount , currency, customerId(if i will save card inf for future) )
//return keySecret <- createEphemeralKey(customerID)
// init payment sheet (SetupPaymentSheetParameter(merchantDisplayName, customerEphemeralKey, paymentIntentClientSecret))
// presentPaymentSheet()
