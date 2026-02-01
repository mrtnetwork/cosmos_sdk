import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class DominoOp extends CosmosMessage {
  final String? key;
  final String? input;
  final String? output;
  const DominoOp({this.key, this.input, this.output});
  factory DominoOp.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DominoOp(
      key: decode.getField(1),
      input: decode.getField(2),
      output: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"key": key, "input": input, "output": output};
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.dominoOp;

  @override
  List get values => [key, input, output];
}
