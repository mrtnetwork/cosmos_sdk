import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/tokenfactory/v1beta1/src/params.dart"
    as injective_tokenfactory_v1beta1_params;
import "package:cosmos_sdk/proto_messages/injective/tokenfactory/v1beta1/src/authority_metadata.dart"
    as injective_tokenfactory_v1beta1_authority_metadata;

/// GenesisState defines the tokenfactory module's genesis state.
class GenesisState extends CosmosProtoMessage {
  /// params defines the parameters of the module.
  final injective_tokenfactory_v1beta1_params.Params? params;

  final List<GenesisDenom> factoryDenoms;

  const GenesisState({this.params, this.factoryDenoms = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [params, factoryDenoms];

  @override
  Map<String, dynamic> toJson() {
    return {
      'params': params?.toJson(),
      'factory_denoms': factoryDenoms.map((e) => e.toJson()).toList(),
    };
  }

  factory GenesisState.fromJson(Map<String, dynamic> json) {
    return GenesisState(
      params: json.valueTo<
        injective_tokenfactory_v1beta1_params.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_tokenfactory_v1beta1_params.Params.fromJson(v),
        acceptCamelCase: true,
      ),
      factoryDenoms:
          (json.valueEnsureAsList<dynamic>(
                'factory_denoms',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<GenesisDenom, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => GenesisDenom.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory GenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GenesisState(
      params: decode.messageTo<injective_tokenfactory_v1beta1_params.Params?>(
        1,
        (b) => injective_tokenfactory_v1beta1_params.Params.deserialize(b),
      ),
      factoryDenoms:
          decode
              .getListOfBytes(2)
              .map((b) => GenesisDenom.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTokenfactoryV1beta1GenesisState;
}

/// GenesisDenom defines a tokenfactory denom that is defined within genesis
/// state. The structure contains DenomAuthorityMetadata which defines the
/// denom's admin.
class GenesisDenom extends CosmosProtoMessage {
  /// The denom
  final String? denom;

  /// The authority metadata
  final injective_tokenfactory_v1beta1_authority_metadata.DenomAuthorityMetadata?
  authorityMetadata;

  /// The name
  final String? name;

  /// The symbol
  final String? symbol;

  /// The number of decimals
  final int? decimals;

  const GenesisDenom({
    this.denom,
    this.authorityMetadata,
    this.name,
    this.symbol,
    this.decimals,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.uint32(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    denom,
    authorityMetadata,
    name,
    symbol,
    decimals,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'denom': denom,
      'authority_metadata': authorityMetadata?.toJson(),
      'name': name,
      'symbol': symbol,
      'decimals': decimals,
    };
  }

  factory GenesisDenom.fromJson(Map<String, dynamic> json) {
    return GenesisDenom(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      authorityMetadata: json.valueTo<
        injective_tokenfactory_v1beta1_authority_metadata.DenomAuthorityMetadata?,
        Map<String, dynamic>
      >(
        key: 'authority_metadata',
        parse:
            (v) => injective_tokenfactory_v1beta1_authority_metadata
                .DenomAuthorityMetadata.fromJson(v),
        acceptCamelCase: true,
      ),
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      symbol: json.valueAsString<String?>('symbol', acceptCamelCase: true),
      decimals: json.valueAsInt<int?>('decimals', acceptCamelCase: true),
    );
  }

  factory GenesisDenom.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GenesisDenom(
      denom: decode.getString<String?>(1),
      authorityMetadata: decode.messageTo<
        injective_tokenfactory_v1beta1_authority_metadata.DenomAuthorityMetadata?
      >(
        2,
        (b) => injective_tokenfactory_v1beta1_authority_metadata
            .DenomAuthorityMetadata.deserialize(b),
      ),
      name: decode.getString<String?>(3),
      symbol: decode.getString<String?>(4),
      decimals: decode.getInt<int?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTokenfactoryV1beta1GenesisDenom;
}
