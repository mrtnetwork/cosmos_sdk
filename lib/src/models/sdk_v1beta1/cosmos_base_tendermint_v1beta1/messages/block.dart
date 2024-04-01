import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/commit.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/data.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/evidence/evidence_list.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/header.dart';

class CosmosBlock extends CosmosMessage {
  final Header header;
  final BlockData data;
  final EvidenceList evidence;
  final Commit? lastCommit;
  const CosmosBlock(
      {required this.header,
      required this.data,
      required this.evidence,
      this.lastCommit});
  factory CosmosBlock.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmosBlock(
        header: Header.deserialize(decode.getField(1)),
        data: BlockData.deserialize(decode.getField(2)),
        evidence: EvidenceList.deserialize(decode.getField(3)),
        lastCommit: decode
            .getResult(4)
            ?.to<Commit, List<int>>((e) => Commit.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "header": header.toJson(),
      "data": data.toJson(),
      "evidence": evidence.toJson(),
      "last_commit": lastCommit?.toJson()
    };
  }

  @override
  String get typeUrl => BaseTendermintV1beta1Types.cosmosBlock.typeUrl;

  @override
  List get values => [1, 2, 3, 4];
}
