import 'package:blockchain_utils/utils/numbers/utils/bigint_utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_node_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ConfigResponse defines the response structure for the Config gRPC query.
class NodeConfigResponse extends CosmosMessage {
  final String? minimumGasPrice;
  final String? pruningKeepRecent;
  final String? pruningInterval;
  final BigInt? haltHeight;
  const NodeConfigResponse(
      {this.minimumGasPrice,
      this.pruningKeepRecent,
      this.pruningInterval,
      this.haltHeight});
  factory NodeConfigResponse.fromJson(Map<String, dynamic> json) {
    return NodeConfigResponse(
      minimumGasPrice: json["minimum_gas_price"],
      pruningKeepRecent: json["pruning_keep_recent"],
      pruningInterval: json["pruning_interval"],
      haltHeight: BigintUtils.tryParse(json["halt_height"]),
    );
  }

  factory NodeConfigResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return NodeConfigResponse(
        minimumGasPrice: decode.getField(1),
        pruningKeepRecent: decode.getField(2),
        pruningInterval: decode.getField(3),
        haltHeight: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "minimum_gas_price": minimumGasPrice,
      "pruning_keep_recent": pruningKeepRecent,
      "pruning_interval": pruningInterval,
      "halt_height": haltHeight?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => BaseNodeV1beta1Types.nodeConfigResponse;

  @override
  List get values =>
      [minimumGasPrice, pruningKeepRecent, pruningInterval, haltHeight];
}
