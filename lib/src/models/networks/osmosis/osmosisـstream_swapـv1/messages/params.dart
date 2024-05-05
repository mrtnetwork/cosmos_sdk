import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis%D9%80stream_swap%D9%80v1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// Params holds parameters for the streamswap module,
class OsmosisStreamSwapParams extends CosmosMessage {
  /// fee charged when creating a new sale. The fee will go to the
  /// sale_fee_recipient unless it is not defined (empty).
  final List<Coin> saleCreationFee;

  /// bech32 address of the fee recipient
  final String? saleCreationFeeRecipient;

  /// minimum amount duration of time between the sale creation and the sale
  /// start time.
  final ProtobufDuration minDurationUntilStartTime;

  /// minimum duration for every new sale.
  final ProtobufDuration minSaleDuration;
  OsmosisStreamSwapParams(
      {required List<Coin> saleCreationFee,
      this.saleCreationFeeRecipient,
      required this.minDurationUntilStartTime,
      required this.minSaleDuration})
      : saleCreationFee = saleCreationFee.mutable;
  factory OsmosisStreamSwapParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapParams(
        saleCreationFee:
            decode.getFields(1).map((e) => Coin.deserialize(e)).toList(),
        saleCreationFeeRecipient: decode.getField(2),
        minDurationUntilStartTime:
            ProtobufDuration.deserialize(decode.getField(3)),
        minSaleDuration: ProtobufDuration.deserialize(decode.getField(4)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sale_creation_fee": saleCreationFee.map((e) => e.toJson()).toList(),
      "sale_creation_fee_recipient": saleCreationFeeRecipient,
      "min_duration_until_start_time": minDurationUntilStartTime.toJson(),
      "min_sale_duration": minSaleDuration.toJson()
    };
  }

  @override
  String get typeUrl => OsmosisStreamSwapV1Types.params.typeUrl;

  @override
  List get values => [
        saleCreationFee,
        saleCreationFeeRecipient,
        minDurationUntilStartTime,
        minSaleDuration
      ];
}
