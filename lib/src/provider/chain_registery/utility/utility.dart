import 'package:cosmos_sdk/src/provider/chain_registery/models/models.dart';

class CCRUtilities {
  static Uri getChainUri({
    required String baseUrl,
    required String chain,
    required CCRSchemaType schema,
  }) {
    Uri uri = Uri.parse(baseUrl);
    uri = uri.replace(
      pathSegments: [...uri.pathSegments, chain, schema.pathSegments],
    );
    return uri;
  }

  static List<PingPubChain> readChainDirectories(
    List<Map<String, dynamic>> json,
  ) {
    final List<PingPubChain> chainDirectories = [];
    for (final i in json) {
      if (!i.containsKey("name") && !i.containsKey("type")) {
        continue;
      }
      final String name = i["name"];
      final type = RegisteryPingPubItemType.fromName(i["type"]);
      if (name.startsWith("_") || type.isFile) continue;
      chainDirectories.add(
        PingPubChain(name: name, type: type, mtime: i["mtime"]),
      );
    }
    return chainDirectories;
  }
}
