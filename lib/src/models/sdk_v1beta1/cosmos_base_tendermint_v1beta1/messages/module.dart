import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Module is the type for VersionInfo
class Module extends CosmosMessage {
  /// module path
  final String? path;

  /// module version
  final String? version;

  /// checksum
  final String? sum;
  const Module({this.path, this.version, this.sum});
  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(path: json["path"], version: json["path"]);
  }
  factory Module.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Module(
        path: decode.getField(1),
        version: decode.getField(2),
        sum: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"path": path, "version": version, "sum": sum};
  }

  @override
  TypeUrl get typeUrl => BaseTendermintV1beta1Types.module;

  @override
  List get values => [path, version, sum];
}
