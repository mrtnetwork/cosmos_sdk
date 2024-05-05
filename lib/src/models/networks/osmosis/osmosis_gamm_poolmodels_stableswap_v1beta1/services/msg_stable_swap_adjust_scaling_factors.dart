import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// Sender must be the pool's scaling_factor_governor in order for the tx to succeed. Adjusts stableswap scaling factors.
class OsmosisGammPoolmodelsStableSwapMsgStableSwapAdjustScalingFactors
    extends CosmosMessage with ServiceMessage<EmptyServiceRequestResponse> {
  final String? sender;
  final BigInt? poolId;
  final List<BigInt>? scalingFactors;

  OsmosisGammPoolmodelsStableSwapMsgStableSwapAdjustScalingFactors(
      {this.sender, this.poolId, List<BigInt>? scalingFactors})
      : scalingFactors = scalingFactors?.nullOnEmpy;
  factory OsmosisGammPoolmodelsStableSwapMsgStableSwapAdjustScalingFactors.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammPoolmodelsStableSwapMsgStableSwapAdjustScalingFactors(
      sender: decode.getField(1),
      poolId: decode.getField(2),
      scalingFactors: decode.getFields<BigInt>(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisGammPoolmodelsStableswaPV1beta1Types
            .msgStableSwapAdjustScalingFactorsResponse.typeUrl);
  }

  @override
  String get service => OsmosisGammPoolmodelsStableswaPV1beta1Types
      .stableSwapAdjustScalingFactors.typeUrl;

  @override
  List<String?> get signers => [sender];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "pool_id": poolId?.toString(),
      "scaling_factors": scalingFactors?.map((e) => e.toString()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisGammPoolmodelsStableswaPV1beta1Types
      .msgStableSwapAdjustScalingFactors.typeUrl;

  @override
  List get values => [sender, poolId, scalingFactors];
}
