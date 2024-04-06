import 'package:blockchain_utils/exception/exception.dart';

class CosmosUtils {
  static void validateMessageType(String? excepted, String? type) {
    if (excepted == null) return;
    if (excepted != type) {
      throw MessageException("Invalid message type",
          details: {"Excepted": excepted, "Type": type});
    }
  }

  static final RegExp _pathParamRegex = RegExp(r':\w+');
  static List<String> extractParams(String url) {
    Iterable<Match> matches = _pathParamRegex.allMatches(url);
    List<String> params = [];
    for (Match match in matches) {
      params.add(match.group(0)!);
    }
    return List<String>.unmodifiable(params);
  }
}
