import 'package:json_annotation/json_annotation.dart';

import 'after_accept.dart';

part 'afte_accept_services.g.dart';

@JsonSerializable()
class AfteAcceptServices {
  @JsonKey(name: 'data')
  AfterAccept? data;

  AfteAcceptServices({ this.data});

  factory AfteAcceptServices.fromJson(Map<String, dynamic> json) {
    return _$AfteAcceptServicesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AfteAcceptServicesToJson(this);
}
