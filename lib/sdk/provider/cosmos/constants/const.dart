class CosmosProviderUtils {
  static const int tendermintUnknownQueryPathErrCode = 6;
  static const int tendermintNotFoundErrCode = 22;
  // static const String restNotImplemented = "Not Implemented";
  static const int notImplementedErrorCode = 12;
  static const int notFoundErrCode = 5;
  static bool itemNotFound(int? code) {
    if (code == notFoundErrCode || code == tendermintNotFoundErrCode) {
      return true;
    }
    return false;
  }

  static bool notImplemented(int? code) {
    if (code == tendermintUnknownQueryPathErrCode ||
        code == notImplementedErrorCode) {
      return true;
    }
    return false;
  }

  static List<String> extractParams(String url) {
    final RegExp regExp = RegExp(r':\w+');
    final Iterable<Match> matches = regExp.allMatches(url);
    final List<String> params = [];
    for (final match in matches) {
      params.add(match.group(0)!);
    }
    return List<String>.unmodifiable(params);
  }
}
