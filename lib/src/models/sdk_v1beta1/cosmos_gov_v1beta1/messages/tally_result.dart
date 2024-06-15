import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TallyResult defines a standard tally for a governance proposal.
class GovTallyResult extends CosmosMessage {
  /// yes is the number of yes votes on a proposal.
  final BigInt yes;

  /// abstain is the number of abstain votes on a proposal.
  final BigInt abstain;

  /// no is the number of no votes on a proposal.
  final BigInt no;

  /// no_with_veto is the number of no with veto votes on a proposal.
  final BigInt noWithVeto;
  const GovTallyResult(
      {required this.yes,
      required this.abstain,
      required this.no,
      required this.noWithVeto});
  factory GovTallyResult.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovTallyResult(
        yes: BigintUtils.parse(decode.getField<String>(1)),
        abstain: BigintUtils.parse(decode.getField<String>(2)),
        no: BigintUtils.parse(decode.getField<String>(3)),
        noWithVeto: BigintUtils.parse(decode.getField<String>(4)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "yes": yes.toString(),
      "abstain": abstain.toString(),
      "no": no.toString(),
      "no_with_veto": noWithVeto.toString()
    };
  }

  @override
  String get typeUrl => GovV1beta1types.govTallyResult.typeUrl;

  @override
  List get values => [
        yes.toString(),
        abstain.toString(),
        no.toString(),
        noWithVeto.toString()
      ];
}
