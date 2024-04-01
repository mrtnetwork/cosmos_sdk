import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_v1/messages/interchain_account_packet_data.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'msg_send_tx_response.dart';

/// MsgSendTx defines the payload for Msg/SendTx
class MsgSendTx extends CosmosMessage with ServiceMessage<MsgSendTxResponse> {
  final String? owner;
  final String? connectionId;
  final InterchainAccountPacketData packetData;

  /// Relative timeout timestamp provided will be added to the current block time during transaction execution.
  /// The timeout timestamp must be non-zero.
  final BigInt? relativeTimeout;
  const MsgSendTx(
      {this.owner,
      this.connectionId,
      required this.packetData,
      this.relativeTimeout});
  factory MsgSendTx.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgSendTx(
        owner: decode.getField(1),
        connectionId: decode.getField(2),
        packetData: InterchainAccountPacketData.deserialize(decode.getField(3)),
        relativeTimeout: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  String get service => IbcTypes.serviceMsgSendTx.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "owner": owner,
      "connection_id": connectionId,
      "packet_data": packetData.toJson(),
      "relative_timeout": relativeTimeout?.toString()
    };
  }

  @override
  String get typeUrl => IbcTypes.msgSendTx.typeUrl;

  @override
  List get values => [owner, connectionId, packetData, relativeTimeout];

  @override
  List<String?> get signers => [owner];

  @override
  MsgSendTxResponse onResponse(List<int> bytes) {
    return MsgSendTxResponse.deserialize(bytes);
  }
}
