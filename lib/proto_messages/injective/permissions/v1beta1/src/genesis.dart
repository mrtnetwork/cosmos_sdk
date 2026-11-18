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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'params': config.encodeMessage(params),
      'namespaces': namespaces.map((e) => config.encodeMessage(e)).toList(),
      'vouchers': vouchers.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory GenesisState.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GenesisState(
      params: json
          .valueTo<injective_permissions_v1beta1_params.Params?, Object>(
            key: 'params',
            parse:
                (v) => injective_permissions_v1beta1_params.Params.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      namespaces:
          (json.valueEnsureAsList<dynamic>(
                'namespaces',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_permissions_v1beta1_permissions.Namespace,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_permissions_v1beta1_permissions
                          .Namespace.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      vouchers:
          (json.valueEnsureAsList<dynamic>(
                'vouchers',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_common_vouchers_v1_vouchers.AddressVoucher,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_common_vouchers_v1_vouchers
                          .AddressVoucher.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
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
