import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainBanVoter extends CosmosMessage {
  final List<int>? nodeAddress;
  final BigInt? blockHeight;
  final List<String>? signers;
  ThorchainBanVoter(
      {List<int>? nodeAddress, this.blockHeight, List<String>? signers})
      : signers = signers?.immutable,
        nodeAddress = BytesUtils.tryToBytes(nodeAddress, unmodifiable: true);
  factory ThorchainBanVoter.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainBanVoter(
        nodeAddress: decode.getField(1),
        blockHeight: decode.getField(2),
        signers: decode.getFields<String>(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "node_address": BytesUtils.tryToHexString(nodeAddress),
      "block_height": blockHeight?.toString(),
      "signers": signers
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.banVoter.typeUrl;

  @override
  List get values => [nodeAddress, blockHeight, signers];
}
