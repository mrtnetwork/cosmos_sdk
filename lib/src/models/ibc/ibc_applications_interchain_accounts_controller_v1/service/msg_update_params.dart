import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_controller_v1/messages/params.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgUpdateParams defines the payload for Msg/UpdateParams
class InterchainAccountsControllerMsgUpdateParams extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// signer address
  final String? signer;

  /// params defines the 27-interchain-accounts/controller parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final InterchainAccountsControllerParams params;
  const InterchainAccountsControllerMsgUpdateParams(
      {this.signer, required this.params});
  factory InterchainAccountsControllerMsgUpdateParams.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InterchainAccountsControllerMsgUpdateParams(
      signer: decode.getField(1),
      params:
          InterchainAccountsControllerParams.deserialize(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"signer": signer, "params": params.toJson()};
  }

  @override
  String get typeUrl =>
      IbcTypes.interchainAccountsControllerMsgUpdateParams.typeUrl;

  @override
  List get values => [signer, params];

  @override
  String get service =>
      IbcTypes.interchainAccountsControllerUpdateParams.typeUrl;

  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        IbcTypes.interchainAccountsControllerMsgUpdateParamsResponse.typeUrl);
  }
}
