import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Consensus captures the consensus rules for processing a block in the blockchain,
/// including all blockchain data structures and the rules of the application's
/// state transition machine.
class Consensus extends CosmosProtoMessage {
  final BigInt? block;

  final BigInt? app;

  const Consensus({this.block, this.app});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [block, app];

  @override
  Map<String, dynamic> toJson() {
    return {'block': block?.toString(), 'app': app?.toString()};
  }

  factory Consensus.fromJson(Map<String, dynamic> json) {
    return Consensus(
      block: json.valueAsBigInt<BigInt?>('block', acceptCamelCase: true),
      app: json.valueAsBigInt<BigInt?>('app', acceptCamelCase: true),
    );
  }

  factory Consensus.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Consensus(
      block: decode.getBigInt<BigInt?>(1),
      app: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintVersionConsensus;
}
