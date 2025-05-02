import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_methods/Features/checkout/data/models/ephemeral_key_model/EphemeralKeyModel.dart';
import 'package:payment_methods/Features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:payment_methods/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_methods/Features/checkout/data/models/payment_intent_model/Payment_intent_model.dart';
import 'package:payment_methods/core/utils/api_keys.dart';
import 'package:payment_methods/core/utils/services/api_service.dart';

class StripeService {
  //
  // static final StripeService _instance = StripeService._internal();
  //
  // factory StripeService() {
  //   return _instance;
  // }
  //
  // StripeService._internal();
  final ApiService apiService = ApiService();

  // steps to make payment:

  // step 1)
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      //contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey, //secret key that in my account stripe dashboard
    ); //application/json

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  // Future <void> confirmPaymentIntent(String paymentIntentId) async {
  //   var response = await apiService.post(
  //     body: {'payment_intent': paymentIntentId},
  //     url: 'https://api.stripe.com/v1/payment_intents/$paymentIntentId/confirm',
  //     token: ApiKeys.secretKey, //secret key that in my account stripe dashboard
  //   ); //application/json
  //   if (response.statusCode == 200) {
  //     print('confirmPaymentIntent success');
  //   } else {
  //     print('confirmPaymentIntent failed');
  //   }
  // }

  // step 2)
  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      // don't forgot to put await here to wait for the function to be finished then navigate to the next function
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret:
            initPaymentSheetInputModel.paymentIntentClientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.customerEphemeralKeySecret,
        customerId: initPaymentSheetInputModel
            .customerId, // to show the saved cards for the customer
        style: ThemeMode.dark,
        merchantDisplayName:
            "owner's business name", //the name of business(the owner's business) that selling his products
      ),
    );
  }

  //step 3)
  Future displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      await Stripe.instance.confirmPaymentSheetPayment();
    }
  }

  Future makeStripePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    // call this function to make the last three steps to make the payment
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var customerEphemeralKeyModel = await createEphemeralKey(
        customerID: paymentIntentInputModel.customerId ?? '');

    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId ?? '',
      customerEphemeralKeySecret: customerEphemeralKeyModel.secret!,
    );

    await initPaymentSheet(
        initPaymentSheetInputModel:
            initPaymentSheetInputModel); // must make this > await, unless if i didn't wait to something from it to return, because i will make another function after this , and must this finished before the second function begins
    await displayPaymentSheet();
  }

  // // create customer if i will save card inf for future, and show the saved cards for the customer
  // Future<String> createCustomer() async {
  //   var response = await apiService.post(
  //       body: {
  //         'name': 'anas',
  //       },
  //       url: 'https://api.stripe.com/v1/customers',
  //       token: ApiKeys
  //           .secretKey, // not must pass it here because i already pass it in 'Authorization'
  //       headers: {
  //         'Authorization': 'Bearer ${ApiKeys.secretKey}',
  //       });
  //   return response.data['id'];
  // }

  // create ephemeral key, to use it to save card information for future payments
  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerID}) async {
    var response = await apiService.post(
        body: {'customer': customerID},
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys
            .secretKey, // not must pass it here because i already pass it in 'Authorization'
        headers: {
          //'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Stripe-Version': '2025-02-24.acacia'
        });

    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }
}
