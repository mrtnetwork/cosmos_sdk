import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/models/tendermint/tendermint_p2p/messages/net_address.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

import 'p2p_message.dart';

class PexAddrs extends P2pMessage {
  final List<NetAddress> addrs;
  PexAddrs({required List<NetAddress> addrs}) : addrs = addrs.mutable;
  factory PexAddrs.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return PexAddrs(
        addrs:
            decode.getFileds(1).map((e) => NetAddress.deserialize(e)).toList());
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"addrs": addrs.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl => TendermintTypes.pexAddrs.typeUrl;

  @override
  List get values => [addrs];

  @override
  int get id => 2;
}
