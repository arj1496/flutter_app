import 'dart:core';

class Observation{
  int observationNo;
  String status = "DRAFT";//"COMPLETED","SUBMITTED","LIVE","DRAFT"
  String createdDate;
  String completedDate; // system date when Observation is mark completed
  String completedBy; // name of person who mark completed Observation
  String progress;
  String publishedDate; // system date when Observation is mark published
  String publishedBy;

  Observation({
    this.observationNo,
    this.status,
    this.createdDate,
    this.completedDate,
    this.completedBy,
    this.progress,
    this.publishedDate,
    this.publishedBy
  });

  factory Observation.fromJsonServer(Map<String, dynamic> jsonObject) => Observation(
    observationNo: jsonObject['observationNo'],
    status: jsonObject['status'],
    createdDate: jsonObject['createdDate'],
    completedDate: jsonObject['completedDate'],
    completedBy: jsonObject['completedBy'],
    progress: jsonObject['progress'],
    publishedDate: jsonObject['publishedDate'],
    publishedBy: jsonObject['publishedBy'],
  );

  factory Observation.fromJsonLocal(Map<String, dynamic> jsonObject) => Observation(
    observationNo: jsonObject['observationNo'],
    status: jsonObject['status'],
    createdDate: jsonObject['createdDate'],
    completedDate: jsonObject['completedDate'],
    completedBy: jsonObject['completedBy'],
    progress: jsonObject['progress'],
    publishedDate: jsonObject['publishedDate'],
    publishedBy: jsonObject['publishedBy'],
  );

  Map<String, dynamic> toJson() => {
    'observationNo': observationNo,
    'status': status,
    'createdDate': createdDate,
    'completedDate': completedDate,
    'completedBy': completedBy,
    'progress': progress,
    'publishedDate': publishedDate,
    'publishedBy': publishedBy,
  };
}