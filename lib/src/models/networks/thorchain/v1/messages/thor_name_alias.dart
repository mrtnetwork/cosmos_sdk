import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainTHORNameAlias extends CosmosMessage {
  final String? chain;
  final String? address;
  const ThorchainTHORNameAlias({this.chain, this.address});
  factory ThorchainTHORNameAlias.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainTHORNameAlias(
      chain: decode.getField(1),
      address: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"chain": chain, "address": address};
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.thorchainTHORNameAlias;

  @override
  List get values => [chain, address];
}
