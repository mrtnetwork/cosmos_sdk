import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/messages/module.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// VersionInfo is the type for the GetNodeInfoResponse message.
class VersionInfo extends CosmosMessage {
  final String? name;
  final String? appName;
  final String? version;
  final String? gitCommit;
  final String? buildTags;
  final String? goVersion;
  final List<Module>? buildDeps;

  /// Since: cosmos-sdk 0.43
  final String? cosmosSdkVersion;

  VersionInfo(
      {this.name,
      this.appName,
      this.version,
      this.gitCommit,
      this.buildTags,
      this.goVersion,
      List<Module>? buildDeps,
      this.cosmosSdkVersion})
      : buildDeps = buildDeps?.immutable;

  factory VersionInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return VersionInfo(
      name: decode.getField(1),
      appName: decode.getField(2),
      version: decode.getField(3),
      gitCommit: decode.getField(4),
      buildTags: decode.getField(5),
      goVersion: decode.getField(6),
      buildDeps: decode
          .getFields<List<int>>(7)
          .map((e) => Module.deserialize(e))
          .toList(),
      cosmosSdkVersion: decode.getField(8),
    );
  }
  factory VersionInfo.fromJson(Map<String, dynamic> json) {
    return VersionInfo(
      name: json["name"],
      appName: json["app_name"],
      version: json["version"],
      gitCommit: json["git_commit"],
      buildTags: json["build_tags"],
      goVersion: json["go_version"],
      buildDeps: (json["build_deps"] as List?)
          ?.map((e) => Module.fromJson(e))
          .toList(),
      cosmosSdkVersion: json["cosmos_sdk_version"],
    );
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "app_name": appName,
      "version": version,
      "git_commit": gitCommit,
      "build_tags": buildTags,
      "go_version": goVersion,
      "build_deps": buildDeps?.map((e) => e.toJson()).toList(),
      "cosmos_sdk_version": cosmosSdkVersion
    };
  }

  @override
  TypeUrl get typeUrl => BaseTendermintV1beta1Types.versionInfo;

  @override
  List get values => [
        name,
        appName,
        version,
        gitCommit,
        buildTags,
        goVersion,
        buildDeps,
        cosmosSdkVersion
      ];
}
