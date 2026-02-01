import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v1/messages/params.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpdateParams is the Msg/UpdateParams request type.
class IbcTransferMsgUpdateParams
    extends IbcService<EmptyServiceRequestResponse> {
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
  factory IbcTransferMsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return IbcTransferMsgUpdateParams(
      signer: json.as("signer"),
      params: IbcTransaferParams.fromJson(json.asMap("params")),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

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
      IbcTypes.ibcTransfermsgUpdateParamsResponse,
    );
  }
}
