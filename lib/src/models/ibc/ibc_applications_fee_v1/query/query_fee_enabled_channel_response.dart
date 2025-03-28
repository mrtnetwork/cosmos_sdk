import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryFeeEnabledChannelResponse defines the response type for the FeeEnabledChannel rpc
class QueryFeeEnabledChannelResponse extends CosmosMessage {
  /// boolean flag representing the fee enabled channel status
  final bool? feeEnabled;
  const QueryFeeEnabledChannelResponse({this.feeEnabled});
  factory QueryFeeEnabledChannelResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryFeeEnabledChannelResponse(feeEnabled: decode.getField(1));
  }
  factory QueryFeeEnabledChannelResponse.fromJson(Map<String, dynamic> json) {
    return QueryFeeEnabledChannelResponse(feeEnabled: json["fee_enabled"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"fee_enabled": feeEnabled};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryFeeEnabledChannelResponse;

  @override
  List get values => [feeEnabled];
}
