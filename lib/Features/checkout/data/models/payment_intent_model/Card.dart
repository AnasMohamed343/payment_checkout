class Card {
  Card({
    this.installments,
    this.mandateOptions,
    this.network,
    this.requestThreeDSecure,
  });

  Card.fromJson(dynamic json) {
    installments = json['installments'];
    mandateOptions = json['mandate_options'];
    network = json['network'];
    requestThreeDSecure = json['request_three_d_secure'];
  }
  dynamic installments;
  dynamic mandateOptions;
  dynamic network;
  String? requestThreeDSecure;
  Card copyWith({
    dynamic installments,
    dynamic mandateOptions,
    dynamic network,
    String? requestThreeDSecure,
  }) =>
      Card(
        installments: installments ?? this.installments,
        mandateOptions: mandateOptions ?? this.mandateOptions,
        network: network ?? this.network,
        requestThreeDSecure: requestThreeDSecure ?? this.requestThreeDSecure,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['installments'] = installments;
    map['mandate_options'] = mandateOptions;
    map['network'] = network;
    map['request_three_d_secure'] = requestThreeDSecure;
    return map;
  }
}
