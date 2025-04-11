import 'package:json_annotation/json_annotation.dart';

part 'after_accept.g.dart';

@JsonSerializable()
class AfterAccept {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'org_id')
  int? orgId;
  @JsonKey(name: 'customer_id')
  int? customerId;
  @JsonKey(name: 'device_id')
  int? deviceId;
  @JsonKey(name: 'assigned_technician')
  int? assignedTechnician;
  @JsonKey(name: 'issue_description')
  dynamic issueDescription;
  @JsonKey(name: 'selected_issue')
  List<String>? selectedIssue;
  @JsonKey(name: 'preferred_date')
  String? preferredDate;
  @JsonKey(name: 'preferred_start_time')
  String? preferredStartTime;
  @JsonKey(name: 'preferred_end_time')
  String? preferredEndTime;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'completion_notes')
  dynamic completionNotes;
  @JsonKey(name: 'completion_photo_url')
  dynamic completionPhotoUrl;
  @JsonKey(name: 'new_parts_used')
  dynamic newPartsUsed;
  @JsonKey(name: 'job_type')
  String? jobType;
  int? emergency;
  @JsonKey(name: 'started_at')
  dynamic startedAt;
  @JsonKey(name: 'completed_at')
  dynamic completedAt;
  
  

  AfterAccept({
    this.id,
    this.orgId,
    this.customerId,
    this.deviceId,
    this.assignedTechnician,
    this.issueDescription,
    this.selectedIssue,
    this.preferredDate,
    this.preferredStartTime,
    this.preferredEndTime,
    this.status,
    this.completionNotes,
    this.completionPhotoUrl,
    this.newPartsUsed,
    this.jobType,
    this.emergency,
    this.startedAt,
    this.completedAt,
  });

  factory AfterAccept.fromJson(Map<String, dynamic> json) => _$AfterAcceptFromJson(json);

  Map<String, dynamic> toJson() => _$AfterAcceptToJson(this);
}
