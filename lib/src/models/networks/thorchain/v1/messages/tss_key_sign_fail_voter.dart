import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainTssKeysignFailVoter extends CosmosMessage {
  final String? id;
  final BigInt? height;
  final List<String>? signers;
  final BigInt? round7Count;
  ThorchainTssKeysignFailVoter({
    this.id,
    this.height,
    List<String>? signers,
    this.round7Count,
  }) : signers = signers?.emptyAsNull?.immutable;
  factory ThorchainTssKeysignFailVoter.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainTssKeysignFailVoter(
      id: decode.getField(1),
      height: decode.getField(4),
      signers: decode.getFields<String>(6),
      round7Count: decode.getField(7),
    );
  }

  @override
  List<int> get fieldIds => [1, 4, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "height": height?.toString(),
      "signers": signers,
      "round7_count": round7Count?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.tssKeysignFailVoter;

  @override
  List get values => [id, height, signers, round7Count];
}
