import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgSetMaxPoolPointsPerBlock defines the Msg/SetMaxPoolPointsPerBlock request type
class OsmosisProtorevMsgSetMsgSetMaxPoolPointsPerBlock
    extends OsmosisProtorevV1Beta1<EmptyServiceRequestResponse> {
  /// [admin] is the account that is authorized to set the max pool points per
  /// block.
  final String? admin;

  /// [maxPoolPointsPerBlock] is the maximum number of pool points that can be
  /// consumed per block.
  final BigInt? maxPoolPointsPerBlock;

  const OsmosisProtorevMsgSetMsgSetMaxPoolPointsPerBlock(
      {this.admin, this.maxPoolPointsPerBlock});

  factory OsmosisProtorevMsgSetMsgSetMaxPoolPointsPerBlock.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevMsgSetMsgSetMaxPoolPointsPerBlock(
        admin: decode.getField(1), maxPoolPointsPerBlock: decode.getField(2));
  }
  factory OsmosisProtorevMsgSetMsgSetMaxPoolPointsPerBlock.fromJson(
      Map<String, dynamic> json) {
    return OsmosisProtorevMsgSetMsgSetMaxPoolPointsPerBlock(
        admin: json.as("admin"),
        maxPoolPointsPerBlock: json.asBigInt("max_pool_points_per_block"));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "admin": admin,
      "max_pool_points_per_block": maxPoolPointsPerBlock?.toString()
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.msgSetMaxPoolPointsPerBlock;

  @override
  List get values => [admin, maxPoolPointsPerBlock];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisProtorevV1beta1Types.msgSetMaxPoolPointsPerBlockResponse);
  }

  @override
  List<String?> get signers => [admin];
}
