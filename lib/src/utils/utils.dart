import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';

class CosmosUtils {
  static List<int> toBytes(String data) {
    try {
      if (StringUtils.isHexBytes(data)) {
        return BytesUtils.fromHexString(data);
      }
      return StringUtils.encode(data, type: StringEncoding.base64);
    } catch (e) {
      throw DartCosmosSdkPluginException("Invalid bytes data.");
    }
  }

  static List<int>? tryToBytes(String? data) {
    if (data == null) return null;
    try {
      if (StringUtils.isHexBytes(data)) {
        return BytesUtils.fromHexString(data);
      }
      return StringUtils.encode(data, type: StringEncoding.base64);
    } catch (e) {
      throw DartCosmosSdkPluginException("Invalid bytes data.");
    }
  }

  static String toBase64(List<int> data) {
    return StringUtils.decode(data, type: StringEncoding.base64);
  }

  static String? tryToBase64(List<int>? data) {
    return StringUtils.tryDecode(data, type: StringEncoding.base64);
  }

  static void validateMessageType(String? excepted, String? type) {
    if (excepted == null) return;
    if (excepted != type) {
      throw DartCosmosSdkPluginException("Invalid message type",
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
