import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// IdentifiedClientState defines a client state with an additional client identifier field.
class IbcClientIdentifiedClientState extends CosmosMessage {
  /// client identifier
  final String? clientID;

  /// client state
  final Any? clientState;
  const IbcClientIdentifiedClientState({this.clientID, this.clientState});
  factory IbcClientIdentifiedClientState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientIdentifiedClientState(
        clientID: decode.getField(1),
        clientState:
            decode.getResult(2)?.to<Any, List<int>>((e) => Any.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"client_id": clientID, "client_state": clientState?.toJson()};
  }

  @override
  String get typeUrl => IbcTypes.identifiedClientState.typeUrl;

  @override
  List get values => [clientID, clientState];
}
