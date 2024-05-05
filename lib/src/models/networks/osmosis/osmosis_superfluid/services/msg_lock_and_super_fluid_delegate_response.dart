import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Execute superfluid delegation for a lockup
class OsmosisSuperfluidMsgLockAndSuperfluidDelegateResponse
    extends CosmosMessage {
  final BigInt? id;

  OsmosisSuperfluidMsgLockAndSuperfluidDelegateResponse({this.id});
  factory OsmosisSuperfluidMsgLockAndSuperfluidDelegateResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgLockAndSuperfluidDelegateResponse(
        id: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"ID": id};
  }

  @override
  String get typeUrl =>
      OsmosisSuperfluidTypes.msgLockAndSuperfluidDelegateResponse.typeUrl;

  @override
  List get values => [id];
}
