
class SharedPreference{
  String key;
  dynamic value;

  SharedPreference({
    this.key,
    this.value
  });

  factory SharedPreference.fromJson(Map<String, dynamic> json) => SharedPreference(
    key : json["key"],
    value: json["value"]
  );

  factory SharedPreference.fromJson_(String k, v) => SharedPreference(
      key : k.toString(),
      value: v.toString()
  );

  Map<String, dynamic> toJson() => {
    "key" : key,
    "value" : value
  };

}