import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// RegisteredInterchainAccount contains a connection ID, port ID and associated interchain account address
class RegisteredInterchainAccount extends CosmosMessage {
  final String? connectionId;
  final String? portId;
  final String? accountAddress;
  const RegisteredInterchainAccount({
    this.connectionId,
    this.portId,
    this.accountAddress,
  });
  factory RegisteredInterchainAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return RegisteredInterchainAccount(
      connectionId: decode.getField(1),
      portId: decode.getField(2),
      accountAddress: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "connection_id": connectionId,
      "port_id": portId,
      "account_address": accountAddress,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.registeredInterchainAccount;

  @override
  List get values => [connectionId, portId, accountAddress];
}
