import 'dart:convert';

class Parent {
  int id;
  String firstName;
  String lastName;
  String gender;
  String email;
  String mobileNumber;
  String relation;
  int personId;
  int isWritable = 0;

  Parent(
      {this.id,
      this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.mobileNumber,
      this.relation,
      this.personId,
      this.isWritable});

  factory Parent.fromJsonServer(Map<String, dynamic> jsonObject) => Parent(
    id: jsonObject['id'],
    firstName: jsonObject['firstName'],
    lastName: jsonObject['lastName'],
    gender: jsonObject['gender'],
    email: jsonObject['email'],
    mobileNumber: jsonObject['mobileNumber'],
    relation: jsonObject['relation'],
    personId: jsonObject['personId'],
    isWritable: jsonObject['isWritable'] == true ? 1 : 0,
  );

  factory Parent.fromJsonLocal(Map<String, dynamic> jsonObject) => Parent(
    id: jsonObject['id'],
    firstName: jsonObject['firstName'],
    lastName: jsonObject['lastName'],
    gender: jsonObject['gender'],
    email: jsonObject['email'],
    mobileNumber: jsonObject['mobileNumber'],
    relation: jsonObject['relation'],
    personId: jsonObject['personId'],
    isWritable: jsonObject['isWritable'] == true ? 1 : 0,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'gender': gender,
    'email': email,
    'mobileNumber': mobileNumber,
    'relation': relation,
    'personId': personId,
    'isWritable': isWritable
  };

}
