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

  static final RegExp _pathParamRegex = RegExp(r':\w+');
  static List<String> extractParams(String url) {
    final Iterable<Match> matches = _pathParamRegex.allMatches(url);
    final List<String> params = [];
    for (final match in matches) {
      params.add(match.group(0)!);
    }
    return List<String>.unmodifiable(params);
  }

  static String extractServiceRoot(String typeUrl) {
    final index = typeUrl.lastIndexOf(".");
    final root = typeUrl.substring(0, index);
    return root;
  }

  static String convertToServiceTypeUrl(String typeUrl) {
    // Ensure the typeUrl starts with a slash
    if (!typeUrl.startsWith('/')) {
      throw DartCosmosSdkPluginException('Type URL must start with a slash');
    }

    // Remove the leading slash and split by dots
    final parts = typeUrl.substring(1).split('.');
    // Get the last part which contains the service and method name
    final lastPart = parts.removeLast();
    // Find where the method name starts
    final methodStart = lastPart.indexOf(RegExp(r'[A-Z]'), 3); // After 'Msg'
    // Separate service name and method name
    final serviceName = lastPart.substring(0, methodStart);
    final methodName = lastPart.substring(methodStart);
    return '/${parts.join('.')}.$serviceName/$methodName';
  }

  static Object? sortAminoJsonTx(Object? obj) {
    if (obj is Map) {
      final keys = obj.keys.cast<String>().toList()
        ..sort((a, b) => a.compareTo(b));
      final Map<String, dynamic> result = {};
      for (final i in keys) {
        final value = obj[i];
        result[i] = sortAminoJsonTx(value);
      }
      return result;
    } else if (obj is List) {
      return obj.map((e) => sortAminoJsonTx(e)).toList();
    }
    return obj;
  }
}
