
class Holiday
{
  int id;
  String name;
  int startDate;
  int endDate;
  String type;

  Holiday({
    this.id,
    this.name,
    this.startDate,
    this.endDate,
    this.type}

      );

  factory Holiday.fromJson(Map<String, dynamic> json) => Holiday(
      id: json["id"],
      name :json["name"],
      startDate: json["startDate"],
      endDate: json["endDate"],
      type: json["type"]

  );

  Map<String, dynamic> toJson() => {

    "id" : id,
    "name" : name,
    "startDate" : startDate,
    "endDate" : endDate,
    "type" : type,
  };

  factory Holiday.fromJsonLocal(Map<String, dynamic> json) => Holiday(
    id: json["id"],
    name :json["name"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    type: json["type"],


  );



}