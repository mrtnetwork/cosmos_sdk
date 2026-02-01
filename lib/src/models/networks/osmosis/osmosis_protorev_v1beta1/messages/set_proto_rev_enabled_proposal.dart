import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// SetProtoRevEnabledProposal is a gov Content type to update whether the protorev module is enabled
class OsmosisProtorevSetProtoRevEnabledProposal extends CosmosMessage {
  final String? title;
  final String? description;
  final bool? enabled;
  OsmosisProtorevSetProtoRevEnabledProposal({
    this.title,
    this.description,
    this.enabled,
  });

  factory OsmosisProtorevSetProtoRevEnabledProposal.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevSetProtoRevEnabledProposal(
      title: decode.getField(1),
      description: decode.getField(2),
      enabled: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"title": title, "description": description, "enabled": enabled};
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.setProtoRevEnabledProposal;

  @override
  List get values => [title, description, enabled];
}
