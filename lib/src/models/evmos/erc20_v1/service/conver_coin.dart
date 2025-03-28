import 'package:cosmos_sdk/src/models/evmos/core/service.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgConvertCoin defines a Msg to convert a native Cosmos coin to a ERC20 token
class EvmosErc20V1MsgConvertCoin
    extends EvmosService<EmptyServiceRequestResponse> with AminoMessage {
  /// coin is a Cosmos coin whose denomination is registered in a token pair. The coin
  /// amount defines the amount of coins to convert.
  final Coin? coin;

  /// receiver is the hex address to receive ERC20 token
  final String? receiver;

  /// sender is the cosmos bech32 address from the owner of the given Cosmos coins
  final String? sender;

  const EvmosErc20V1MsgConvertCoin(
      {required this.coin, required this.receiver, required this.sender});

  factory EvmosErc20V1MsgConvertCoin.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosErc20V1MsgConvertCoin(
        coin: decode.getResult(1)?.to<Coin, List<int>>(Coin.deserialize),
        receiver: decode.getField(2),
        sender: decode.getField(3));
  }
  factory EvmosErc20V1MsgConvertCoin.fromJson(Map<String, dynamic> json) {
    return EvmosErc20V1MsgConvertCoin(
        coin: json.maybeAs(key: "coin", onValue: Coin.fromJson),
        receiver: json.as("receiver"),
        sender: json.as("sender"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"coin": coin?.toJson(), "receiver": receiver, "sender": sender};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.msgConvertCoin;

  @override
  List get values => [coin, receiver, sender];
  @override
  List<String?> get signers => [sender];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        EvmosErc20V1Types.msgConvertCoinResponse);
  }
}
