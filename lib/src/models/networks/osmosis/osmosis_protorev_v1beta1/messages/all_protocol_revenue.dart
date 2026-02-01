import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/messages/taker_fees_tracker.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/messages/tx_fees_tracker.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'cyclic_arb_tracker.dart';

class OsmosisProtorevAllProtocolRevenue extends CosmosMessage {
  final OsmosisPoolManagerTakerFeesTracker takerFeesTracker;
  final OsmosisTxfeesTxFeesTracker txFeesTracker;
  final OsmosisProtorevRouteCyclicArbTracker cyclicArbTracker;

  const OsmosisProtorevAllProtocolRevenue({
    required this.takerFeesTracker,
    required this.txFeesTracker,
    required this.cyclicArbTracker,
  });

  factory OsmosisProtorevAllProtocolRevenue.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevAllProtocolRevenue(
      takerFeesTracker: OsmosisPoolManagerTakerFeesTracker.deserialize(
        decode.getField(1),
      ),
      txFeesTracker: OsmosisTxfeesTxFeesTracker.deserialize(decode.getField(2)),
      cyclicArbTracker: OsmosisProtorevRouteCyclicArbTracker.deserialize(
        decode.getField(3),
      ),
    );
  }
  factory OsmosisProtorevAllProtocolRevenue.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisProtorevAllProtocolRevenue(
      takerFeesTracker: OsmosisPoolManagerTakerFeesTracker.fromJson(
        json["taker_fees_tracker"],
      ),
      txFeesTracker: OsmosisTxfeesTxFeesTracker.fromJson(
        json["tx_fees_tracker"],
      ),
      cyclicArbTracker: OsmosisProtorevRouteCyclicArbTracker.fromJson(
        json["cyclic_arb_tracker"],
      ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "taker_fees_tracker": takerFeesTracker.toJson(),
      "tx_fees_tracker": txFeesTracker.toJson(),
      "cyclic_arb_tracker": cyclicArbTracker.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.allProtocolRevenue;

  @override
  List get values => [takerFeesTracker, txFeesTracker, cyclicArbTracker];
}
