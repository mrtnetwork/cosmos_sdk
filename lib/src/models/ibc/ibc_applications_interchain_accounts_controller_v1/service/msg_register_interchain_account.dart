import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/order.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_register_interchain_account_response.dart';

/// MsgRegisterInterchainAccount defines the payload for Msg/RegisterAccount
class MsgRegisterInterchainAccount
    extends IbcService<MsgRegisterInterchainAccountResponse> {
  final String? owner;
  final String? connectionId;
  final String? version;
  final IbcChannelOrder? ordering;
  const MsgRegisterInterchainAccount(
      {this.owner, this.connectionId, this.version, this.ordering});
  factory MsgRegisterInterchainAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgRegisterInterchainAccount(
        owner: decode.getField(1),
        connectionId: decode.getField(2),
        version: decode.getField(3),
        ordering: decode
            .getResult(4)
            ?.to<IbcChannelOrder, int>((e) => IbcChannelOrder.fromValue(e)));
  }
  factory MsgRegisterInterchainAccount.fromJson(Map<String, dynamic> json) {
    return MsgRegisterInterchainAccount(
        owner: json.as("owner"),
        connectionId: json.as("connection_id"),
        version: json.as("version"),
        ordering: json.maybeAs<IbcChannelOrder, String>(
            key: "ordering", onValue: IbcChannelOrder.fromValue));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "owner": owner,
      "connection_id": connectionId,
      "version": version,
      "ordering": ordering?.value
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgRegisterInterchainAccount;

  @override
  List get values => [owner, connectionId, version, ordering];

  @override
  List<String?> get signers => [owner];

  @override
  MsgRegisterInterchainAccountResponse onResponse(List<int> bytes) {
    return MsgRegisterInterchainAccountResponse.deserialize(bytes);
  }
}
