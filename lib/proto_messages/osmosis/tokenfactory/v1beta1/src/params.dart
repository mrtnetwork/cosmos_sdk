import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// Params defines the parameters for the tokenfactory module.
class Params extends CosmosProtoMessage {
  /// DenomCreationFee defines the fee to be charged on the creation of a new
  /// denom. The fee is drawn from the MsgCreateDenom's sender account, and
  /// transferred to the community pool.
  final List<cosmos_base_v1beta1_coin.Coin> denomCreationFee;

  /// DenomCreationGasConsume defines the gas cost for creating a new denom.
  /// This is intended as a spam deterrence mechanism.
  ///
  /// See: https://github.com/CosmWasm/token-factory/issues/11
  final BigInt? denomCreationGasConsume;

  const Params({
    this.denomCreationFee = const [],
    this.denomCreationGasConsume,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.uint64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denomCreationFee, denomCreationGasConsume];

  @override
  Map<String, dynamic> toJson() {
    return {
      'denom_creation_fee': denomCreationFee.map((e) => e.toJson()).toList(),
      'denom_creation_gas_consume': denomCreationGasConsume?.toString(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      denomCreationFee:
          (json.valueEnsureAsList<dynamic>(
                'denom_creation_fee',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      denomCreationGasConsume: json.valueAsBigInt<BigInt?>(
        'denom_creation_gas_consume',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      denomCreationFee:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      denomCreationGasConsume: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTokenfactoryV1beta1Params;
}
