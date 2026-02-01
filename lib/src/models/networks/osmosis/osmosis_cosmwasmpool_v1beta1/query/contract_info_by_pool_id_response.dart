import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisCosmWasmContractInfoByPoolIdResponse extends CosmosMessage {
  /// [contractAddress] is the pool address and contract address
  /// of the requested pool id.
  final String? contractAddress;

  /// [codeId] is the code id of the requested pool id
  final BigInt? codeId;
  OsmosisCosmWasmContractInfoByPoolIdResponse({
    this.contractAddress,
    this.codeId,
  });
  factory OsmosisCosmWasmContractInfoByPoolIdResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmContractInfoByPoolIdResponse(
      contractAddress: decode.getField(1),
      codeId: decode.getField(2),
    );
  }
  factory OsmosisCosmWasmContractInfoByPoolIdResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisCosmWasmContractInfoByPoolIdResponse(
      codeId: BigintUtils.tryParse(json["code_id"]),
      contractAddress: json["contract_address"],
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"code_id": codeId?.toString(), "contract_address": contractAddress};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisCosmWasmPoolV1beta1Types.contractInfoByPoolIdResponse;

  @override
  List get values => [codeId, contractAddress];
}
