import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'msg_lock_and_super_fluid_delegate_response.dart';

/// MsgUnPoolWhitelistedPool Unpools every lock the sender has, that is associated with pool pool_id.
/// If pool_id is not approved for unpooling by governance, this is a no-op. Unpooling takes the locked gamm shares,
/// and runs "ExitPool" on it, to get the constituent tokens. e.g. z gamm/pool/1 tokens ExitPools into constituent tokens
/// x uatom, y uosmo. Then it creates a new lock for every constituent token, with the duration associated with the lock.
/// If the lock was unbonding, the new lockup durations should be the time left until unbond completion.
class OsmosisSuperfluidMsgUnPoolWhitelistedPool extends CosmosMessage
    with ServiceMessage<OsmosisSuperfluidMsgLockAndSuperfluidDelegateResponse> {
  final String? sender;
  final BigInt? poolId;

  OsmosisSuperfluidMsgUnPoolWhitelistedPool({this.sender, this.poolId});
  factory OsmosisSuperfluidMsgUnPoolWhitelistedPool.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgUnPoolWhitelistedPool(
        sender: decode.getField(1), poolId: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"sender": sender, "pool_id": poolId};
  }

  @override
  String get typeUrl => OsmosisSuperfluidTypes.msgUnPoolWhitelistedPool.typeUrl;

  @override
  List get values => [sender, poolId];

  @override
  String get service => OsmosisSuperfluidTypes.unPoolWhitelistedPool.typeUrl;

  @override
  List<String?> get signers => [sender];
  @override
  OsmosisSuperfluidMsgLockAndSuperfluidDelegateResponse onResponse(
      List<int> bytes) {
    return OsmosisSuperfluidMsgLockAndSuperfluidDelegateResponse.deserialize(
        bytes);
  }
}
