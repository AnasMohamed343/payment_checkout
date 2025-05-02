class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String?
      customerId; // make it optional if the guest could make the payment not must be user

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    this.customerId, // the id of the client who will make the payment, should create it when user signing up
  });

  // make toJson method to convert model to json, because i will send it to the api in (post request)
  toJson() {
    //return {'amount': amount, 'currency': currency};
    // i will multiply the amount by 100 to convert it to cents , because stripe works with cents in this currency
    return {
      'amount': (int.parse(amount) * 100).toString(),
      'currency': currency,
      'customer': customerId
    };
  }
}
