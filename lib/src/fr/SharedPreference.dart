
import 'dart:convert';

class SharedPreference{
  String key;
  String value;

  SharedPreference({
    this.key,
    this.value
  });

  factory SharedPreference.fromJson(Map<String, dynamic> json) => SharedPreference(
    key : json["key"],
    value: json["value"]
  );

  factory SharedPreference.fromJson_(String k, v) => SharedPreference(
      key : json.encode(k),
      value: json.encode(v)
  );

  Map<String, dynamic> toJson() => {
    "key" : key,
    "value" : value
  };

}