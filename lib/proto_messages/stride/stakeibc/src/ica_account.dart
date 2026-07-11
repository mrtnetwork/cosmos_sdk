import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

enum ICAAccountType implements ProtoEnumVariant {
  delegation(0, 'DELEGATION'),
  fee(1, 'FEE'),
  withdrawal(2, 'WITHDRAWAL'),
  redemption(3, 'REDEMPTION'),
  communityPoolDeposit(4, 'COMMUNITY_POOL_DEPOSIT'),
  communityPoolReturn(5, 'COMMUNITY_POOL_RETURN'),
  converterUnwind(6, 'CONVERTER_UNWIND'),
  converterTrade(7, 'CONVERTER_TRADE');

  const ICAAccountType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static ICAAccountType fromValue(int? value) {
    return ICAAccountType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(name: "ICAAccountType", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static ICAAccountType from(Object? value) {
    return ICAAccountType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(name: "ICAAccountType", value: value),
    );
  }
}

class ICAAccount extends CosmosProtoMessage {
  final String? chainId;

  final ICAAccountType? type;

  final String? connectionId;

  final String? address;

  const ICAAccount({this.chainId, this.type, this.connectionId, this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.enumType(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [chainId, type, connectionId, address];

  @override
  Map<String, dynamic> toJson() {
    return {
      'chain_id': chainId,
      'type': type?.protoName,
      'connection_id': connectionId,
      'address': address,
    };
  }

  factory ICAAccount.fromJson(Map<String, dynamic> json) {
    return ICAAccount(
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      type: json.valueTo<ICAAccountType?, Object?>(
        key: 'type',
        parse: (v) => ICAAccountType.from(v),
      ),
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory ICAAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ICAAccount(
      chainId: decode.getString<String?>(1),
      type: decode.getEnum<ICAAccountType?>(2, ICAAccountType.values),
      connectionId: decode.getString<String?>(3),
      address: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcICAAccount;
}
