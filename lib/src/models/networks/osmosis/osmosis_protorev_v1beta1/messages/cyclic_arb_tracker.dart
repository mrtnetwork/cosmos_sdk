import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisProtorevRouteCyclicArbTracker extends CosmosMessage {
  /// profits is the total profit from all trades on this route)
  final List<Coin> cyclicArb;

  final BigInt? heightAccountingStartsFrom;

  OsmosisProtorevRouteCyclicArbTracker(
      {required List<Coin> cyclicArb, this.heightAccountingStartsFrom})
      : cyclicArb = cyclicArb.immutable;

  factory OsmosisProtorevRouteCyclicArbTracker.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevRouteCyclicArbTracker(
        cyclicArb: decode
            .getFields<List<int>>(1)
            .map((e) => Coin.deserialize(e))
            .toList(),
        heightAccountingStartsFrom: decode.getField(2));
  }
  factory OsmosisProtorevRouteCyclicArbTracker.fromJson(
      Map<String, dynamic> json) {
    return OsmosisProtorevRouteCyclicArbTracker(
        cyclicArb: (json["cyclic_arb"] as List?)
                ?.map((e) => Coin.fromJson(e))
                .toList() ??
            <Coin>[],
        heightAccountingStartsFrom:
            BigintUtils.tryParse(json["height_accounting_starts_from"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "height_accounting_starts_from": heightAccountingStartsFrom?.toString(),
      "cyclic_arb": cyclicArb.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.cyclicArbTracker;

  @override
  List get values => [cyclicArb, heightAccountingStartsFrom];
}
