import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

import 'denom_pair_taker_fee.dart';

/// DenomPairTakerFeeProposal is a type for adding/removing a custom taker fee(s) for one or more denom pairs.
class OsmosisPoolManagerDenomPairTakerFeeProposal extends CosmosMessage {
  final String? title;
  final String? description;
  final List<OsmosisPoolManagerDenomPairTakerFee> denomPairTakerFee;

  OsmosisPoolManagerDenomPairTakerFeeProposal({
    this.title,
    this.description,
    required List<OsmosisPoolManagerDenomPairTakerFee> denomPairTakerFee,
  }) : denomPairTakerFee = denomPairTakerFee.immutable;
  factory OsmosisPoolManagerDenomPairTakerFeeProposal.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerDenomPairTakerFeeProposal(
        title: decode.getField(1),
        description: decode.getField(2),
        denomPairTakerFee: decode
            .getFields(3)
            .map((e) => OsmosisPoolManagerDenomPairTakerFee.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "denom_pair_taker_fee": denomPairTakerFee.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl =>
      OsmosisPoolManagerV1beta1Types.denomPairTakerFeeProposal.typeUrl;

  @override
  List get values => [title, description, denomPairTakerFee];
}
