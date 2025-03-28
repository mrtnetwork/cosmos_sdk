import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgClawbackResponse defines the MsgClawback response type.
class EvmosVestingV2MsgClawbackResponse extends CosmosMessage {
  /// coins is the slice of clawed back coins
  final List<Coin>? coins;

  const EvmosVestingV2MsgClawbackResponse({this.coins});

  factory EvmosVestingV2MsgClawbackResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosVestingV2MsgClawbackResponse(
      coins: decode.getFields<List<int>>(1).map(Coin.deserialize).toList(),
    );
  }
  factory EvmosVestingV2MsgClawbackResponse.fromJson(
      Map<String, dynamic> json) {
    return EvmosVestingV2MsgClawbackResponse(
        coins: json.asListOfMap("coins")?.map(Coin.fromJson).toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"coins": coins?.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.msgClawbackResponse;

  @override
  List get values => [coins];
}
