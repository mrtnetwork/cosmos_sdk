import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/tally_result.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryTallyResultResponse is the response type for the Query/Tally RPC method.
class GovQueryTallyResultResponse extends CosmosMessage {
  /// tally defines the requested tally.
  final GovTallyResult tally;
  const GovQueryTallyResultResponse(this.tally);
  factory GovQueryTallyResultResponse.fromJson(Map<String, dynamic> json) {
    return GovQueryTallyResultResponse(GovTallyResult.fromJson(json["tally"]));
  }
  factory GovQueryTallyResultResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovQueryTallyResultResponse(
      GovTallyResult.deserialize(decode.getField(1)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"tally": tally.toJson()};
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govQueryTallyResultResponse;

  @override
  List get values => [tally];
}
