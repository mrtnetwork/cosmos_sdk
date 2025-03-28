import 'package:cosmos_sdk/src/exception/exception.dart';

import 'asset_list.dart';
import 'chain.dart';

enum CCRSchemaType {
  chain("chain.json"),
  assetlist("assetlist.json"),
  versions("versions.json");

  const CCRSchemaType(this.pathSegments);
  final String pathSegments;
}

enum RegisteryPingPubItemType {
  directory,
  file;

  bool get isFile => this == file;

  static RegisteryPingPubItemType fromName(String name) {
    return values.firstWhere(
      (e) => e.name == name,
      orElse: () => throw DartCosmosSdkPluginException("unknown type."),
    );
  }
}

/// https://registry.ping.pub/
class PingPubChain {
  final String name;
  final RegisteryPingPubItemType type;
  final String mtime;
  const PingPubChain(
      {required this.name, required this.type, required this.mtime});

  factory PingPubChain.fromJson(Map<String, dynamic> json) {
    return PingPubChain(
        name: json["name"],
        type: RegisteryPingPubItemType.fromName(json["type"]),
        mtime: json["mtime"]);
  }
  Map<String, dynamic> toJson() {
    return {"name": name, "type": type.name, "mtime": mtime};
  }

  @override
  String toString() {
    return name;
  }
}

class CCRChainData {
  final CCRChain chain;
  final CCRAssetList assetList;
  final CCRVersionInfo? version;
  const CCRChainData(
      {required this.chain, required this.assetList, this.version});
}
