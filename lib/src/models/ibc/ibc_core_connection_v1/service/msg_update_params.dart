import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/params.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// UpdateConnectionParams defines a rpc handler method for MsgUpdateParams.
class IbcConnectionMsgUpdateParams extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// signer address
  final String? signer;

  /// params defines the connection parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final IbcConnectionParams params;
  IbcConnectionMsgUpdateParams({this.signer, required this.params});
  factory IbcConnectionMsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionMsgUpdateParams(
      signer: decode.getField(1),
      params: IbcConnectionParams.deserialize(decode.getField(2)),
    );
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get service => IbcTypes.ibcConnectionUpdateConnectionParams.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"signer": signer, "params": params.toJson()};
  }

  @override
  String get typeUrl => IbcTypes.ibcConnectionMsgUpdateParams.typeUrl;

  @override
  List get values => [signer, params];

  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        IbcTypes.ibcConnectionMsgUpdateParamsResponse.typeUrl);
  }
}
