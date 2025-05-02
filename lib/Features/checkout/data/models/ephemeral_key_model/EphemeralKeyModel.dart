import 'AssociatedObjects.dart';

class EphemeralKeyModel {
  EphemeralKeyModel({
    this.id,
    this.object,
    this.associatedObjects,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  EphemeralKeyModel.fromJson(dynamic json) {
    id = json['id'];
    object = json['object'];
    if (json['associated_objects'] != null) {
      associatedObjects = [];
      json['associated_objects'].forEach((v) {
        associatedObjects?.add(AssociatedObjects.fromJson(v));
      });
    }
    created = json['created'];
    expires = json['expires'];
    livemode = json['livemode'];
    secret = json['secret'];
  }
  String? id;
  String? object;
  List<AssociatedObjects>? associatedObjects;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;
  EphemeralKeyModel copyWith({
    String? id,
    String? object,
    List<AssociatedObjects>? associatedObjects,
    int? created,
    int? expires,
    bool? livemode,
    String? secret,
  }) =>
      EphemeralKeyModel(
        id: id ?? this.id,
        object: object ?? this.object,
        associatedObjects: associatedObjects ?? this.associatedObjects,
        created: created ?? this.created,
        expires: expires ?? this.expires,
        livemode: livemode ?? this.livemode,
        secret: secret ?? this.secret,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['object'] = object;
    if (associatedObjects != null) {
      map['associated_objects'] =
          associatedObjects?.map((v) => v.toJson()).toList();
    }
    map['created'] = created;
    map['expires'] = expires;
    map['livemode'] = livemode;
    map['secret'] = secret;
    return map;
  }
}
