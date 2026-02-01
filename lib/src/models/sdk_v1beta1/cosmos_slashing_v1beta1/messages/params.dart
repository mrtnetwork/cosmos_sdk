import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// Params represents the parameters used for by the slashing module.
class SlashingParams extends CosmosMessage {
  final BigInt? signedBlocksWindow;
  final List<int> minSignedPerWindow;
  final ProtobufDuration downtimeJailDuration;
  final List<int> slashFractionDoubleSign;
  final List<int> slashFractionDowntime;

  factory SlashingParams.fromJson(Map<String, dynamic> json) {
    return SlashingParams(
      minSignedPerWindow: CosmosUtils.toBytes(json["min_signed_per_window"]),
      signedBlocksWindow: BigintUtils.tryParse(json["signed_blocks_window"]),
      downtimeJailDuration: ProtobufDuration.fromString(
        json["downtime_jail_duration"],
      ),
      slashFractionDoubleSign: CosmosUtils.toBytes(
        json["slash_fraction_double_sign"],
      ),
      slashFractionDowntime: CosmosUtils.toBytes(
        json["slash_fraction_downtime"],
      ),
    );
  }

  SlashingParams({
    this.signedBlocksWindow,
    required List<int> minSignedPerWindow,
    required this.downtimeJailDuration,
    required List<int> slashFractionDoubleSign,
    required List<int> slashFractionDowntime,
  }) : minSignedPerWindow = BytesUtils.toBytes(
         minSignedPerWindow,
         unmodifiable: true,
       ),
       slashFractionDoubleSign = BytesUtils.toBytes(
         slashFractionDoubleSign,
         unmodifiable: true,
       ),
       slashFractionDowntime = BytesUtils.toBytes(slashFractionDowntime);
  factory SlashingParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SlashingParams(
      signedBlocksWindow: decode.getField(1),
      minSignedPerWindow: decode.getField(2),
      downtimeJailDuration: ProtobufDuration.deserialize(decode.getField(3)),
      slashFractionDoubleSign: decode.getField(4),
      slashFractionDowntime: decode.getField(5),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "signed_blocks_window": signedBlocksWindow?.toString(),
      "min_signed_per_window": CosmosUtils.toBase64(minSignedPerWindow),
      "slash_fraction_double_sign": CosmosUtils.toBase64(
        slashFractionDoubleSign,
      ),
      "slash_fraction_downtime": CosmosUtils.toBase64(slashFractionDowntime),
      "downtime_jail_duration": downtimeJailDuration.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => SlashingV1beta1Types.slashingParams;

  @override
  List get values => [
    signedBlocksWindow,
    minSignedPerWindow,
    downtimeJailDuration,
    slashFractionDoubleSign,
    slashFractionDowntime,
  ];
}
