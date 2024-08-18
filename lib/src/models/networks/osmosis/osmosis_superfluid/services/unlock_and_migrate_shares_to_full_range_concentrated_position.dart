import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'unlock_and_migrate_shares_to_full_range_concentrated_position_response.dart';

class OsmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPosition
    extends CosmosMessage
    with
        ServiceMessage<
            OsmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse> {
  final String? sender;
  final BigInt? lockId;
  final Coin sharesToMigrate;

  /// token_out_mins indicates minimum token to exit Balancer pool with.
  final List<Coin> tokenOutMins;
  OsmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPosition({
    this.sender,
    this.lockId,
    required this.sharesToMigrate,
    required List<Coin> tokenOutMins,
  }) : tokenOutMins = tokenOutMins.immutable;
  factory OsmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPosition.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPosition(
      sender: decode.getField(1),
      lockId: decode.getField(2),
      sharesToMigrate: Coin.deserialize(decode.getField(3)),
      tokenOutMins:
          decode.getFields(4).map((e) => Coin.deserialize(e)).toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "lock_id": lockId?.toString(),
      "shares_to_migrate": sharesToMigrate.toJson(),
      "token_out_mins": tokenOutMins.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisSuperfluidTypes
      .msgUnlockAndMigrateSharesToFullRangeConcentratedPosition.typeUrl;

  @override
  List get values => [sender, lockId, sharesToMigrate, tokenOutMins];

  @override
  String get service => OsmosisSuperfluidTypes
      .unlockAndMigrateSharesToFullRangeConcentratedPosition.typeUrl;

  @override
  List<String?> get signers => [sender];
  @override
  OsmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse
      onResponse(List<int> bytes) {
    return OsmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse
        .deserialize(bytes);
  }
}
