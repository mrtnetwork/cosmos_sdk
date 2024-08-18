import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainKeygenBlock extends CosmosMessage {
  final BigInt? height;
  final List<ThorchainKeygen> keygens;
  ThorchainKeygenBlock({this.height, required List<ThorchainKeygen> keygens})
      : keygens = keygens.immutable;
  factory ThorchainKeygenBlock.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainKeygenBlock(
      height: decode.getField(1),
      keygens: decode
          .getFields<List<int>>(4)
          .map((e) => ThorchainKeygen.deserialize(e))
          .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "height": height?.toString(),
      "keygens": keygens.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.keygenBlock.typeUrl;

  @override
  List get values => [height, keygens];
}
