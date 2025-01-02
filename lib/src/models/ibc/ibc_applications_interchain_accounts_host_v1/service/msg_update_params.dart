import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgUpdateParams defines the payload for Msg/UpdateParams
class InterchainAccountsHostUpdateParams extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// signer address
  final String? signer;

  /// params defines the 27-interchain-accounts/host parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final InterchainAccountsHostUpdateParams params;
  const InterchainAccountsHostUpdateParams({this.signer, required this.params});
  factory InterchainAccountsHostUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InterchainAccountsHostUpdateParams(
      signer: decode.getField(1),
      params:
          InterchainAccountsHostUpdateParams.deserialize(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get service => IbcTypes.interchainAccountsHostUpdateParams;

  @override
  Map<String, dynamic> toJson() {
    return {"signer": signer, "params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.interchainAccountsHostMsgUpdateParams;

  @override
  List get values => [signer, params];
  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        IbcTypes.interchainAccountsHostMsgUpdateParamsResponse);
  }
}
