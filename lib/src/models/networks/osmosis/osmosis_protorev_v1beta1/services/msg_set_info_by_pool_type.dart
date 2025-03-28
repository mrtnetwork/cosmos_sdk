import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/messages/info_by_pool_type.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// SetInfoByPoolType sets the pool type information needed to make smart assumptions about swapping on different pool types
class OsmosisProtorevMsgSetInfoByPoolType
    extends OsmosisProtorevV1Beta1<EmptyServiceRequestResponse> {
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
  factory OsmosisProtorevMsgSetInfoByPoolType.fromJson(
      Map<String, dynamic> json) {
    return OsmosisProtorevMsgSetInfoByPoolType(
        admin: json.as("admin"),
        infoByPoolType: OsmosisProtorevInfoByPoolType.fromJson(
            json.asMap("info_by_pool_type")));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"admin": admin, "info_by_pool_type": infoByPoolType.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.msgSetInfoByPoolType;

  @override
  List get values => [admin, infoByPoolType];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisProtorevV1beta1Types.msgSetInfoByPoolTypeResponse);
  }

  @override
  List<String?> get signers => [admin];
}
