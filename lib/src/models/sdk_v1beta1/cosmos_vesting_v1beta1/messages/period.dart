import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// Period defines a length of time and amount of coins that will vest.
class Period extends CosmosMessage {
  /// Period duration in seconds.
  final BigInt? length;

  final List<Coin> amount;

  /// Constructs a new instance of [Period].
  Period({
    this.length,
    required List<Coin> amount,
  }) : amount = amount.immutable;

  factory Period.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Period(
        amount: decode.getFields(2).map((e) => Coin.deserialize(e)).toList(),
        length: decode.getField(1));
  }

  /// Converts this instance of [Period] to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'length': length?.toString(),
      'amount': amount.map((coin) => coin.toJson()).toList(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get typeUrl => VestingV1beta1Types.period.typeUrl;

  @override
  List get values => [length, amount];
}
