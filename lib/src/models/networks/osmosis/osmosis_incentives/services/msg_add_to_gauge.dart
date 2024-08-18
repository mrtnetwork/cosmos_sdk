import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// MsgAddToGauge adds coins to a previously created gauge
class OsmosisIncentiveMsgAddToGauge extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// owner is the gauge owner's address
  final String? owner;

  /// gauge_id is the ID of gauge that rewards are getting added to
  final BigInt? gaugeId;

  /// rewards are the coin(s) to add to gauge
  final List<Coin> rewards;

  OsmosisIncentiveMsgAddToGauge(
      {this.gaugeId, this.owner, required List<Coin> rewards})
      : rewards = rewards.immutable;
  factory OsmosisIncentiveMsgAddToGauge.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveMsgAddToGauge(
        owner: decode.getField(1),
        gaugeId: decode.getField(2),
        rewards: decode.getFields(3).map((e) => Coin.deserialize(e)).toList());
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get service => OsmosisIncentivesTypes.addToGauge.typeUrl;

  @override
  List<String?> get signers => [owner];

  @override
  Map<String, dynamic> toJson() {
    return {
      "owner": owner,
      "gauge_id": gaugeId?.toString(),
      "rewards": rewards.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisIncentivesTypes.msgAddToGauge.typeUrl;

  @override
  List get values => [owner, gaugeId, rewards];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisIncentivesTypes.msgAddToGaugeResponse.typeUrl);
  }
}
