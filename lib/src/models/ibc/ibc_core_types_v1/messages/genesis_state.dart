import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/genesis_state.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/genesis_state.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/genesis_state.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class IbcTypeGenesisState extends CosmosMessage {
  final IbcClientGenesisState clientGenesis;
  final IbcConnectionGenesisState connectionGenesis;
  final IbcChannelGenesisState channelGenesis;
  const IbcTypeGenesisState(
      {required this.channelGenesis,
      required this.clientGenesis,
      required this.connectionGenesis});
  factory IbcTypeGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcTypeGenesisState(
        channelGenesis: IbcChannelGenesisState.deserialize(decode.getField(3)),
        clientGenesis: IbcClientGenesisState.deserialize(decode.getField(1)),
        connectionGenesis:
            IbcConnectionGenesisState.deserialize(decode.getField(2)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_genesis": clientGenesis.toJson(),
      "connection_genesis": connectionGenesis.toJson(),
      "channel_genesis": channelGenesis.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcTypeGenesisState;

  @override
  List get values => [clientGenesis, connectionGenesis, channelGenesis];
}
