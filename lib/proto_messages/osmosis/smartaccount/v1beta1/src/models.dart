import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// AccountAuthenticator represents a foundational model for all authenticators.
/// It provides extensibility by allowing concrete types to interpret and
/// validate transactions based on the encapsulated data.
class AccountAuthenticator extends CosmosProtoMessage {
  /// ID uniquely identifies the authenticator instance.
  final BigInt? id;

  /// Type specifies the category of the AccountAuthenticator.
  /// This type information is essential for differentiating authenticators
  /// and ensuring precise data retrieval from the storage layer.
  final String? type;

  /// Config is a versatile field used in conjunction with the specific type of
  /// account authenticator to facilitate complex authentication processes.
  /// The interpretation of this field is overloaded, enabling multiple
  /// authenticators to utilize it for their respective purposes.
  final List<int>? config;

  const AccountAuthenticator({this.id, this.type, this.config});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.bytes(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [id, type, config];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id?.toString(),
      'type': type,
      'config': switch (config) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory AccountAuthenticator.fromJson(Map<String, dynamic> json) {
    return AccountAuthenticator(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
      type: json.valueAsString<String?>('type', acceptCamelCase: true),
      config: json.valueAsBytes<List<int>?>(
        'config',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory AccountAuthenticator.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AccountAuthenticator(
      id: decode.getBigInt<BigInt?>(1),
      type: decode.getString<String?>(2),
      config: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSmartaccountV1beta1AccountAuthenticator;
}
