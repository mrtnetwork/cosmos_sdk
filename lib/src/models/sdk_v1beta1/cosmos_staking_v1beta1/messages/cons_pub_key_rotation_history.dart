import 'package:blockchain_utils/binary/binary.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// ConsPubKeyRotationHistory contains a validator's consensus public key rotation history.
class ConsPubKeyRotationHistory extends CosmosMessage {
  /// operator_address defines the address of the validator's operator; bech encoded in JSON.
  final List<int>? operatorAddress;

  /// old_cons_pubkey is the old consensus public key of the validator, as a Protobuf Any.
  final Any? oldConsPubkey;

  /// new_cons_pubkey is the new consensus public key of the validator, as a Protobuf Any.
  final Any? newConsPubkey;

  /// height defines the block height at which the rotation event occurred.
  final BigInt? height;

  /// fee holds the amount of fee deduced for the rotation.
  final Coin fee;

  ConsPubKeyRotationHistory({
    List<int>? operatorAddress,
    this.oldConsPubkey,
    this.newConsPubkey,
    this.height,
    required this.fee,
  }) : operatorAddress =
            BytesUtils.tryToBytes(operatorAddress, unmodifiable: true);
  factory ConsPubKeyRotationHistory.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ConsPubKeyRotationHistory(
        operatorAddress: decode.getField(1),
        oldConsPubkey:
            decode.getResult(2)?.to<Any, List<int>>((e) => Any.deserialize(e)),
        newConsPubkey:
            decode.getResult(3)?.to<Any, List<int>>((e) => Any.deserialize(e)),
        height: decode.getField(4),
        fee: Coin.deserialize(decode.getField(5)));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'operator_address': BytesUtils.tryToHexString(operatorAddress),
      'old_cons_pubkey': oldConsPubkey?.toJson(),
      'new_cons_pubkey': newConsPubkey?.toJson(),
      'height': height?.toString(),
      'fee': fee.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  String get typeUrl => StakingV1beta1Types.consPubKeyRotationHistory.typeUrl;

  @override
  List get values =>
      [operatorAddress, oldConsPubkey, newConsPubkey, height, fee];
}
