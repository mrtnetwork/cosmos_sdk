import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class BaseTendermintV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc;
  const BaseTendermintV1beta1Types._(this.typeUrl, {this.rpc});
  static const BaseTendermintV1beta1Types getNodeInfoRequest =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.GetNodeInfoRequest");
  static const BaseTendermintV1beta1Types getNodeInfoResponse =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.GetNodeInfoResponse");
  static const BaseTendermintV1beta1Types module =
      BaseTendermintV1beta1Types._("/cosmos.base.tendermint.v1beta1.Module");
  static const BaseTendermintV1beta1Types versionInfo =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.VersionInfo");
  static const BaseTendermintV1beta1Types cosmosValidator =
      BaseTendermintV1beta1Types._("/cosmos.base.tendermint.v1beta1.Validator");
  static const BaseTendermintV1beta1Types cosmosProofOp =
      BaseTendermintV1beta1Types._("/cosmos.base.tendermint.v1beta1.ProofOp");
  static const BaseTendermintV1beta1Types cosmosProofOps =
      BaseTendermintV1beta1Types._("/cosmos.base.tendermint.v1beta1.ProofOps");
  static const BaseTendermintV1beta1Types cosmosHeader =
      BaseTendermintV1beta1Types._("/cosmos.base.tendermint.v1beta1.Header");
  static const BaseTendermintV1beta1Types cosmosBlock =
      BaseTendermintV1beta1Types._("/cosmos.base.tendermint.v1beta1.Block");
  static const BaseTendermintV1beta1Types getSyncingRequest =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.GetSyncingRequest");
  static const BaseTendermintV1beta1Types getSyncingResponse =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.GetSyncingResponse");
  static const BaseTendermintV1beta1Types getLatestBlockRequest =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.GetLatestBlockRequest");
  static const BaseTendermintV1beta1Types getLatestBlockResponse =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.GetLatestBlockResponse");
  static const BaseTendermintV1beta1Types getBlockByHeightRequest =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.GetBlockByHeightRequest");
  static const BaseTendermintV1beta1Types getBlockByHeightResponse =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.GetBlockByHeightResponse");
  static const BaseTendermintV1beta1Types getValidatorSetByHeightRequest =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.GetValidatorSetByHeightRequest");
  static const BaseTendermintV1beta1Types getValidatorSetByHeightResponse =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.GetValidatorSetByHeightResponse");
  static const BaseTendermintV1beta1Types abciQueryRequest =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.ABCIQueryRequest");
  static const BaseTendermintV1beta1Types abciQueryResponse =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.ABCIQueryResponse");

  /// queries
  static const BaseTendermintV1beta1Types getNodeInfo =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.Service/GetNodeInfo");
  static const BaseTendermintV1beta1Types getSyncing =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.Service/GetSyncing");
  static const BaseTendermintV1beta1Types getLatestBlock =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.Service/GetLatestBlock",
          rpc: "/cosmos/base/tendermint/v1beta1/blocks/latest");
  static const BaseTendermintV1beta1Types getBlockByHeight =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.Service/GetBlockByHeight");
  static const BaseTendermintV1beta1Types getValidatorSetByHeight =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.Service/GetValidatorSetByHeight");
  static const BaseTendermintV1beta1Types abciQuery =
      BaseTendermintV1beta1Types._(
          "/cosmos.base.tendermint.v1beta1.Service/ABCIQuery");
}
