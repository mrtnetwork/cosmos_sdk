import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'super_fluid_undelegate_and_unbond_lock_response.dart';

class OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLock
    extends OsmosisSuperfluid<
        OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse> {
  final String? sender;
  final BigInt? lockId;

  /// Amount of unlocking coin.
  final Coin coin;
  const OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLock(
      {this.sender, this.lockId, required this.coin});
  factory OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLock.fromJson(
      Map<String, dynamic> json) {
    // final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLock(
        sender: json.as("sender"),
        lockId: json.asBigInt("lock_id"),
        coin: Coin.deserialize(json.asMap("coin")));
  }
  factory OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLock.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLock(
        sender: decode.getField(1),
        lockId: decode.getField(2),
        coin: Coin.deserialize(decode.getField(3)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "lock_id": lockId?.toString(),
      "coin": coin.toJson()
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.msgSuperfluidUndelegateAndUnbondLock;

  @override
  List get values => [sender, lockId];

  @override
  List<String?> get signers => [sender];
  @override
  OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse onResponse(
      List<int> bytes) {
    return OsmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse
        .deserialize(bytes);
  }
}
