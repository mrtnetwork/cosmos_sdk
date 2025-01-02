import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// Execute superfluid delegation for a lockup
class OsmosisSuperfluidMsgUnPoolWhitelistedPoolResponse extends CosmosMessage {
  final List<BigInt>? exitedLockIds;

  OsmosisSuperfluidMsgUnPoolWhitelistedPoolResponse(
      {List<BigInt>? exitedLockIds})
      : exitedLockIds = exitedLockIds?.emptyAsNull?.immutable;
  factory OsmosisSuperfluidMsgUnPoolWhitelistedPoolResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgUnPoolWhitelistedPoolResponse(
        exitedLockIds: decode
                .getResult<ProtocolBufferDecoderResult?>(1)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "exited_lock_ids": exitedLockIds?.map((e) => e.toString()).toList()
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.msgUnPoolWhitelistedPoolResponse;

  @override
  List get values => [exitedLockIds];
}
