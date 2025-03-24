class AutomaticPaymentMethods {
  AutomaticPaymentMethods({
    this.enabled,
  });

  AutomaticPaymentMethods.fromJson(dynamic json) {
    enabled = json['enabled'];
  }
  bool? enabled;
  AutomaticPaymentMethods copyWith({
    bool? enabled,
  }) =>
      AutomaticPaymentMethods(
        enabled: enabled ?? this.enabled,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enabled'] = enabled;
    return map;
  }
}
