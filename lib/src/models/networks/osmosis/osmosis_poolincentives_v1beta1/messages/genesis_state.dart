import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/messages/distr_info.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/messages/pool_to_gauges.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// GenesisState defines the pool incentives module's genesis state.
class OsmosisPoolincentivesGenesisState extends CosmosMessage {
  /// params defines all the paramaters of the module.
  final OsmosisPoolincentivesParams params;
  final List<ProtobufDuration> lockableDurations;
  final OsmosisPoolincentivesDistrInfo? distrInfo;
  final OsmosisPoolincentivesPoolToGauges? poolToGauges;

  OsmosisPoolincentivesGenesisState({
    required this.params,
    required List<ProtobufDuration> lockableDurations,
    this.distrInfo,
    this.poolToGauges,
  }) : lockableDurations = lockableDurations.immutable;
  factory OsmosisPoolincentivesGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesGenesisState(
      params: OsmosisPoolincentivesParams.deserialize(decode.getField(1)),
      lockableDurations:
          decode
              .getFields<List<int>>(2)
              .map((e) => ProtobufDuration.deserialize(e))
              .toList(),
      distrInfo: decode
          .getResult(3)
          ?.to<OsmosisPoolincentivesDistrInfo, List<int>>(
            (e) => OsmosisPoolincentivesDistrInfo.deserialize(e),
          ),
      poolToGauges: decode
          .getResult(4)
          ?.to<OsmosisPoolincentivesPoolToGauges, List<int>>(
            (e) => OsmosisPoolincentivesPoolToGauges.deserialize(e),
          ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "params": params.toJson(),
      "lockable_durations": lockableDurations.map((e) => e.toJson()).toList(),
      "distr_info": distrInfo?.toJson(),
      "pool_to_gauges": poolToGauges?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolincentivesV1beta1Types.genesisState;
  @override
  List get values => [params, lockableDurations, distrInfo, poolToGauges];
}
