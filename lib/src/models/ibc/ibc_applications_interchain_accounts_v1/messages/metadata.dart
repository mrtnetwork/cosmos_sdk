import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Metadata defines a set of protocol specific data encoded into the ICS27 channel version bytestring See
/// ICS004: https://github.com/cosmos/ibc/tree/master/spec/core/ics-004-channel-and-packet-semantics#Versioning
class IbcInterchainAccount extends CosmosMessage {
  /// version defines the ICS27 protocol version
  final String? version;

  /// controller_connection_id is the connection identifier associated with the controller chain
  final String? controllerConnectionId;

  /// host_connection_id is the connection identifier associated with the host chain
  final String? hostConnectionId;

  /// address defines the interchain account address to be fulfilled upon the OnChanOpenTry handshake step
  /// NOTE: the address field is empty on the OnChanOpenInit handshake step
  final String? address;

  /// encoding defines the supported codec format
  final String? encoding;

  /// tx_type defines the type of transactions the interchain account can execute
  final String? txType;
  const IbcInterchainAccount(
      {this.version,
      this.controllerConnectionId,
      this.hostConnectionId,
      this.address,
      this.encoding,
      this.txType});
  factory IbcInterchainAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcInterchainAccount(
        version: decode.getField(1),
        controllerConnectionId: decode.getField(2),
        hostConnectionId: decode.getField(3),
        address: decode.getField(4),
        encoding: decode.getField(5),
        txType: decode.getField(6));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "version": version,
      "controller_connection_id": controllerConnectionId,
      "host_connection_id": hostConnectionId,
      "address": address,
      "encoding": encoding,
      "tx_type": txType
    };
  }

  @override
  String get typeUrl => IbcTypes.interchainAccountMetadata.typeUrl;

  @override
  List get values => [
        version,
        controllerConnectionId,
        hostConnectionId,
        address,
        encoding,
        txType
      ];
}
