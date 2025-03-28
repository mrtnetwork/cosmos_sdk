import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class CosmWasmV1Types extends TypeUrl {
  const CosmWasmV1Types._(super.typeUrl,
      {super.query, super.rpc, super.aminoType});
  static const CosmWasmV1Types codeInfoResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.CodeInfoResponse");
  static const CosmWasmV1Types accessTypeParam =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.AccessTypeParam");
  static const CosmWasmV1Types params =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.Params");
  static const CosmWasmV1Types accessConfig =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.AccessConfig");
  static const CosmWasmV1Types msgStoreCode =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgStoreCode");
  static const CosmWasmV1Types msgStoreCodeResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgStoreCodeResponse");
  static const CosmWasmV1Types msgInstantiateContract =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgInstantiateContract");
  static const CosmWasmV1Types msgInstantiateContract2 =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgInstantiateContract2");
  static const CosmWasmV1Types msgInstantiateContractResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgInstantiateContractResponse");
  static const CosmWasmV1Types msgInstantiateContract2Response =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgInstantiateContract2Response");
  static const CosmWasmV1Types msgMigrateContractResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgMigrateContractResponse");
  static const CosmWasmV1Types msgSudoContractResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgSudoContractResponse");
  static const CosmWasmV1Types msgStoreAndInstantiateContractResponse =
      CosmWasmV1Types._(
          "/cosmwasm.wasm.v1.MsgStoreAndInstantiateContractResponse");
  static const CosmWasmV1Types msgUpdateContractLabel =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgUpdateContractLabel");

  static const CosmWasmV1Types msgExecuteContract = CosmWasmV1Types._(
      "/cosmwasm.wasm.v1.MsgExecuteContract",
      aminoType: "wasm/MsgExecuteContract");
  static const CosmWasmV1Types msgMigrateContract =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgMigrateContract");
  static const CosmWasmV1Types msgUpdateAdmin =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgUpdateAdmin");
  static const CosmWasmV1Types msgUpdateAdminResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgUpdateAdminResponse");
  static const CosmWasmV1Types msgClearAdmin =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgClearAdmin");
  static const CosmWasmV1Types msgClearAdminResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgClearAdminResponse");
  static const CosmWasmV1Types msgUpdateInstantiateConfig =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgUpdateInstantiateConfig");
  static const CosmWasmV1Types msgUpdateInstantiateConfigResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgUpdateInstantiateConfigResponse");
  static const CosmWasmV1Types msgUpdateParams =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgUpdateParams");
  static const CosmWasmV1Types msgUpdateParamsResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgUpdateParamsResponse");
  static const CosmWasmV1Types msgSudoContract =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgSudoContract");
  static const CosmWasmV1Types msgPinCodes =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgPinCodes");
  static const CosmWasmV1Types msgPinCodesResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgPinCodesResponse");
  static const CosmWasmV1Types msgUnpinCodes =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgUnpinCodes");
  static const CosmWasmV1Types msgUnpinCodesResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgUnpinCodesResponse");
  static const CosmWasmV1Types msgStoreAndInstantiateContract =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgStoreAndInstantiateContract");
  static const CosmWasmV1Types msgRemoveCodeUploadParamsAddresses =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgRemoveCodeUploadParamsAddresses");
  static const CosmWasmV1Types msgRemoveCodeUploadParamsAddressesResponse =
      CosmWasmV1Types._(
          "/cosmwasm.wasm.v1.MsgRemoveCodeUploadParamsAddressesResponse");
  static const CosmWasmV1Types msgAddCodeUploadParamsAddresses =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgAddCodeUploadParamsAddresses");
  static const CosmWasmV1Types msgAddCodeUploadParamsAddressesResponse =
      CosmWasmV1Types._(
          "/cosmwasm.wasm.v1.MsgAddCodeUploadParamsAddressesResponse");
  static const CosmWasmV1Types msgStoreAndMigrateContract =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgStoreAndMigrateContract");
  static const CosmWasmV1Types msgStoreAndMigrateContractResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgStoreAndMigrateContractResponse");
  static const CosmWasmV1Types msgUpdateContractLabelResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.MsgUpdateContractLabelResponse");

  static const CosmWasmV1Types absoluteTxPosition =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.AbsoluteTxPosition");
  static const CosmWasmV1Types contractInfo =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.ContractInfo");
  static const CosmWasmV1Types contractCodeHistoryEntry =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.ContractCodeHistoryEntry");
  static const CosmWasmV1Types contractGrant =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.ContractGrant");
  static const CosmWasmV1Types model =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.Model");

  /// guery
  static const CosmWasmV1Types queryContractInfoRequest = CosmWasmV1Types._(
      "/cosmwasm.wasm.v1.QueryContractInfoRequest",
      rpc: "/cosmwasm/wasm/v1/contract/:address",
      query: "/cosmwasm.wasm.v1.Query/ContractInfo");
  static const CosmWasmV1Types queryContractHistoryRequest = CosmWasmV1Types._(
      "/cosmwasm.wasm.v1.QueryContractHistoryRequest",
      rpc: "/cosmwasm/wasm/v1/contract/:address/history",
      query: "/cosmwasm.wasm.v1.Query/ContractHistory");
  static const CosmWasmV1Types queryContractsByCodeRequest = CosmWasmV1Types._(
      "/cosmwasm.wasm.v1.QueryContractsByCodeRequest",
      rpc: "/cosmwasm/wasm/v1/code/:code_id/contracts",
      query: "/cosmwasm.wasm.v1.Query/ContractsByCode");

  static const CosmWasmV1Types queryAllContractState = CosmWasmV1Types._(
      "/cosmwasm.wasm.v1.QueryAllContractStateRequest",
      rpc: "/cosmwasm/wasm/v1/contract/:address/state",
      query: "/cosmwasm.wasm.v1.Query/AllContractState");
  static const CosmWasmV1Types queryRawContractState = CosmWasmV1Types._(
      "/cosmwasm.wasm.v1.QueryRawContractStateRequest",
      rpc: "/cosmwasm/wasm/v1/contract/:address/raw/:query_data",
      query: "/cosmwasm.wasm.v1.Query/RawContractState");

  static const CosmWasmV1Types querySmartContractState = CosmWasmV1Types._(
      "/cosmwasm.wasm.v1.QuerySmartContractStateRequest",
      rpc: "/cosmwasm/wasm/v1/contract/:address/smart/:query_data",
      query: "/cosmwasm.wasm.v1.Query/SmartContractState");

  static const CosmWasmV1Types queryCode = CosmWasmV1Types._(
      "/cosmwasm.wasm.v1.QueryCodeRequest",
      rpc: "/cosmwasm/wasm/v1/code/:code_id",
      query: "/cosmwasm.wasm.v1.Query/Code");
  static const CosmWasmV1Types queryCodes = CosmWasmV1Types._(
      "/cosmwasm.wasm.v1.QueryCodesRequest",
      rpc: "/cosmwasm/wasm/v1/code",
      query: "/cosmwasm.wasm.v1.Query/Codes");
  static const CosmWasmV1Types queryCodeInfo = CosmWasmV1Types._(
      "/cosmwasm.wasm.v1.QueryCodeInfoRequest",
      rpc: "/cosmwasm/wasm/v1/code-info/:code_id",
      query: "/cosmwasm.wasm.v1.Query/CodeInfo");

  static const CosmWasmV1Types queryPinnedCodes = CosmWasmV1Types._(
      "/cosmwasm.wasm.v1.QueryPinnedCodesRequest",
      rpc: "/cosmwasm/wasm/v1/codes/pinned",
      query: "/cosmwasm.wasm.v1.Query/PinnedCodes");
  static const CosmWasmV1Types queryParams = CosmWasmV1Types._(
      "/cosmwasm.wasm.v1.QueryParamsRequest",
      rpc: "/cosmwasm/wasm/v1/codes/params",
      query: "/cosmwasm.wasm.v1.Query/Params");
  static const CosmWasmV1Types queryContractsByCreator = CosmWasmV1Types._(
      "/cosmwasm.wasm.v1.QueryContractsByCreatorRequest",
      rpc: "/cosmwasm/wasm/v1/contracts/creator/:creator_address",
      query: "/cosmwasm.wasm.v1.Query/ContractsByCreator");
  static const CosmWasmV1Types queryWasmLimitsConfig = CosmWasmV1Types._(
      "/cosmwasm.wasm.v1.QueryWasmLimitsConfigRequest",
      rpc: "/cosmwasm/wasm/v1/wasm-limits-config",
      query: "/cosmwasm.wasm.v1.Query/WasmLimitsConfig");
  static const CosmWasmV1Types queryBuildAddress = CosmWasmV1Types._(
      "/cosmwasm.wasm.v1.QueryBuildAddressRequest",
      rpc: "/cosmwasm/wasm/v1/contract/build_address",
      query: "/cosmwasm.wasm.v1.Query/BuildAddress");
  static const CosmWasmV1Types queryContractsByCreatorResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.QueryContractsByCreatorResponse");
  static const CosmWasmV1Types queryParamsResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.QueryParamsResponse");
  static const CosmWasmV1Types queryPinnedCodesResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.QueryPinnedCodesResponse");
  static const CosmWasmV1Types queryContractInfoResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.QueryContractInfoResponse");
  static const CosmWasmV1Types queryContractHistoryResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.QueryContractHistoryResponse");
  static const CosmWasmV1Types queryContractsByCodeResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.QueryContractsByCodeResponse");
  static const CosmWasmV1Types queryAllContractStateResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.QueryAllContractStateResponse");
  static const CosmWasmV1Types queryRawContractStateResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.QueryRawContractStateResponse");
  static const CosmWasmV1Types querySmartContractStateResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.QuerySmartContractStateResponse");
  static const CosmWasmV1Types queryCodeResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.QueryCodeResponse");
  static const CosmWasmV1Types queryCodesResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.QueryCodesResponse");
  static const CosmWasmV1Types queryCodeInfoResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.QueryCodeInfoResponse");
  static const CosmWasmV1Types queryWasmLimitsConfigResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.QueryWasmLimitsConfigResponse");
  static const CosmWasmV1Types queryBuildAddressResponse =
      CosmWasmV1Types._("/cosmwasm.wasm.v1.QueryBuildAddressResponse");

  static const List<CosmWasmV1Types> services = [
    msgAddCodeUploadParamsAddresses,
    msgExecuteContract,
    msgInstantiateContract,
    msgInstantiateContract2,
    msgMigrateContract,
    msgPinCodes,
    msgRemoveCodeUploadParamsAddresses,
    msgStoreAndInstantiateContract,
    msgStoreAndMigrateContract,
    msgStoreCode,
    msgSudoContract,
    msgUnpinCodes,
    msgUpdateAdmin,
    msgUpdateContractLabel,
    msgUpdateInstantiateConfig,
    msgUpdateParams,
    msgClearAdmin
  ];
  static CosmWasmV1Types? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
