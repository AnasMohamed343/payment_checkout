import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_methods/Features/checkout/presentation/views/payment_details.dart';
import 'package:payment_methods/Features/checkout/presentation/views/payment_details_view_body.dart';
import 'package:payment_methods/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment_methods/Features/checkout/presentation/views/widgets/card_info_widget.dart';
import 'package:payment_methods/Features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:payment_methods/Features/checkout/presentation/views/widgets/payment_methods_buttom_sheet.dart';
import 'package:payment_methods/Features/checkout/presentation/views/widgets/thank_you_card.dart';
import 'package:payment_methods/Features/checkout/presentation/views/widgets/total_price_widget.dart';

import '../../../../core/widgets/custom_button.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset('assets/images/basket_image.png')),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: r'42.97$',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: r'0$',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: r'8$',
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(title: 'Total', value: r'$50.97'),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            text: 'Complete Payment',
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return const PaymentDetailsView();
              // }));

              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  builder: (context) {
                    return const PaymentMethodsBottomSheet();
                  });
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
