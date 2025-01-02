import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisProtorevQueryGetProtoRevAllProfitsResponse extends CosmosMessage {
  /// pprofits is a list of all of the profits from the module
  final List<Coin> profits;
  OsmosisProtorevQueryGetProtoRevAllProfitsResponse(List<Coin> profits)
      : profits = profits.immutable;
  factory OsmosisProtorevQueryGetProtoRevAllProfitsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevAllProfitsResponse(
        decode.getFields(1).map((e) => Coin.deserialize(e)).toList());
  }
  factory OsmosisProtorevQueryGetProtoRevAllProfitsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevAllProfitsResponse(
        (json["profits"] as List?)?.map((e) => Coin.fromRpc(e)).toList() ??
            <Coin>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"profits": profits.map((e) => e.toJson())};
  }

  @override
  List get values => [profits];

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevAllProfitsResponse;
}
