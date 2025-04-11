import 'package:json_annotation/json_annotation.dart';

import 'areasaas.dart';

part 'area_model.g.dart';

@JsonSerializable()
class AreaModelList {
  @JsonKey(name: 'data')
  List<AreaModelSaas>? data;

  AreaModelList({this.data = const []});

  factory AreaModelList.fromJson(Map<String, dynamic> json) {
    return _$AreaModelListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AreaModelListToJson(this);
}
