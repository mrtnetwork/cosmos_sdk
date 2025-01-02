import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'p2p_message.dart';

class PexRequest extends P2pMessage {
  ///  This message has no fields.
  const PexRequest();
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.pexRequest;

  @override
  List get values => [];

  @override
  int get id => 1;
}
