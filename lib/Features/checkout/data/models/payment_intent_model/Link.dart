class Link {
  Link({
    this.persistentToken,
  });

  Link.fromJson(dynamic json) {
    persistentToken = json['persistent_token'];
  }
  dynamic persistentToken;
  Link copyWith({
    dynamic persistentToken,
  }) =>
      Link(
        persistentToken: persistentToken ?? this.persistentToken,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['persistent_token'] = persistentToken;
    return map;
  }
}
