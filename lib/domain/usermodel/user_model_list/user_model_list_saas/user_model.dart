import 'package:json_annotation/json_annotation.dart';
import 'package:techqrmaintance/domain/organizationmodel/organization_model/organization_model/organization.dart';
import 'package:techqrmaintance/domain/servicerequestmodel/services_request_saas/services_model.dart';
import 'package:techqrmaintance/domain/servicerequestmodel/services_request_saas/services_request_saas.dart';
import 'package:techqrmaintance/domain/usermodel/user_model_list/user_model_list_saas/area_model.dart';

part 'user_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class UserModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'org_id')
  int? orgId;
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'area_id')
  int? areaId;
  @JsonKey(name: 'avatar')
  String? avatar;
  @JsonKey(name: 'organization')
  Organization? organization;
  @JsonKey(name: 'area')
  AreaModel? area;
  

  UserModel({
    this.id,
    this.orgId,
    this.role,
    this.fullName,
    this.email,
    this.phone,
    this.areaId,
    this.avatar,
    this.organization,
    this.area,
  });

  UserModel.create({
    this.fullName,
    this.email,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
