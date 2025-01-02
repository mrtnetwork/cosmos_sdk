import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainProtocolOwnedLiquidity extends CosmosMessage {
  final BigInt runeDeposited;
  final BigInt runeWithdrawn;
  ThorchainProtocolOwnedLiquidity(
      {required this.runeDeposited, required this.runeWithdrawn});
  factory ThorchainProtocolOwnedLiquidity.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainProtocolOwnedLiquidity(
      runeDeposited: BigInt.parse(decode.getField(1)),
      runeWithdrawn: BigInt.parse(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "rune_deposited": runeDeposited.toString(),
      "rune_withdrawn": runeWithdrawn.toString()
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.protocolOwnedLiquidity;

  @override
  List get values => [runeDeposited.toString(), runeWithdrawn.toString()];
}
