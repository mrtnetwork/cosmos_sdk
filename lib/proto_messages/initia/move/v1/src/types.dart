import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// UpgradePolicy is the policy for upgrading a move module.
enum UpgradePolicy implements ProtoEnumVariant {
  /// UNSPECIFIED: a placeholder for an unspecified upgrade policy.
  unspecified(0, 'UNSPECIFIED'),

  /// COMPATIBLE: Whether a compatibility check should be performed for upgrades. The check only passes if
  /// a new module has (a) the same public functions (b) for existing resources, no layout change.
  compatible(1, 'COMPATIBLE'),

  /// IMMUTABLE: Whether the modules in the package are immutable and cannot be upgraded.
  immutable(2, 'IMMUTABLE');

  const UpgradePolicy(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static UpgradePolicy fromValue(int? value) {
    return UpgradePolicy.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(name: "UpgradePolicy", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static UpgradePolicy from(Object? value) {
    return UpgradePolicy.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(name: "UpgradePolicy", value: value),
    );
  }
}

/// Params defines the set of move parameters.
class Params extends CosmosProtoMessage {
  final String? baseDenom;

  final String? baseMinGasPrice;

  /// CSR: Percentage of fees distributed to developers
  final String? contractSharedRevenueRatio;

  /// flag whether to enable script execution
  final bool? scriptEnabled;

  /// It is a list of addresses with permission to distribute contracts,
  /// and an empty list is interpreted as allowing anyone to distribute.
  final List<String> allowedPublishers;

  /// CLAMM module address
  final String? clammModuleAddress;

  const Params({
    this.baseDenom,
    this.baseMinGasPrice,
    this.contractSharedRevenueRatio,
    this.scriptEnabled,
    this.allowedPublishers = const [],
    this.clammModuleAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionString(name: "amino.name", value: "move/Params")],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(
          2,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionBool(name: "deprecated", value: true),
          ],
        ),
        ProtoFieldConfig.string(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.bool(4),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.string,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    baseDenom,
    baseMinGasPrice,
    contractSharedRevenueRatio,
    scriptEnabled,
    allowedPublishers,
    clammModuleAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'base_denom': baseDenom,
      'base_min_gas_price': baseMinGasPrice,
      'contract_shared_revenue_ratio': contractSharedRevenueRatio,
      'script_enabled': scriptEnabled,
      'allowed_publishers': allowedPublishers.map((e) => e).toList(),
      'clamm_module_address': clammModuleAddress,
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      baseDenom: json.valueAsString<String?>(
        'base_denom',
        acceptCamelCase: true,
      ),
      baseMinGasPrice: json.valueAsString<String?>(
        'base_min_gas_price',
        acceptCamelCase: true,
      ),
      contractSharedRevenueRatio: json.valueAsString<String?>(
        'contract_shared_revenue_ratio',
        acceptCamelCase: true,
      ),
      scriptEnabled: json.valueAsBool<bool?>(
        'script_enabled',
        acceptCamelCase: true,
      ),
      allowedPublishers:
          (json.valueEnsureAsList<dynamic>(
            'allowed_publishers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      clammModuleAddress: json.valueAsString<String?>(
        'clamm_module_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      baseDenom: decode.getString<String?>(1),
      baseMinGasPrice: decode.getString<String?>(2),
      contractSharedRevenueRatio: decode.getString<String?>(3),
      scriptEnabled: decode.getBool<bool?>(4),
      allowedPublishers: decode.getListOrEmpty<String>(5),
      clammModuleAddress: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1Params;
}

/// Module is data for the uploaded contract move code
class Module extends CosmosProtoMessage {
  final String? address;

  final String? moduleName;

  final String? abi;

  final List<int>? rawBytes;

  final UpgradePolicy? upgradePolicy;

  const Module({
    this.address,
    this.moduleName,
    this.abi,
    this.rawBytes,
    this.upgradePolicy,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.bytes(4),
        ProtoFieldConfig.enumType(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    address,
    moduleName,
    abi,
    rawBytes,
    upgradePolicy,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'module_name': moduleName,
      'abi': abi,
      'raw_bytes': switch (rawBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'upgrade_policy': upgradePolicy?.protoName,
    };
  }

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      moduleName: json.valueAsString<String?>(
        'module_name',
        acceptCamelCase: true,
      ),
      abi: json.valueAsString<String?>('abi', acceptCamelCase: true),
      rawBytes: json.valueAsBytes<List<int>?>(
        'raw_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      upgradePolicy: json.valueTo<UpgradePolicy?, Object?>(
        key: 'upgrade_policy',
        parse: (v) => UpgradePolicy.from(v),
      ),
    );
  }

  factory Module.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Module(
      address: decode.getString<String?>(1),
      moduleName: decode.getString<String?>(2),
      abi: decode.getString<String?>(3),
      rawBytes: decode.getBytes<List<int>?>(4),
      upgradePolicy: decode.getEnum<UpgradePolicy?>(5, UpgradePolicy.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1Module;
}

/// Resource is data for the stored move resource
class Resource extends CosmosProtoMessage {
  final String? address;

  final String? structTag;

  final String? moveResource;

  final List<int>? rawBytes;

  const Resource({
    this.address,
    this.structTag,
    this.moveResource,
    this.rawBytes,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.bytes(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, structTag, moveResource, rawBytes];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'struct_tag': structTag,
      'move_resource': moveResource,
      'raw_bytes': switch (rawBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      structTag: json.valueAsString<String?>(
        'struct_tag',
        acceptCamelCase: true,
      ),
      moveResource: json.valueAsString<String?>(
        'move_resource',
        acceptCamelCase: true,
      ),
      rawBytes: json.valueAsBytes<List<int>?>(
        'raw_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory Resource.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Resource(
      address: decode.getString<String?>(1),
      structTag: decode.getString<String?>(2),
      moveResource: decode.getString<String?>(3),
      rawBytes: decode.getBytes<List<int>?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1Resource;
}

/// TableInfo is data stored under Table address
class TableInfo extends CosmosProtoMessage {
  final String? address;

  final String? keyType;

  final String? valueType;

  const TableInfo({this.address, this.keyType, this.valueType});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, keyType, valueType];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'key_type': keyType, 'value_type': valueType};
  }

  factory TableInfo.fromJson(Map<String, dynamic> json) {
    return TableInfo(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      keyType: json.valueAsString<String?>('key_type', acceptCamelCase: true),
      valueType: json.valueAsString<String?>(
        'value_type',
        acceptCamelCase: true,
      ),
    );
  }

  factory TableInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TableInfo(
      address: decode.getString<String?>(1),
      keyType: decode.getString<String?>(2),
      valueType: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1TableInfo;
}

/// TableEntry is data stored under Table address and the key bytes
class TableEntry extends CosmosProtoMessage {
  final String? address;

  final String? key;

  final String? value;

  final List<int>? keyBytes;

  final List<int>? valueBytes;

  const TableEntry({
    this.address,
    this.key,
    this.value,
    this.keyBytes,
    this.valueBytes,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.bytes(4),
        ProtoFieldConfig.bytes(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, key, value, keyBytes, valueBytes];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'key': key,
      'value': value,
      'key_bytes': switch (keyBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'value_bytes': switch (valueBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory TableEntry.fromJson(Map<String, dynamic> json) {
    return TableEntry(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      key: json.valueAsString<String?>('key', acceptCamelCase: true),
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
      keyBytes: json.valueAsBytes<List<int>?>(
        'key_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      valueBytes: json.valueAsBytes<List<int>?>(
        'value_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory TableEntry.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TableEntry(
      address: decode.getString<String?>(1),
      key: decode.getString<String?>(2),
      value: decode.getString<String?>(3),
      keyBytes: decode.getBytes<List<int>?>(4),
      valueBytes: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1TableEntry;
}

/// DexPair contains coin metadata address
/// std::dex::Pool and std::dex::Config resources.
class DexPair extends CosmosProtoMessage {
  final String? metadataQuote;

  final String? metadataLp;

  const DexPair({this.metadataQuote, this.metadataLp});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [metadataQuote, metadataLp];

  @override
  Map<String, dynamic> toJson() {
    return {'metadata_quote': metadataQuote, 'metadata_lp': metadataLp};
  }

  factory DexPair.fromJson(Map<String, dynamic> json) {
    return DexPair(
      metadataQuote: json.valueAsString<String?>(
        'metadata_quote',
        acceptCamelCase: true,
      ),
      metadataLp: json.valueAsString<String?>(
        'metadata_lp',
        acceptCamelCase: true,
      ),
    );
  }

  factory DexPair.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DexPair(
      metadataQuote: decode.getString<String?>(1),
      metadataLp: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1DexPair;
}
