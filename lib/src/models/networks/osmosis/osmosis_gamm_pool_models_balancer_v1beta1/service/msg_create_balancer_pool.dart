import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_pool_models_balancer_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_pool_models_balancer_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/messages/pool_asset.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/messages/pool_params.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'msg_create_balancer_pool_response.dart';

class OsmosisGammPoolmodelsBalancerMsgCreateBalancerPool
    extends
        OsmosisGammPoolmodelsBalancerV1Beta1<
          OsmosisGammPoolmodelsBalancerMsgCreateBalancerPoolResponse
        > {
  final String? sender;
  final OsmosisGammPoolParams? poolParams;
  final List<OsmosisGammPoolAsset> poolAssets;
  final String? futurePoolGovernor;
  OsmosisGammPoolmodelsBalancerMsgCreateBalancerPool({
    this.sender,
    this.poolParams,
    required List<OsmosisGammPoolAsset> poolAssets,
    this.futurePoolGovernor,
  }) : poolAssets = poolAssets.immutable;
  factory OsmosisGammPoolmodelsBalancerMsgCreateBalancerPool.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammPoolmodelsBalancerMsgCreateBalancerPool(
      sender: decode.getField(1),
      poolParams: decode
          .getResult(2)
          ?.to<OsmosisGammPoolParams, List<int>>(
            (e) => OsmosisGammPoolParams.deserialize(e),
          ),
      poolAssets:
          decode
              .getFields<List<int>>(3)
              .map((e) => OsmosisGammPoolAsset.deserialize(e))
              .toList(),
      futurePoolGovernor: decode.getField(4),
    );
  }
  factory OsmosisGammPoolmodelsBalancerMsgCreateBalancerPool.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisGammPoolmodelsBalancerMsgCreateBalancerPool(
      sender: json.as("sender"),
      poolParams: json.maybeAs<OsmosisGammPoolParams, Map<String, dynamic>>(
        key: "pool_params",
        onValue: (e) => OsmosisGammPoolParams.fromJson(e),
      ),
      poolAssets:
          json
              .asListOfMap("pool_assets")
              ?.map((e) => OsmosisGammPoolAsset.fromJson(e))
              .toList() ??
          [],
      futurePoolGovernor: json.as("future_pool_governor"),
    );
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "pool_params": poolParams?.toJson(),
      "pool_assets": poolAssets.map((e) => e.toJson()).toList(),
      "future_pool_governor": futurePoolGovernor,
    };
  }

  @override
  List get values => [sender, poolParams, poolAssets, futurePoolGovernor];

  @override
  TypeUrl get typeUrl =>
      OsmosisGammPoolmodelsBalancerV1beta1Types.msgCreateBalancerPool;

  @override
  List<String?> get signers => [sender];

  @override
  OsmosisGammPoolmodelsBalancerMsgCreateBalancerPoolResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisGammPoolmodelsBalancerMsgCreateBalancerPoolResponse.deserialize(
      bytes,
    );
  }
}
