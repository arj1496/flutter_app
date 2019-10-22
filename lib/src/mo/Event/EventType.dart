class EventType {
  int id;
  String eventType;
  EventType({
    this.id,
    this.eventType,
});
  factory EventType.fromJson(Map<String, dynamic> parsedJson) {
    return EventType(
        id: parsedJson['id'],
        eventType: parsedJson['autocompleteTerm'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
    "id" : id,
    "eventType" : eventType,
  };
}