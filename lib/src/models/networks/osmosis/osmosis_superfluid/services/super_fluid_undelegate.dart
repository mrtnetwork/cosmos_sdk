import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// Execute superfluid delegation for a lockup
class OsmosisSuperfluidMsgSuperfluidUndelegate
    extends OsmosisSuperfluid<EmptyServiceRequestResponse> {
  final String? sender;
  final BigInt? lockId;

  const OsmosisSuperfluidMsgSuperfluidUndelegate({this.sender, this.lockId});
  factory OsmosisSuperfluidMsgSuperfluidUndelegate.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgSuperfluidUndelegate(
        sender: decode.getField(1), lockId: decode.getField(2));
  }
  factory OsmosisSuperfluidMsgSuperfluidUndelegate.fromJson(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidMsgSuperfluidUndelegate(
        sender: json.as("sender"), lockId: json.asBigInt("lock_id"));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"sender": sender, "lock_id": lockId?.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.msgSuperfluidDelegate;

  @override
  List get values => [sender, lockId];

  @override
  List<String?> get signers => [sender];
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisSuperfluidTypes.msgSuperfluidUndelegateResponse);
  }
}
