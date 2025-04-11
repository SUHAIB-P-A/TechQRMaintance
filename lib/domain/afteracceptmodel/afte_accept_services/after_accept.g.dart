// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'after_accept.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AfterAccept _$AfterAcceptFromJson(Map<String, dynamic> json) => AfterAccept(
      id: (json['id'] as num?)?.toInt(),
      orgId: (json['org_id'] as num?)?.toInt(),
      customerId: (json['customer_id'] as num?)?.toInt(),
      deviceId: (json['device_id'] as num?)?.toInt(),
      assignedTechnician: (json['assigned_technician'] as num?)?.toInt(),
      issueDescription: json['issue_description'],
      selectedIssue: (json['selected_issue'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      preferredDate: json['preferred_date'] as String?,
      preferredStartTime: json['preferred_start_time'] as String?,
      preferredEndTime: json['preferred_end_time'] as String?,
      status: json['status'] as String?,
      completionNotes: json['completion_notes'],
      completionPhotoUrl: json['completion_photo_url'],
      newPartsUsed: json['new_parts_used'],
      jobType: json['job_type'] as String?,
      emergency: (json['emergency'] as num?)?.toInt(),
      startedAt: json['started_at'],
      completedAt: json['completed_at'],
    );

Map<String, dynamic> _$AfterAcceptToJson(AfterAccept instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org_id': instance.orgId,
      'customer_id': instance.customerId,
      'device_id': instance.deviceId,
      'assigned_technician': instance.assignedTechnician,
      'issue_description': instance.issueDescription,
      'selected_issue': instance.selectedIssue,
      'preferred_date': instance.preferredDate,
      'preferred_start_time': instance.preferredStartTime,
      'preferred_end_time': instance.preferredEndTime,
      'status': instance.status,
      'completion_notes': instance.completionNotes,
      'completion_photo_url': instance.completionPhotoUrl,
      'new_parts_used': instance.newPartsUsed,
      'job_type': instance.jobType,
      'emergency': instance.emergency,
      'started_at': instance.startedAt,
      'completed_at': instance.completedAt,
    };
