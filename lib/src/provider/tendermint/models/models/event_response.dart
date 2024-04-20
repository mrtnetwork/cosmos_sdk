class EventResponse {
  final String? key;
  final String? value;
  final bool? index;
  EventResponse({this.key, this.value, this.index});
  factory EventResponse.fromJson(Map<String, dynamic> json) {
    return EventResponse(
      key: json["key"],
      value: json["value"],
      index: json["index"],
    );
  }
  Map<String, dynamic> toJson() {
    return {"key": key, "value": value, "index": index};
  }
}
