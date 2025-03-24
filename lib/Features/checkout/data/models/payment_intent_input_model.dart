class PaymentIntentInputModel {
  final String amount;
  final String currency;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
  });

  // make toJson method to convert model to json, because i will send it to the api in (post request)
  toJson() {
    return {'amount': amount, 'currency': currency};
  }
}
