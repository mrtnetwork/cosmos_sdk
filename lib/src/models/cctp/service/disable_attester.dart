import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgDisableAttester
    extends CCTPV1Service<EmptyServiceRequestResponse>
    with AminoMessage<EmptyServiceRequestResponse> {
  final String? from;
  final String? attester;
  const CCTPV1MsgDisableAttester({this.from, this.attester});

  factory CCTPV1MsgDisableAttester.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgDisableAttester(
        from: decode.getField(1), attester: decode.getField(2));
  }
  factory CCTPV1MsgDisableAttester.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgDisableAttester(
        from: json.as("from"), attester: json.as("attester"));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"from": from, "attester": attester};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgDisableAttester;

  @override
  List get values => [from, attester];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(CCTPV1Types.msgDisableAttesterResponse);
  }
}
