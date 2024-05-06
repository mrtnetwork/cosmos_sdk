import 'package:blockchain_utils/numbers/numbers.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'rewards_est_response.dart';

/// RewardsEst returns an estimate of the rewards from now until a specified time in the future
/// The querier either provides an address or a set of locks for which they want to find the associated rewards
class OsmosisIncentiveRewardsEstRequest extends CosmosMessage
    with
        QueryMessage<OsmosisIncentiveRewardsEstResponse>,
        RPCMessage<OsmosisIncentiveRewardsEstResponse> {
  /// Address that is being queried for future estimated rewards
  final String? owner;

  /// Lock IDs included in future reward estimation
  final List<BigInt>? lockIds;

  /// Upper time limit of reward estimation
  /// Lower limit is current epoch
  final BigInt? endEpoch;

  OsmosisIncentiveRewardsEstRequest(
      {this.owner, List<BigInt>? lockIds, this.endEpoch})
      : lockIds = lockIds?.nullOnEmpy;
  factory OsmosisIncentiveRewardsEstRequest.fromBytes(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveRewardsEstRequest(
        owner: decode.getField(1),
        lockIds: decode
                .getResult<ProtocolBufferDecoderResult?>(2)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[],
        endEpoch: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  OsmosisIncentiveRewardsEstResponse onResponse(List<int> bytes) {
    return OsmosisIncentiveRewardsEstResponse.deserialize(bytes);
  }

  @override
  String get queryPath => OsmosisIncentivesTypes.rewardsEst.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "owner": owner,
      "lock_ids": lockIds?.map((e) => e.toString()).toList(),
      "end_epoch": endEpoch?.toString()
    };
  }

  @override
  String get typeUrl => OsmosisIncentivesTypes.rewardsEstRequest.typeUrl;

  @override
  List get values => [owner, lockIds, endEpoch];

  @override
  OsmosisIncentiveRewardsEstResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisIncentiveRewardsEstResponse.fromRpc(json);
  }

  @override
  Map<String, String> get queryParameters => {};

  @override
  String get rpcPath =>
      OsmosisIncentivesTypes.rewardsEst.rpcUrl(pathParameters: [owner]);
}
