import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_methods/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_methods/Features/checkout/data/repos/checkout_repo.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkoutRepo) : super(StripePaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future<void> makeStripePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(StripePaymentLoading());
    final result = await checkoutRepo.makeStripePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    result.fold((lift) => emit(StripePaymentError(lift.errorMessage)),
        (right) => emit(StripePaymentSuccess()));
  }

  @override
  void onChange(Change<StripePaymentState> change) {
    log('stripe payment state:  ${change.toString()}');
    super.onChange(change);
  }
}
