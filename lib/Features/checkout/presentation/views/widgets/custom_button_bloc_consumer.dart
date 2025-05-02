import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_methods/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_methods/Features/checkout/presentation/manager/stripe_payment_cubit.dart';
import 'package:payment_methods/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment_methods/core/utils/api_keys.dart';
import 'package:payment_methods/core/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (kDebugMode) log("Listener triggered: ${state.runtimeType}");
        if (state is StripePaymentSuccess) {
          Navigator.of(context).pop(); // Close the bottom sheet first
          Navigator.of(context, rootNavigator: true).pushReplacement(
            // Use rootNavigator
            MaterialPageRoute(builder: (context) => const ThankYouView()),
          );
        }

        if (state is StripePaymentError) {
          Navigator.of(context).pop(); // to close the bottom sheet
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          if (kDebugMode) {
            print('error message: ${state.errorMessage}');
          }
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
                    amount: '100',
                    currency: 'USD',
                    customerId: ApiKeys.customerId);
            BlocProvider.of<StripePaymentCubit>(context).makeStripePayment(
                paymentIntentInputModel:
                    paymentIntentInputModel // paymentIntentInputModel is the details of the product payment(amount , currency)
                );
          },
          isLoading: state is StripePaymentLoading ? true : false,
          text: 'Complete Payment',
        );
      },
    );
  }
}
