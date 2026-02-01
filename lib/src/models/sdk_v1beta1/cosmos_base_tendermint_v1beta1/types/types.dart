import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class BaseTendermintV1beta1Types extends TypeUrl {
  const BaseTendermintV1beta1Types._(super.typeUrl, {super.query, super.rpc});
  static const BaseTendermintV1beta1Types getNodeInfoRequest =
      BaseTendermintV1beta1Types._(
        "/cosmos.base.tendermint.v1beta1.GetNodeInfoRequest",
        query: "/cosmos.base.tendermint.v1beta1.Service/GetNodeInfo",
        rpc: "/cosmos/base/tendermint/v1beta1/node_info",
      );
  static const BaseTendermintV1beta1Types getNodeInfoResponse =
      BaseTendermintV1beta1Types._(
        "/cosmos.base.tendermint.v1beta1.GetNodeInfoResponse",
      );
  static const BaseTendermintV1beta1Types module = BaseTendermintV1beta1Types._(
    "/cosmos.base.tendermint.v1beta1.Module",
  );
  static const BaseTendermintV1beta1Types versionInfo =
      BaseTendermintV1beta1Types._(
        "/cosmos.base.tendermint.v1beta1.VersionInfo",
      );
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
        "/cosmos.base.tendermint.v1beta1.GetSyncingRequest",
        query: "/cosmos.base.tendermint.v1beta1.Service/GetSyncing",
        rpc: "/cosmos/base/tendermint/v1beta1/syncing",
      );
  static const BaseTendermintV1beta1Types getSyncingResponse =
      BaseTendermintV1beta1Types._(
        "/cosmos.base.tendermint.v1beta1.GetSyncingResponse",
      );
  static const BaseTendermintV1beta1Types getLatestBlockRequest =
      BaseTendermintV1beta1Types._(
        "/cosmos.base.tendermint.v1beta1.GetLatestBlockRequest",
        query: "/cosmos.base.tendermint.v1beta1.Service/GetLatestBlock",
        rpc: "/cosmos/base/tendermint/v1beta1/blocks/latest",
      );
  static const BaseTendermintV1beta1Types getLatestBlockResponse =
      BaseTendermintV1beta1Types._(
        "/cosmos.base.tendermint.v1beta1.GetLatestBlockResponse",
      );
  static const BaseTendermintV1beta1Types getBlockByHeightRequest =
      BaseTendermintV1beta1Types._(
        "/cosmos.base.tendermint.v1beta1.GetBlockByHeightRequest",
        query: "/cosmos.base.tendermint.v1beta1.Service/GetBlockByHeight",
        rpc: "/cosmos/base/tendermint/v1beta1/blocks/:height",
      );
  static const BaseTendermintV1beta1Types getBlockByHeightResponse =
      BaseTendermintV1beta1Types._(
        "/cosmos.base.tendermint.v1beta1.GetBlockByHeightResponse",
      );
  static const BaseTendermintV1beta1Types getValidatorSetByHeightRequest =
      BaseTendermintV1beta1Types._(
        "/cosmos.base.tendermint.v1beta1.GetValidatorSetByHeightRequest",
        query:
            "/cosmos.base.tendermint.v1beta1.Service/GetValidatorSetByHeight",
        rpc: "/cosmos/base/tendermint/v1beta1/validatorsets/:height",
      );
  static const BaseTendermintV1beta1Types getValidatorSetByHeightResponse =
      BaseTendermintV1beta1Types._(
        "/cosmos.base.tendermint.v1beta1.GetValidatorSetByHeightResponse",
      );
  static const BaseTendermintV1beta1Types abciQueryRequest =
      BaseTendermintV1beta1Types._(
        "/cosmos.base.tendermint.v1beta1.ABCIQueryRequest",
        query: "/cosmos.base.tendermint.v1beta1.Service/ABCIQuery",
        rpc: "/cosmos/base/tendermint/v1beta1/abci_query",
      );
  static const BaseTendermintV1beta1Types abciQueryResponse =
      BaseTendermintV1beta1Types._(
        "/cosmos.base.tendermint.v1beta1.ABCIQueryResponse",
      );
}
