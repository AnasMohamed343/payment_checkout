import 'package:flutter/material.dart';
import 'package:payment_methods/Features/checkout/presentation/views/thank_you_view_body.dart';
import 'package:payment_methods/core/widgets/custom_app_bar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate(
          //to move the widget on the y(vertical) axis or x(horizontal) axis
          offset: const Offset(0, -16),
          child: const ThankYouViewBody()),
    );
  }
}
