import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_host_v1/ibc_applications_interchain_accounts_host_v1.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpdateParams defines the payload for Msg/UpdateParams
class InterchainAccountsHostUpdateParams
    extends IbcService<EmptyServiceRequestResponse> {
  /// signer address
  final String? signer;

  /// params defines the 27-interchain-accounts/host parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final InterchainAccountsHostParams params;
  const InterchainAccountsHostUpdateParams({this.signer, required this.params});
  factory InterchainAccountsHostUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InterchainAccountsHostUpdateParams(
      signer: decode.getField(1),
      params: InterchainAccountsHostParams.deserialize(decode.getField(2)),
    );
  }
  factory InterchainAccountsHostUpdateParams.fromJson(
    Map<String, dynamic> json,
  ) {
    return InterchainAccountsHostUpdateParams(
      signer: json.as("signer"),
      params: InterchainAccountsHostParams.fromJson(json.asMap("params")),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

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
      IbcTypes.interchainAccountsHostMsgUpdateParamsResponse,
    );
  }
}
