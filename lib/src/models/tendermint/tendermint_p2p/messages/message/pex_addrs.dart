import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/models/tendermint/tendermint_p2p/messages/net_address.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

import 'p2p_message.dart';

class PexAddrs extends P2pMessage {
  final List<NetAddress> addrs;
  PexAddrs({required List<NetAddress> addrs}) : addrs = addrs.immutable;
  factory PexAddrs.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return PexAddrs(
        addrs:
            decode.getFields(1).map((e) => NetAddress.deserialize(e)).toList());
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"addrs": addrs.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.pexAddrs;

  @override
  List get values => [addrs];

  @override
  int get id => 2;
}
