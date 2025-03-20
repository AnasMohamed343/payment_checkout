import 'package:flutter/material.dart';
import 'package:payment_methods/Features/checkout/presentation/views/payment_details_view_body.dart';
import 'package:payment_methods/core/widgets/custom_app_bar.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Payment Details'),
      body: PaymentDetailsViewBody(),
    );
  }
}
