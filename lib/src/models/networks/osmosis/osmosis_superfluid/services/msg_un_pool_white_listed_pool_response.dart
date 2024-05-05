import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// Execute superfluid delegation for a lockup
class OsmosisSuperfluidMsgUnPoolWhitelistedPoolResponse extends CosmosMessage {
  final List<BigInt>? exitedLockIds;

  OsmosisSuperfluidMsgUnPoolWhitelistedPoolResponse(
      {List<BigInt>? exitedLockIds})
      : exitedLockIds = exitedLockIds?.nullOnEmpy;
  factory OsmosisSuperfluidMsgUnPoolWhitelistedPoolResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgUnPoolWhitelistedPoolResponse(
        exitedLockIds: decode.getFields<BigInt>(1));
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
  String get typeUrl =>
      OsmosisSuperfluidTypes.msgUnPoolWhitelistedPoolResponse.typeUrl;

  @override
  List get values => [exitedLockIds];
}
