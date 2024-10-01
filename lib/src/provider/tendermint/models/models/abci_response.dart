import 'package:blockchain_utils/blockchain_utils.dart';

class ABCIResponse {
  final String log;
  final String height;
  final String? proof;
  final String? value;
  final String? key;
  final String? index;
  final int code;

  const ABCIResponse({
    required this.log,
    required this.height,
    required this.proof,
    required this.value,
    required this.key,
    required this.index,
    required this.code,
  });

  factory ABCIResponse.fromJson(Map<String, dynamic> json) {
    return ABCIResponse(
      log: json['log'],
      height: json['height'] ?? "",
      proof: json['proofOps'],
      value: json['value'],
      key: json['key'],
      index: json['index'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "log": log,
      "height": height,
      "proof": proof,
      "value": value,
      "key": key,
      "index": index,
      "code": code
    };
  }

  List<int> valueBytes() {
    if (value == null) {
      throw RPCError(
          errorCode: code, message: log, request: {}, details: toJson());
    }
    return StringUtils.encode(value!, type: StringEncoding.base64);
  }

  @override
  String toString() {
    return "ABCIResponse${toJson()}";
  }
}
