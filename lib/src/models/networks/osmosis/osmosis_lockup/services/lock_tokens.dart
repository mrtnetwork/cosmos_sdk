import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'lock_tokens_response.dart';

class OsmosisLockupMsgLockTokens
    extends OsmosisLockup<OsmosisLockupMsgLockTokensResponse> {
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
      coins: decode
          .getFields<List<int>>(3)
          .map((e) => Coin.deserialize(e))
          .toList(),
    );
  }
  factory OsmosisLockupMsgLockTokens.fromJson(Map<String, dynamic> json) {
    return OsmosisLockupMsgLockTokens(
      owner: json.as("owner"),
      duration: ProtobufDuration.fromString(json.as("duration")),
      coins: json.asListOfMap("coins")?.map((e) => Coin.fromJson(e)).toList() ??
          [],
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  OsmosisLockupMsgLockTokensResponse onResponse(List<int> bytes) {
    return OsmosisLockupMsgLockTokensResponse.deserialize(bytes);
  }

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
  TypeUrl get typeUrl => OsmosisLockupTypes.msgLockTokens;

  @override
  List get values => [owner, duration, coins];
}
