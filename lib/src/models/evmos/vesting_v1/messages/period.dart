import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// Period defines a length of time and amount of coins that will vest.
class EvmosVestingV1Period extends CosmosMessage {
  final BigInt? length;

  final Coin? amount;

  EvmosVestingV1Period({this.length, this.amount});
  factory EvmosVestingV1Period.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosVestingV1Period(
      length: decode.getField(1),
      amount: decode.getResult(2)?.to<Coin, List<int>>(Coin.deserialize),
    );
  }
  factory EvmosVestingV1Period.fromJson(Map<String, dynamic> json) {
    return EvmosVestingV1Period(
      length: json.asBigInt("length"),
      amount: json.maybeAs(key: "amount", onValue: Coin.deserialize),
    );
  }
  @override
  List get values => [length, amount];

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.period;
  @override
  Map<String, dynamic> toJson() {
    return {"length": length?.toString(), "amount": amount?.toJson()};
  }
}
