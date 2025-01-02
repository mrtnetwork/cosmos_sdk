import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'contract_info_by_pool_id_response.dart';

class OsmosisCosmWasmPoolContractInfoByPoolIdRequest extends CosmosMessage
    with QueryMessage<OsmosisCosmWasmContractInfoByPoolIdResponse> {
  /// pool_id is the pool id of the requested pool
  final BigInt? poolId;
  OsmosisCosmWasmPoolContractInfoByPoolIdRequest({this.poolId});
  factory OsmosisCosmWasmPoolContractInfoByPoolIdRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolContractInfoByPoolIdRequest(
        poolId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisCosmWasmPoolV1beta1Types.contractInfoByPoolIdRequest;

  @override
  List get values => [poolId];

  @override
  OsmosisCosmWasmContractInfoByPoolIdResponse onResponse(List<int> bytes) {
    return OsmosisCosmWasmContractInfoByPoolIdResponse.deserialize(bytes);
  }

  @override
  OsmosisCosmWasmContractInfoByPoolIdResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisCosmWasmContractInfoByPoolIdResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {"pool_id": poolId?.toString()};
}
