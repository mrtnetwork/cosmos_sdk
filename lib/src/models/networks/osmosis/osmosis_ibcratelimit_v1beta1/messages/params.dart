import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_ibcratelimit_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisIbcratelimitParams extends CosmosMessage {
  final String? contractAddress;
  const OsmosisIbcratelimitParams({this.contractAddress});
  factory OsmosisIbcratelimitParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIbcratelimitParams(contractAddress: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"contract_address": contractAddress};
  }

  @override
  TypeUrl get typeUrl => OsmosisIbcRatelimitV1beta1Types.params;

  @override
  List get values => [contractAddress];
}
