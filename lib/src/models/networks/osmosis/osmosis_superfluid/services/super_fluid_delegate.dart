import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Execute superfluid delegation for a lockup
class OsmosisSuperfluidMsgSuperfluidDelegate extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final String? sender;
  final BigInt? lockId;
  final String? valAddr;

  const OsmosisSuperfluidMsgSuperfluidDelegate(
      {this.sender, this.lockId, this.valAddr});
  factory OsmosisSuperfluidMsgSuperfluidDelegate.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgSuperfluidDelegate(
        sender: decode.getField(1),
        lockId: decode.getField(2),
        valAddr: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "lock_id": lockId?.toString(),
      "val_addr": valAddr
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.msgSuperfluidDelegate;

  @override
  List get values => [sender, lockId, valAddr];

  @override
  TypeUrl get service => OsmosisSuperfluidTypes.superfluidDelegate;

  @override
  List<String?> get signers => [sender];
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisSuperfluidTypes.msgSuperfluidDelegateResponse);
  }
}
