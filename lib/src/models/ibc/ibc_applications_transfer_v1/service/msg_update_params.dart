import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v1/messages/params.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgUpdateParams is the Msg/UpdateParams request type.
class IbcTransferMsgUpdateParams extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// signer address
  final String? signer;

  /// params defines the transfer parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final IbcTransaferParams params;
  const IbcTransferMsgUpdateParams({this.signer, required this.params});
  factory IbcTransferMsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcTransferMsgUpdateParams(
      signer: decode.getField(1),
      params: IbcTransaferParams.deserialize(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get service => IbcTypes.ibcTransferUpdateParams;

  @override
  Map<String, dynamic> toJson() {
    return {"signer": signer, "params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcTransfermsgUpdateParams;

  @override
  List get values => [signer, params];

  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        IbcTypes.ibcTransfermsgUpdateParamsResponse);
  }
}
