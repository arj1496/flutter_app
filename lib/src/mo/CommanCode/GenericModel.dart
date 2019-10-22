class  GenericModel{
  //1.Title
  String title;
  int classId;
  int subjectId;
  String description;
  String place;
  String date;
  String time;
  String eventType;
   /*setTitle(String title){
     this.title = title;
   }
    setClassId(int classId){
     this.classId= classId;
    }
    setSubjectId(int subjectId){
     this.subjectId = subjectId;
    }
    setDescription(String description){
     this.description = description;
    }
    setPlace(String place){
     this.place = place;
    }
    setDate(String date){
     this.date = date;
    }
    setTime(String time){
     this.time = time;
    }*/

}

class EventModel implements GenericModel{
  @override
  int classId;

  @override
  String date;

  @override
  String description;

  @override
  String place;

  @override
  int subjectId;

  @override
  String time;

  @override
  String title;

  @override
  String eventType;

}

