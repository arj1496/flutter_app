 enum ParticipantType {

  SCHOOL, // Invite All member of the school (teacher, admin, student, parent, and all) ex: Annual Day, Republic Day Function
  SCHOOL_STUDENT, // Only All Student of the school Specifically no parent
  SCHOOL_TEACHER, // Only All Teacher of the school
  SCHOOL_PARENT, // Only All parent of the School - Ex: parent meeting where student are not allowed
  SCHOOL_STAFF, //  Only All staff of the School - General School management meeting
  SCHOOL_ADMIN, // Only Administration staff of the school where Teacher's presence is not needed

  INDIVIDUAL_TEACHER, // Specific teacher - ex : event where only few decided Teacher are invited only all Teachers
  INDIVIDUAL_STUDENT, // Not all Student few specific students are invited. ex- School Music representation event
  INDIVIDUAL_PARENT,

  STANDARD, // All the member of the standard ex Teacher, Student & Parents
  STANDARD_STUDENT, // Only Student of the the standard
  STANDARD_PARENT, // Only Parent of the Standard
  STANDARD_TEACHER, // Only Teacher of the Standard
  DIVISION,
  DIVISION_PARENT,
  DIVISION_TEACHER,
  DIVISION_STUDENT,
  GROUP, // This entity is not exits but in it may develop in future
  SUBJECT

}