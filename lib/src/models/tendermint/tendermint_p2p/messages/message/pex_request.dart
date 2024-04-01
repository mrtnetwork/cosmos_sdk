import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
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
  String get typeUrl => TendermintTypes.pexRequest.typeUrl;

  @override
  List get values => [];

  @override
  int get id => 1;
}
