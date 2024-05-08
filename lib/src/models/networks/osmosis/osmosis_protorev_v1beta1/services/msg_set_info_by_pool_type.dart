import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/messages/info_by_pool_type.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// SetInfoByPoolType sets the pool type information needed to make smart assumptions about swapping on different pool types
class OsmosisProtorevMsgSetInfoByPoolType extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// [admin] is the account that is authorized to set the pool weights.
  final String? admin;

  /// [infoByPoolType] contains information about the pool types.
  final OsmosisProtorevInfoByPoolType infoByPoolType;

  const OsmosisProtorevMsgSetInfoByPoolType(
      {this.admin, required this.infoByPoolType});

  factory OsmosisProtorevMsgSetInfoByPoolType.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevMsgSetInfoByPoolType(
        admin: decode.getField(1),
        infoByPoolType:
            OsmosisProtorevInfoByPoolType.deserialize(decode.getField(2)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"admin": admin, "info_by_pool_type": infoByPoolType.toJson()};
  }

  @override
  String get typeUrl =>
      OsmosisProtorevV1beta1Types.msgSetInfoByPoolType.typeUrl;

  @override
  List get values => [admin, infoByPoolType];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisProtorevV1beta1Types.msgSetInfoByPoolTypeResponse.typeUrl);
  }

  @override
  String get service => OsmosisProtorevV1beta1Types.setInfoByPoolType.typeUrl;

  @override
  List<String?> get signers => [admin];
}
