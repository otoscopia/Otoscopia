class RemarksEntity {
  final String id;
  final String remarks;
  final String screening;
  final DateTime? followUpDate;

  RemarksEntity({
    required this.id,
    required this.remarks,
    required this.screening,
    this.followUpDate,
  });

  factory RemarksEntity.fromMap(Map<String, dynamic> json) {
    return RemarksEntity(
      id: json['\$id'] as String,
      remarks: json['remarks'] as String,
      screening: json['screening']['\$id'] as String,
      followUpDate: json['followUpDate'] != null
          ? DateTime.parse(json['followUpDate'] as String)
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'remarks': remarks,
      'screening': screening,
      'followUpDate': followUpDate?.toIso8601String(),
    };
  }
}
