// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:payment_methods/core/utils/styles.dart';
//
// class CustomButton extends StatelessWidget {
//   const CustomButton({
//     super.key,
//     this.onTap,
//     required this.text,
//     this.isLoading = false,
//   });
//
//   final void Function()? onTap;
//
//   final String text;
//   final bool isLoading;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         height: 60,
//         decoration: ShapeDecoration(
//           color: const Color(0xFF34A853),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//         ),
//         child: Center(
//           child: isLoading
//               ? const CircularProgressIndicator()
//               : Text(
//                   text,
//                   textAlign: TextAlign.center,
//                   style: Styles.style22,
//                 ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/styles.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/master_card.svg'),
            const SizedBox(
              width: 23,
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: 'Credit Card\n',
                  style: Styles.style20,
                ),
                TextSpan(
                  text: 'Mastercard **34',
                  style: Styles.style20,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
