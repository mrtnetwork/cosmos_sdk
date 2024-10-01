import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/messages/base_denom.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryGetProtoRevBaseDenomsResponse is response type for the Query/GetProtoRevBaseDenoms RPC method.
class OsmosisProtorevQueryGetProtoRevBaseDenomsResponse extends CosmosMessage {
  /// [baseDenoms] is a list of all of the base denoms and step sizes
  final List<OsmosisProtorevBaseDenom> baseDenoms;
  OsmosisProtorevQueryGetProtoRevBaseDenomsResponse(
      List<OsmosisProtorevBaseDenom> baseDenoms)
      : baseDenoms = baseDenoms.immutable;
  factory OsmosisProtorevQueryGetProtoRevBaseDenomsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevBaseDenomsResponse(decode
        .getFields(1)
        .map((e) => OsmosisProtorevBaseDenom.deserialize(e))
        .toList());
  }
  factory OsmosisProtorevQueryGetProtoRevBaseDenomsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevBaseDenomsResponse(
        (json["base_denoms"] as List?)
                ?.map((e) => OsmosisProtorevBaseDenom.fromRpc(e))
                .toList() ??
            <OsmosisProtorevBaseDenom>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"base_denoms": baseDenoms.map((e) => e.toJson())};
  }

  @override
  List get values => [baseDenoms];

  @override
  String get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevBaseDenomsResponse.typeUrl;
}
