
class Teacher{
  int lid;  // Lcoal Primary Key
  int id;// Server Primary Key
  String firstName;
  String birthDate;
  String lastName;
  int person ;
  int isWritable;
  String gender;
  String email;
  String mobileNumber;
  String standardIds;
  String subjectIds;
  int userId;
  String role;
  int academicType;
  String invitation;

  Teacher({
    this.lid,
    this.id,
    this.firstName,
    this.birthDate,
    this.lastName,
    this.person,
    this.isWritable,
    this.gender,
    this.email,
    this.mobileNumber,
    this.standardIds,
    this.subjectIds,
    this.userId,
    this.role,
    this.academicType,
    this.invitation,
  });


  factory Teacher.fromJsonServer(Map<String, dynamic> json) => Teacher(
    lid : json["lid"],
    id : json["id"],
    firstName : json["firstName"],
    birthDate: json["birthDate"],
    lastName : json["lastName"],
    person : json["person"],
    isWritable : json["isWritable"] == true ? 1 : 0,
    gender : json["gender"],
    email : json["email"],
    mobileNumber: json["mobileNumber"],
    standardIds : json["standardIds"],
    subjectIds : json["subjectIds"],
    userId : json["userId"],
    role : json["role"],
    academicType: json["academicType"],
    invitation: json["invitation"],
  );

  factory Teacher.fromJsonLocal(Map<String, dynamic> json) => Teacher(
    lid : json["lid"],
    id : json["id"],
    firstName : json["firstName"],
    birthDate: json["birthDate"],
    lastName : json["lastName"],
    person : json["person"],
    isWritable : json["isWritable"] == true ? 1 : 0,
    gender : json["gender"],
    email : json["email"],
    mobileNumber : json["mobileNumber"],
    standardIds : json["standardIds"],
    subjectIds : json["subjectIds"],
    userId : json["userId"],
    role : json["role"],
    academicType: json["academicType"],
    invitation: json["invitation"],
  );

  Map<String, dynamic> toJson() => {
    "lid" : lid,
    "id" : id,
    "firstName" : firstName,
    "lastName" : lastName,
    "birthDate" : birthDate,
    "person" : person,
    "isWritable" : isWritable,
    "gender" : gender,
    "email" : email,
    "standardIds" : standardIds,
    "userId" : userId,
    "role" : role,
    "mobileNumber" :mobileNumber,
    "academicType" :academicType,
    "invitation" :invitation,


  };


}