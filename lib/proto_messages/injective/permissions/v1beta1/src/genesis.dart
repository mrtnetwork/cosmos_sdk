import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/permissions/v1beta1/src/params.dart"
    as injective_permissions_v1beta1_params;
import "package:cosmos_sdk/proto_messages/injective/permissions/v1beta1/src/permissions.dart"
    as injective_permissions_v1beta1_permissions;
import "package:cosmos_sdk/proto_messages/injective/common/vouchers/v1/src/vouchers.dart"
    as injective_common_vouchers_v1_vouchers;

/// GenesisState defines the permissions module's genesis state.
class GenesisState extends CosmosProtoMessage {
  /// params defines the parameters of the module
  final injective_permissions_v1beta1_params.Params? params;

  /// namespaces defines the namespaces of the module
  final List<injective_permissions_v1beta1_permissions.Namespace> namespaces;

  /// vouchers defines the vouchers of the module
  final List<injective_common_vouchers_v1_vouchers.AddressVoucher> vouchers;

  const GenesisState({
    this.params,
    this.namespaces = const [],
    this.vouchers = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [params, namespaces, vouchers];

  @override
  Map<String, dynamic> toJson() {
    return {
      'params': params?.toJson(),
      'namespaces': namespaces.map((e) => e.toJson()).toList(),
      'vouchers': vouchers.map((e) => e.toJson()).toList(),
    };
  }

  factory GenesisState.fromJson(Map<String, dynamic> json) {
    return GenesisState(
      params: json.valueTo<
        injective_permissions_v1beta1_params.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_permissions_v1beta1_params.Params.fromJson(v),
        acceptCamelCase: true,
      ),
      namespaces:
          (json.valueEnsureAsList<dynamic>('namespaces', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_permissions_v1beta1_permissions.Namespace,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_permissions_v1beta1_permissions
                          .Namespace.fromJson(v),
                ),
              )
              .toList(),
      vouchers:
          (json.valueEnsureAsList<dynamic>('vouchers', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_common_vouchers_v1_vouchers.AddressVoucher,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_common_vouchers_v1_vouchers
                          .AddressVoucher.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory GenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GenesisState(
      params: decode.messageTo<injective_permissions_v1beta1_params.Params?>(
        1,
        (b) => injective_permissions_v1beta1_params.Params.deserialize(b),
      ),
      namespaces:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_permissions_v1beta1_permissions
                    .Namespace.deserialize(b),
              )
              .toList(),
      vouchers:
          decode
              .getListOfBytes(3)
              .map(
                (b) => injective_common_vouchers_v1_vouchers
                    .AddressVoucher.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1GenesisState;
}
