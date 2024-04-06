import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainChainContract extends CosmosMessage {
  final String? chain;
  final String? router;
  const ThorchainChainContract({this.chain, this.router});
  factory ThorchainChainContract.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainChainContract(
        chain: decode.getField(1), router: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"chain": chain, "router": router};
  }

  @override
  String get typeUrl => ThorchainV1Types.chainContract.typeUrl;

  @override
  List get values => [chain, router];
}
