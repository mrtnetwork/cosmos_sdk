import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_host_v1/messages/query_request.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

import 'msg_module_query_safe_response.dart';

/// ModuleQuerySafe defines a rpc handler for MsgModuleQuerySafe.
class InterchainAccountsHostModuleQuerySafe extends CosmosMessage
    with ServiceMessage<InterchainAccountsHostMsgModuleQuerySafeResponse> {
  /// signer address
  final String? signer;

  /// requests defines the module safe queries to execute.
  final List<InterchainAccountsHostQueryRequest>? requests;
  InterchainAccountsHostModuleQuerySafe(
      {this.signer, List<InterchainAccountsHostQueryRequest>? requests})
      : requests = requests?.nullOnEmpy;
  factory InterchainAccountsHostModuleQuerySafe.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InterchainAccountsHostModuleQuerySafe(
      signer: decode.getField(1),
      requests: decode
          .getFields(2)
          .map((e) => InterchainAccountsHostQueryRequest.deserialize(bytes))
          .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get service => IbcTypes.interchainAccountsHostModuleQuerySafe.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "signer": signer,
      "requests": requests?.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl =>
      IbcTypes.interchainAccountsHostMsgModuleQuerySafe.typeUrl;

  @override
  List get values => [signer, requests];
  @override
  List<String?> get signers => [signer];

  @override
  InterchainAccountsHostMsgModuleQuerySafeResponse onResponse(List<int> bytes) {
    return InterchainAccountsHostMsgModuleQuerySafeResponse.deserialize(bytes);
  }
}
