import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// DenomTrace contains the base denomination for ICS20 fungible tokens and the source tracing information path.
class DenomTrace extends CosmosMessage {
  /// path defines the chain of port/channel identifiers used for tracing the
  /// source of the fungible token.
  final String? path;

  /// base denomination of the relayed fungible token.
  final String? baseDenom;
  const DenomTrace({this.path, this.baseDenom});
  factory DenomTrace.fromRpc(Map<String, dynamic> json) {
    return DenomTrace(baseDenom: json["base_denom"], path: json["path"]);
  }
  factory DenomTrace.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DenomTrace(path: decode.getField(1), baseDenom: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"path": path, "base_denom": baseDenom};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.denomTrace;

  @override
  List get values => [path, baseDenom];
}
