import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryGetProtoRevNumberOfTradesResponse is response type for the Query/GetProtoRevNumberOfTrades RPC method.
class OsmosisProtorevQueryGetProtoRevNumberOfTradesResponse
    extends CosmosMessage {
  /// [numberOfTrades] is the number of trades the module has executed
  final BigInt numberOfTrades;
  const OsmosisProtorevQueryGetProtoRevNumberOfTradesResponse(
      this.numberOfTrades);
  factory OsmosisProtorevQueryGetProtoRevNumberOfTradesResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevNumberOfTradesResponse(
        BigInt.parse(decode.getField(1)));
  }
  factory OsmosisProtorevQueryGetProtoRevNumberOfTradesResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevNumberOfTradesResponse(
        BigintUtils.parse(json["number_of_trades"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"number_of_trades": numberOfTrades.toString()};
  }

  @override
  List get values => [numberOfTrades.toString()];

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevNumberOfTradesResponse;
}
