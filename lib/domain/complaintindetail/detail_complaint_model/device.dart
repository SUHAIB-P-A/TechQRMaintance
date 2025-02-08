import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';

@JsonSerializable()
class Device {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'qr_code')
  String? qrCode;
  @JsonKey(name: 'brand')
  String? brand;
  @JsonKey(name: 'model')
  String? model;
  @JsonKey(name: 'location')
  String? location;
  @JsonKey(name: 'warranty_expiry')
  String? warrantyExpiry;
  @JsonKey(name: 'invoice_details')
  String? invoiceDetails;
  @JsonKey(name: 'registered_by')
  int? registeredBy;
  @JsonKey(name: 'registered_at')
  String? registeredAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  Device({
    this.id,
    this.qrCode,
    this.brand,
    this.model,
    this.location,
    this.warrantyExpiry,
    this.invoiceDetails,
    this.registeredBy,
    this.registeredAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return _$DeviceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}
