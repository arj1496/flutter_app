

class Person{

   int lid;          // person local is from database
   int id;           // person serverId stored into database as primary key which is nullable
   String name;
   String standardName;
   String gender;
   String relation;
   String parentOf;
   int isSelected ;
   String email;
   String mobileNumber;
   String role;
   String firstName;
   String lastName;

  Person({
    this.id
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(

  );

  Map<String, dynamic> toJson() => {

  };

}