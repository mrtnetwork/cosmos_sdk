import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// GenesisState defines the gamm module's genesis state.
class OsmosisGammGenesisState extends CosmosMessage {
  final List<AnyMessage> pools;

  ///  will be renamed to next_pool_id in an upcoming version
  final BigInt? nextPoolNumber;
  final OsmosisGammParams? params;

  OsmosisGammGenesisState({
    required List<AnyMessage> pools,
    required this.nextPoolNumber,
    required this.params,
  }) : pools = pools.immutable;
  factory OsmosisGammGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammGenesisState(
      pools:
          decode
              .getFields<List<int>>(1)
              .map((e) => AnyMessage.deserialize(e))
              .toList(),
      nextPoolNumber: decode.getField(2),
      params: decode
          .getResult(3)
          ?.to<OsmosisGammParams, List<int>>(
            (e) => OsmosisGammParams.deserialize(e),
          ),
    );
  }

  factory OsmosisGammGenesisState.fromJson(Map<String, dynamic> json) {
    return OsmosisGammGenesisState(
      pools:
          (json["pools"] as List?)
              ?.map((e) => AnyMessage.fromJson(e))
              .toList() ??
          [],
      nextPoolNumber: BigintUtils.tryParse(json["next_pool_number"]),
      params:
          json["params"] == null
              ? null
              : OsmosisGammParams.fromJson(json["params"]),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pools": pools.map((e) => e.toJson()).toList(),
      "next_pool_number": nextPoolNumber?.toString(),
      "params": params?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.genesisState;

  @override
  List get values => [pools, nextPoolNumber, params];
}
