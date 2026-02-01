import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// Sender must be the pool's scaling_factor_governor in order for the tx to succeed. Adjusts stableswap scaling factors.
class OsmosisGammPoolmodelsStableSwapMsgStableSwapAdjustScalingFactors
    extends
        OsmosisGammPoolmodelsStableSwapV1Beta1<EmptyServiceRequestResponse> {
  final String? sender;
  final BigInt? poolId;
  final List<BigInt>? scalingFactors;

  OsmosisGammPoolmodelsStableSwapMsgStableSwapAdjustScalingFactors({
    this.sender,
    this.poolId,
    List<BigInt>? scalingFactors,
  }) : scalingFactors = scalingFactors?.emptyAsNull?.immutable;
  factory OsmosisGammPoolmodelsStableSwapMsgStableSwapAdjustScalingFactors.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammPoolmodelsStableSwapMsgStableSwapAdjustScalingFactors(
      sender: decode.getField(1),
      poolId: decode.getField(2),
      scalingFactors:
          decode
              .getResult<ProtocolBufferDecoderResult?>(3)
              ?.to<List<BigInt>, List<int>>(
                (e) => e.map((e) => BigintUtils.parse(e)).toList(),
              ) ??
          <BigInt>[],
    );
  }
  factory OsmosisGammPoolmodelsStableSwapMsgStableSwapAdjustScalingFactors.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisGammPoolmodelsStableSwapMsgStableSwapAdjustScalingFactors(
      sender: json.as("sender"),
      poolId: json.asBigInt("pool_id"),
      scalingFactors:
          json
              .as<List?>("scaling_factors")
              ?.map((e) => BigintUtils.parse(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      OsmosisGammPoolmodelsStableSwapV1beta1Types
          .msgStableSwapAdjustScalingFactorsResponse,
    );
  }

  @override
  List<String?> get signers => [sender];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "pool_id": poolId?.toString(),
      "scaling_factors": scalingFactors?.map((e) => e.toString()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisGammPoolmodelsStableSwapV1beta1Types
          .msgStableSwapAdjustScalingFactors;

  @override
  List get values => [sender, poolId, scalingFactors];
}
