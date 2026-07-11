import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// PoolParams defined the parameters that will be managed by the pool
/// governance in the future. This params are not managed by the chain
/// governance. Instead they will be managed by the token holders of the pool.
/// The pool's token holders are specified in future_pool_governor.
class PoolParams extends CosmosProtoMessage {
  final String? swapFee;

  /// N.B.: exit fee is disabled during pool creation in x/poolmanager. While old
  /// pools can maintain a non-zero fee. No new pool can be created with non-zero
  /// fee anymore
  final String? exitFee;

  const PoolParams({this.swapFee, this.exitFee});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/gamm/StableswapPoolParams",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [swapFee, exitFee];

  @override
  Map<String, dynamic> toJson() {
    return {'swap_fee': swapFee, 'exit_fee': exitFee};
  }

  factory PoolParams.fromJson(Map<String, dynamic> json) {
    return PoolParams(
      swapFee: json.valueAsString<String?>('swap_fee', acceptCamelCase: true),
      exitFee: json.valueAsString<String?>('exit_fee', acceptCamelCase: true),
    );
  }

  factory PoolParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PoolParams(
      swapFee: decode.getString<String?>(1),
      exitFee: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammPoolmodelsStableswapV1beta1PoolParams;
}
