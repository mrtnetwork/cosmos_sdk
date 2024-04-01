import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/connection_paths.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/identified_connection.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// GenesisState defines the ibc connection submodule's genesis state.
class IbcConnectionGenesisState extends CosmosMessage {
  final List<IbcConnectionIdentifiedConnection> connections;
  final List<IbcConnectConnectionPaths> clientConnectionPaths;

  /// the sequence for the next generated connection identifier
  final BigInt? nextConnectionSequence;
  final IbcConnectionParams params;
  IbcConnectionGenesisState(
      {required List<IbcConnectionIdentifiedConnection> connections,
      required List<IbcConnectConnectionPaths> clientConnectionPaths,
      this.nextConnectionSequence,
      required this.params})
      : connections = connections.mutable,
        clientConnectionPaths = clientConnectionPaths.mutable;
  factory IbcConnectionGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionGenesisState(
        connections: decode
            .getFileds(1)
            .map((e) => IbcConnectionIdentifiedConnection.deserialize(e))
            .toList(),
        clientConnectionPaths: decode
            .getFileds(2)
            .map((e) => IbcConnectConnectionPaths.deserialize(e))
            .toList(),
        nextConnectionSequence: decode.getField(3),
        params: IbcConnectionParams.deserialize(decode.getField(4)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "connections": connections.map((e) => e.toJson()).toList(),
      "client_connection_paths":
          clientConnectionPaths.map((e) => e.toJson()).toList(),
      "next_connection_sequence": nextConnectionSequence?.toString(),
      "params": params.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.ibcConnectionGenesisState.typeUrl;

  @override
  List get values =>
      [connections, clientConnectionPaths, nextConnectionSequence, params];
}
