import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// TokenPair defines an association of bank denom &lt;-&gt; EVM token (erc20 contract
/// address)
class TokenPair extends CosmosProtoMessage {
  final String? bankDenom;

  /// bank denom
  final String? erc20Address;

  const TokenPair({this.bankDenom, this.erc20Address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [bankDenom, erc20Address];

  @override
  Map<String, dynamic> toJson() {
    return {'bank_denom': bankDenom, 'erc20_address': erc20Address};
  }

  factory TokenPair.fromJson(Map<String, dynamic> json) {
    return TokenPair(
      bankDenom: json.valueAsString<String?>(
        'bank_denom',
        acceptCamelCase: true,
      ),
      erc20Address: json.valueAsString<String?>(
        'erc20_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory TokenPair.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TokenPair(
      bankDenom: decode.getString<String?>(1),
      erc20Address: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveErc20V1beta1TokenPair;
}
