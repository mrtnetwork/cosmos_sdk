import 'package:cosmos_sdk/src/address/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ValidatorSigningInfo defines a validator's signing info for monitoring their liveness activity.
class SlashingValidatorSigningInfo extends CosmosMessage {
  final BaseAddress? address;

  /// Height at which validator was first a candidate OR was un-jailed
  final BigInt? startHeight;

  /// DEPRECATED: Index which is incremented every time a validator is bonded in a block and
  /// _may_ have signed a pre-commit or not. This in conjunction with the
  /// signed_blocks_window param determines the index in the missed block bitmap.
  final BigInt? indexOffset;

  /// Timestamp until which the validator is jailed due to liveness downtime.
  final ProtobufTimestamp jailedUntil;

  /// Whether or not a validator has been tombstoned (killed out of validator
  /// set). It is set once the validator commits an equivocation or for any other
  /// configured misbehavior.
  final bool? tombstoned;

  /// A counter of missed (unsigned) blocks. It is used to avoid unnecessary
  /// reads in the missed block bitmap.
  final BigInt? missedBlocksCounter;
  const SlashingValidatorSigningInfo(
      {this.address,
      this.startHeight,
      this.indexOffset,
      required this.jailedUntil,
      this.tombstoned,
      this.missedBlocksCounter});

  factory SlashingValidatorSigningInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SlashingValidatorSigningInfo(
        address:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        startHeight: decode.getField(2),
        indexOffset: decode.getField(3),
        jailedUntil: ProtobufTimestamp.deserialize(decode.getField(4)),
        tombstoned: decode.getField(5),
        missedBlocksCounter: decode.getField(6));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address?.address,
      "start_height": startHeight?.toString(),
      "index_offset": indexOffset?.toString(),
      "jailed_until": jailedUntil.toJson(),
      "tombstoned": tombstoned,
      "missed_blocks_counter": missedBlocksCounter?.toString()
    };
  }

  @override
  String get typeUrl =>
      SlashingV1beta1Types.slashingValidatorSigningInfo.typeUrl;

  @override
  List get values => [
        address?.address,
        startHeight,
        indexOffset,
        jailedUntil,
        tombstoned,
        missedBlocksCounter
      ];
}
