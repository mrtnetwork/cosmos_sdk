import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/params.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class IbcClientMsgUpdateParams extends IbcService<EmptyServiceRequestResponse> {
  /// signer address
  final String? signer;

  /// params defines the client parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final IbcClientParams params;
  const IbcClientMsgUpdateParams({this.signer, required this.params});
  factory IbcClientMsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientMsgUpdateParams(
      signer: decode.getField(1),
      params: IbcClientParams.deserialize(decode.getField(2)),
    );
  }
  factory IbcClientMsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return IbcClientMsgUpdateParams(
      signer: json.as("signer"),
      params: IbcClientParams.fromJson(json.asMap("params")),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"signer": signer, "params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgUpdateParams;

  @override
  List get values => [signer, params];
  @override
  List<String?> get signers => [signer];
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(IbcTypes.msgUpdateParamsResponse);
  }
}
