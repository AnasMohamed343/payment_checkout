import 'package:payment_methods/Features/checkout/data/models/payment_intent_model/Card.dart';

import 'Link.dart';

class PaymentMethodOptions {
  PaymentMethodOptions({
    this.card,
    this.link,
  });

  PaymentMethodOptions.fromJson(dynamic json) {
    card = json['card'] != null ? Card.fromJson(json['card']) : null;
    link = json['link'] != null ? Link.fromJson(json['link']) : null;
  }
  Card? card;
  Link? link;
  PaymentMethodOptions copyWith({
    Card? card,
    Link? link,
  }) =>
      PaymentMethodOptions(
        card: card ?? this.card,
        link: link ?? this.link,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (card != null) {
      map['card'] = card?.toJson();
    }
    if (link != null) {
      map['link'] = link?.toJson();
    }
    return map;
  }
}
