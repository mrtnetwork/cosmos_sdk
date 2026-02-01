import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/messages/proof_ops.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// ABCIQueryResponse defines the response structure for the ABCIQuery gRPC query.
/// Note: This type is a duplicate of the ResponseQuery proto type defined in Tendermint.
class ABCIQueryResponse extends CosmosMessage {
  final int? code;
  final String? log;
  final String? info;
  final BigInt? index;
  final List<int>? key;
  final List<int>? value;
  final CosmosProofOps? proofOps;
  final BigInt? height;
  final String? codespace;
  factory ABCIQueryResponse.fromJson(Map<String, dynamic> json) {
    return ABCIQueryResponse(
      code: json["code"],
      log: json["log"],
      info: json["info"],
      index: BigintUtils.tryParse(json["index"]),
      key: CosmosUtils.tryToBytes(json["key"]),
      value: CosmosUtils.tryToBytes(json["value"]),
      proofOps:
          json["proof_ops"] == null
              ? null
              : CosmosProofOps.fromJson(json["proof_ops"]),
      codespace: json["codespace"],
      height: BigintUtils.tryParse(json["height"]),
    );
  }
  ABCIQueryResponse({
    this.code,
    this.log,
    this.info,
    this.index,
    List<int>? key,
    List<int>? value,
    this.proofOps,
    this.height,
    this.codespace,
  }) : key = BytesUtils.tryToBytes(key, unmodifiable: true),
       value = BytesUtils.tryToBytes(value, unmodifiable: true);
  factory ABCIQueryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ABCIQueryResponse(
      code: decode.getField(1),
      log: decode.getField(3),
      info: decode.getField(4),
      index: decode.getField(5),
      key: decode.getField(6),
      value: decode.getField(7),
      proofOps: decode
          .getResult(8)
          ?.to<CosmosProofOps, List<int>>((e) => CosmosProofOps.deserialize(e)),
      codespace: decode.getField(10),
      height: decode.getField(9),
    );
  }

  @override
  List<int> get fieldIds => [1, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "log": log,
      "info": info,
      "index": index?.toString(),
      "key": CosmosUtils.tryToBase64(key),
      "value": CosmosUtils.tryToBase64(value),
      "proof_ops": proofOps?.toJson(),
      "height": height?.toString(),
      "codespace": codespace,
    };
  }

  @override
  TypeUrl get typeUrl => BaseTendermintV1beta1Types.abciQueryResponse;

  @override
  List get values => [
    code,
    log,
    info,
    index,
    key,
    value,
    proofOps,
    height,
    codespace,
  ];
}
