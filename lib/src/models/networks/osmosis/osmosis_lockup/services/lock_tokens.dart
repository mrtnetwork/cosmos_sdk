import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

import 'lock_tokens_response.dart';

class OsmosisLockupMsgLockTokens extends CosmosMessage
    with ServiceMessage<OsmosisLockupMsgLockTokensResponse> {
  final String? owner;
  final ProtobufDuration duration;
  final List<Coin> coins;
  OsmosisLockupMsgLockTokens(
      {this.owner, required this.duration, required List<Coin> coins})
      : coins = coins.immutable;
  factory OsmosisLockupMsgLockTokens.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupMsgLockTokens(
      owner: decode.getField(1),
      duration: ProtobufDuration.deserialize(decode.getField(2)),
      coins: decode.getFields(3).map((e) => Coin.deserialize(e)).toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  OsmosisLockupMsgLockTokensResponse onResponse(List<int> bytes) {
    return OsmosisLockupMsgLockTokensResponse.deserialize(bytes);
  }

  @override
  String get service => OsmosisLockupTypes.lockTokens.typeUrl;

  @override
  List<String?> get signers => [owner];

  @override
  Map<String, dynamic> toJson() {
    return {
      "owner": owner,
      "duration": duration.toJson(),
      "coins": coins.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisLockupTypes.msgLockTokens.typeUrl;

  @override
  List get values => [owner, duration, coins];
}
