class AmountDetails {
  AmountDetails({
    this.tip,
  });

  AmountDetails.fromJson(dynamic json) {
    tip = json['tip'];
  }
  dynamic tip;
  AmountDetails copyWith({
    dynamic tip,
  }) =>
      AmountDetails(
        tip: tip ?? this.tip,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tip'] = tip;
    return map;
  }
}
