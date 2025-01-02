import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Params defines the set of IBC transfer parameters. NOTE: To prevent a single token
/// from being transferred, set the TransfersEnabled parameter to true and then set
/// the bank module's SendEnabled parameter for the denomination to false.
class IbcTransaferParams extends CosmosMessage {
  /// send_enabled enables or disables all cross-chain token transfers from this
  /// chain.
  final bool? sendEnabled;

  /// receive_enabled enables or disables all cross-chain token transfers to this
  /// chain.
  final bool? receiveEnabled;
  factory IbcTransaferParams.fromRpc(Map<String, dynamic> json) {
    return IbcTransaferParams(
        receiveEnabled: json["receive_enabled"],
        sendEnabled: json["send_enabled"]);
  }
  const IbcTransaferParams({this.sendEnabled, this.receiveEnabled});
  factory IbcTransaferParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcTransaferParams(
        sendEnabled: decode.getField(1), receiveEnabled: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"send_enabled": sendEnabled, "receive_enabled": receiveEnabled};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcTransferParams;

  @override
  List get values => [sendEnabled, receiveEnabled];
}
