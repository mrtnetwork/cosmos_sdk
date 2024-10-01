import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainErrataTxVoter extends CosmosMessage {
  final String? txId;
  final String? chain;
  final BigInt? blockHeight;
  final List<String>? signers;
  ThorchainErrataTxVoter(
      {this.txId, this.chain, this.blockHeight, List<String>? signers})
      : signers = signers?.emptyAsNull?.immutable;
  factory ThorchainErrataTxVoter.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainErrataTxVoter(
        txId: decode.getField(1),
        chain: decode.getField(2),
        blockHeight: decode.getField(3),
        signers: decode.getFields<String>(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx_id": txId,
      "chain": chain,
      "block_height": blockHeight?.toString(),
      "signers": signers
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.errataTxVoter.typeUrl;

  @override
  List get values => [txId, chain, blockHeight, signers];
}
