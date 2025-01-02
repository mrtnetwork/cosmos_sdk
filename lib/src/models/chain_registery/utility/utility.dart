import 'package:cosmos_sdk/src/models/chain_registery/models/registery_ping.dart';

class CCRUtilities {
  static Uri getChainUri({
    required String baseUrl,
    required String chain,
    required CCRSchemaType schema,
  }) {
    Uri uri = Uri.parse(baseUrl);
    uri = uri.replace(
        pathSegments: [...uri.pathSegments, chain, schema.pathSegments]);
    return uri;
  }

  static List<RegisteryPingPubItem> readChainDirectories(
      List<Map<String, dynamic>> json) {
    final List<RegisteryPingPubItem> chainDirectories = [];
    for (final i in json) {
      if (!i.containsKey("name") && !i.containsKey("type")) {
        continue;
      }
      final String name = i["name"];
      final type = RegisteryPingPubItemType.fromName(i["type"]);
      if (name.startsWith("_") || type.isFile) continue;
      chainDirectories
          .add(RegisteryPingPubItem(name: name, type: type, mtime: i["mtime"]));
    }
    return chainDirectories;
  }
}
