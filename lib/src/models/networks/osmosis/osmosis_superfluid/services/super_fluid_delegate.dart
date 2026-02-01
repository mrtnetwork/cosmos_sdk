import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// Execute superfluid delegation for a lockup
class OsmosisSuperfluidMsgSuperfluidDelegate
    extends OsmosisSuperfluid<EmptyServiceRequestResponse> {
  final String? sender;
  final BigInt? lockId;
  final String? valAddr;

  const OsmosisSuperfluidMsgSuperfluidDelegate({
    this.sender,
    this.lockId,
    this.valAddr,
  });
  factory OsmosisSuperfluidMsgSuperfluidDelegate.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgSuperfluidDelegate(
      sender: decode.getField(1),
      lockId: decode.getField(2),
      valAddr: decode.getField(3),
    );
  }
  factory OsmosisSuperfluidMsgSuperfluidDelegate.fromJson(
    Map<String, dynamic> json,
  ) {
    // final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgSuperfluidDelegate(
      sender: json.as("sender"),
      lockId: json.asBigInt("lock_id"),
      valAddr: json.as("val_addr"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "lock_id": lockId?.toString(),
      "val_addr": valAddr,
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.msgSuperfluidDelegate;

  @override
  List get values => [sender, lockId, valAddr];

  @override
  List<String?> get signers => [sender];
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      OsmosisSuperfluidTypes.msgSuperfluidDelegateResponse,
    );
  }
}
