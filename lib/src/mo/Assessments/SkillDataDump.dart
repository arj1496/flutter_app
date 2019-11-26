import 'dart:core';
import 'Observation.dart';

class SkillDataDump {
  String evaluationType;
  String options;
  int maximumValue;
  String probableMonth;
  String probableWeek;
  String status;
  String evaluationStatus;
  String createdDate;
  String updatedDate;
  bool isParent = false;
  List<Observation> observations;
  String description;
  String identificationKey;

// for Rubrics
  String publishedDate;
  String targatedDate;
  String rubricRef; // for rubricId for get the object from ID

  SkillDataDump(
      {this.evaluationType,
        this.options,
        this.maximumValue,
        this.probableMonth,
        this.probableWeek,
        this.status,
        this.evaluationStatus,
        this.createdDate,
        this.updatedDate,
        this.isParent,
        this.observations,
        this.description,
        this.identificationKey,
        this.publishedDate,
        this.targatedDate,
        this.rubricRef});

  factory SkillDataDump.fromJsonServer(Map<String, dynamic> jsonObject) => SkillDataDump(
    evaluationType: jsonObject['evaluationType'],
    options: jsonObject['options'],
    maximumValue: jsonObject['maximumValue'],
    probableMonth: jsonObject['probableMonth'],
    status: jsonObject['status'],
    evaluationStatus: jsonObject['evaluationStatus'],
    createdDate: jsonObject['createdDate'],
    updatedDate: jsonObject['updatedDate'],
    isParent: jsonObject['isParent'],
    observations: jsonObject['observations'],
    description: jsonObject['description'],
    identificationKey: jsonObject['identificationKey'],
    publishedDate: jsonObject['publishedDate'],
    targatedDate: jsonObject['targatedDate'],
    rubricRef: jsonObject['rubricRef'],
  );

  factory SkillDataDump.fromJsonLocal(Map<String, dynamic> jsonObject) => SkillDataDump(
    evaluationType: jsonObject['evaluationType'],
    options: jsonObject['options'],
    maximumValue: jsonObject['maximumValue'],
    probableMonth: jsonObject['probableMonth'],
    status: jsonObject['status'],
    evaluationStatus: jsonObject['evaluationStatus'],
    createdDate: jsonObject['createdDate'],
    updatedDate: jsonObject['updatedDate'],
    isParent: jsonObject['isParent'],
   // observations: jsonObject['observations'],
    description: jsonObject['description'],
    identificationKey: jsonObject['identificationKey'],
    publishedDate: jsonObject['publishedDate'],
    targatedDate: jsonObject['targatedDate'],
    rubricRef: jsonObject['rubricRef'],
  );

  Map<String, dynamic> toJson() => {
    'evaluationType': evaluationType,
    'options': options,
    'maximumValue': maximumValue,
    'probableMonth': probableMonth,
    'status': status,
    'evaluationStatus': evaluationStatus,
    'createdDate': createdDate,
    'updatedDate': updatedDate,
    'isParent': isParent,
    'observations': observations,
    'identificationKey': identificationKey,
    'publishedDate': publishedDate,
    'targatedDate': targatedDate,
    'rubricRef': rubricRef,
  };
}
