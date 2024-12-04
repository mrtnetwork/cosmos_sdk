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
    final Iterable<Match> matches = _pathParamRegex.allMatches(url);
    final List<String> params = [];
    for (final match in matches) {
      params.add(match.group(0)!);
    }
    return List<String>.unmodifiable(params);
  }
}
