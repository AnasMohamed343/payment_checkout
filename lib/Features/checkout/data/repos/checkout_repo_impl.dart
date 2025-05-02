import 'package:dartz/dartz.dart';
import 'package:payment_methods/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_methods/Features/checkout/data/repos/checkout_repo.dart';
import 'package:payment_methods/core/errors/failures.dart';
import 'package:payment_methods/core/utils/services/stripe_service.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService;
  CheckoutRepoImpl({required this.stripeService});

  @override
  Future<Either<Failure, void>> makeStripePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makeStripePayment(paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }

  }

}