import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Copyright Tharsis Labs Ltd.(Evmos)
/// SPDX-License-Identifier:ENCL-1.0(https://github.com/evmos/evmos/blob/main/LICENSE)
/// Owner enumerates the ownership of a ERC20 contract.
enum Owner implements ProtoEnumVariant {
  /// OWNER_UNSPECIFIED defines an invalid/undefined owner.
  ownerUnspecified(0, 'OWNER_UNSPECIFIED'),

  /// OWNER_MODULE - erc20 is owned by the erc20 module account.
  ownerModule(1, 'OWNER_MODULE'),

  /// OWNER_EXTERNAL - erc20 is owned by an external account.
  ownerExternal(2, 'OWNER_EXTERNAL');

  const Owner(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static Owner fromValue(int? value) {
    return Owner.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ItemNotFoundException(name: "Owner", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static Owner from(Object? value) {
    return Owner.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse: () => throw ItemNotFoundException(name: "Owner", value: value),
    );
  }
}

/// TokenPair defines an instance that records a pairing consisting of a native
/// Cosmos Coin and an ERC20 token address.
class TokenPair extends CosmosProtoMessage {
  /// erc20_address is the hex address of ERC20 contract token
  final String? erc20Address;

  /// denom defines the cosmos base denomination to be mapped to
  final String? denom;

  /// enabled defines the token mapping enable status
  final bool? enabled;

  /// contract_owner is the an ENUM specifying the type of ERC20 owner (0 invalid, 1 ModuleAccount, 2 external address)
  final Owner? contractOwner;

  const TokenPair({
    this.erc20Address,
    this.denom,
    this.enabled,
    this.contractOwner,
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
        ProtoFieldConfig.bool(3),
        ProtoFieldConfig.enumType(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    erc20Address,
    denom,
    enabled,
    contractOwner,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'erc20_address': erc20Address,
      'denom': denom,
      'enabled': enabled,
      'contract_owner': contractOwner?.protoName,
    };
  }

  factory TokenPair.fromJson(Map<String, dynamic> json) {
    return TokenPair(
      erc20Address: json.valueAsString<String?>(
        'erc20_address',
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      enabled: json.valueAsBool<bool?>('enabled', acceptCamelCase: true),
      contractOwner: json.valueTo<Owner?, Object?>(
        key: 'contract_owner',
        parse: (v) => Owner.from(v),
      ),
    );
  }

  factory TokenPair.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TokenPair(
      erc20Address: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
      enabled: decode.getBool<bool?>(3),
      contractOwner: decode.getEnum<Owner?>(4, Owner.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.evmosErc20V1TokenPair;
}
