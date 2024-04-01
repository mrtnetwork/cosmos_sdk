import 'package:cosmos_sdk/src/models/ibc/ibc_core_commitment_v1/messages/merkle_prefix.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Counterparty defines the counterparty chain associated with a connection end.
class IbcConnectionCounterparty extends CosmosMessage {
  /// identifies the client on the counterparty chain associated with a given
  /// connection.
  final String? clientId;

  /// identifies the connection end on the counterparty chain associated with a
  /// given connection.
  final String? connectionId;

  /// commitment merkle prefix of the counterparty chain.
  final IbcCommitmentMerklePrefix prefix;
  const IbcConnectionCounterparty(
      {this.clientId, this.connectionId, required this.prefix});
  factory IbcConnectionCounterparty.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionCounterparty(
      clientId: decode.getField(1),
      connectionId: decode.getField(2),
      prefix: IbcCommitmentMerklePrefix.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "connection_id": connectionId,
      "prefix": prefix.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.ibcConnectionCounterparty.typeUrl;

  @override
  List get values => [clientId, connectionId, prefix];
}
