// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'afte_accept_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AfteAcceptServices _$AfteAcceptServicesFromJson(Map<String, dynamic> json) =>
    AfteAcceptServices(
      data: json['data'] == null
          ? null
          : AfterAccept.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AfteAcceptServicesToJson(AfteAcceptServices instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
