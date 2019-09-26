
class Teacher{
  int lid;  // Lcoal Primary Key
  int id;   // Server Primary Key
  String firstName;
  String lastName;
  int person ;
  bool isWritable;
  String gender;
  String email;
  String standardIds;
  String subjectIds;
  int userId;
  String role;

  Teacher({
    this.lid,
    this.id,
    this.firstName,
    this.lastName,
    this.person,
    this.isWritable,
    this.gender,
    this.email,
    this.standardIds,
    this.subjectIds,
    this.userId,
    this.role
  });


  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
    lid: json["lid"],
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    person: json["person"],
    isWritable: json["isWritable"],
    gender: json["gender"],
    email: json["email"],
    standardIds: json["standardIds"],
    subjectIds: json["subjectIds"],
    userId: json["userId"],
    role: json["role"],

  );

  Map<String, dynamic> toJson() => {
    "lid" : lid,
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
   
  };


}