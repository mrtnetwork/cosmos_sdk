import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_controller_v1/messages/params.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpdateParams defines the payload for Msg/UpdateParams
class InterchainAccountsControllerMsgUpdateParams
    extends IbcService<EmptyServiceRequestResponse> {
  /// signer address
  final String? signer;

  /// params defines the 27-interchain-accounts/controller parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final InterchainAccountsControllerParams params;
  const InterchainAccountsControllerMsgUpdateParams({
    this.signer,
    required this.params,
  });
  factory InterchainAccountsControllerMsgUpdateParams.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InterchainAccountsControllerMsgUpdateParams(
      signer: decode.getField(1),
      params: InterchainAccountsControllerParams.deserialize(
        decode.getField(2),
      ),
    );
  }
  factory InterchainAccountsControllerMsgUpdateParams.fromJson(
    Map<String, dynamic> json,
  ) {
    return InterchainAccountsControllerMsgUpdateParams(
      signer: json.as("signer"),
      params: InterchainAccountsControllerParams.fromJson(json.asMap("params")),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"signer": signer, "params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.interchainAccountsControllerMsgUpdateParams;

  @override
  List get values => [signer, params];

  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      IbcTypes.interchainAccountsControllerMsgUpdateParamsResponse,
    );
  }
}
