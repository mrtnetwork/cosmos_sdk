import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ClientState defines the 09-localhost client state
class IbcLightClientsClientState extends CosmosMessage {
  /// the latest block height
  final IbcClientHeight latestHeight;
  const IbcLightClientsClientState(this.latestHeight);
  factory IbcLightClientsClientState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcLightClientsClientState(
        IbcClientHeight.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"latest_height": latestHeight.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcLightClientsClientState;

  @override
  List get values => [latestHeight];
}
