import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Params represents the parameters used for by the slashing module.
class SlashingParams extends CosmosMessage {
  final BigInt? signedBlocksWindow;
  final List<int> minSignedPerWindow;
  final ProtobufDuration downtimeJailDuration;
  final List<int> slashFractionDoubleSign;
  final List<int> slashFractionDowntime;

  SlashingParams(
      {this.signedBlocksWindow,
      required List<int> minSignedPerWindow,
      required this.downtimeJailDuration,
      required List<int> slashFractionDoubleSign,
      required List<int> slashFractionDowntime})
      : minSignedPerWindow =
            BytesUtils.toBytes(minSignedPerWindow, unmodifiable: true),
        slashFractionDoubleSign =
            BytesUtils.toBytes(slashFractionDoubleSign, unmodifiable: true),
        slashFractionDowntime = BytesUtils.toBytes(slashFractionDowntime);
  factory SlashingParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SlashingParams(
        signedBlocksWindow: decode.getField(1),
        minSignedPerWindow: decode.getField(2),
        downtimeJailDuration: ProtobufDuration.deserialize(decode.getField(3)),
        slashFractionDoubleSign: decode.getField(4),
        slashFractionDowntime: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "signed_blocks_window": signedBlocksWindow?.toString(),
      "min_signed_per_window": BytesUtils.toHexString(minSignedPerWindow),
      "slash_fraction_double_sign":
          BytesUtils.toHexString(slashFractionDoubleSign),
      "slash_fraction_downtime": BytesUtils.toHexString(slashFractionDowntime),
      "downtime_jail_duration": downtimeJailDuration.toJson()
    };
  }

  @override
  String get typeUrl => SlashingV1beta1Types.slashingParams.typeUrl;

  @override
  List get values => [
        signedBlocksWindow,
        minSignedPerWindow,
        downtimeJailDuration,
        slashFractionDoubleSign,
        slashFractionDowntime
      ];
}
