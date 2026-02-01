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

class CheckTxEventResponse {
  final String type;
  final List<EventResponse> attributes;
  const CheckTxEventResponse({required this.type, required this.attributes});
  factory CheckTxEventResponse.fromJson(Map<String, dynamic> json) {
    return CheckTxEventResponse(
      type: json["type"],
      attributes:
          (json["attributes"] as List)
              .map((e) => EventResponse.fromJson(e))
              .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "attributes": attributes.map((e) => e.toJson()).toList(),
    };
  }
}
