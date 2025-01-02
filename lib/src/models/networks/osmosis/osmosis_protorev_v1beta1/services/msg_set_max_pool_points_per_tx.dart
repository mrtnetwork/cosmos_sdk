import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisProtorevMsgSetMaxPoolPointsPerTx extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// [admin] is the account that is authorized to set the max pool points per tx.
  final String? admin;

  /// [maxPoolPointsPerTx] is the maximum number of pool points that can be
  /// consumed per transaction.
  final BigInt? maxPoolPointsPerTx;

  const OsmosisProtorevMsgSetMaxPoolPointsPerTx(
      {this.admin, this.maxPoolPointsPerTx});

  factory OsmosisProtorevMsgSetMaxPoolPointsPerTx.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevMsgSetMaxPoolPointsPerTx(
        admin: decode.getField(1), maxPoolPointsPerTx: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "admin": admin,
      "max_pool_points_per_tx": maxPoolPointsPerTx?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.msgSetMaxPoolPointsPerTx;

  @override
  List get values => [admin, maxPoolPointsPerTx];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisProtorevV1beta1Types.msgSetMaxPoolPointsPerTxResponse);
  }

  @override
  TypeUrl get service => OsmosisProtorevV1beta1Types.setMaxPoolPointsPerTx;

  @override
  List<String?> get signers => [admin];
}
