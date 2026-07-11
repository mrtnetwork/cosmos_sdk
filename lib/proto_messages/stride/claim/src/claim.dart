import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

enum Action implements ProtoEnumVariant {
  actionFree(0, 'ACTION_FREE'),
  actionLiquidStake(1, 'ACTION_LIQUID_STAKE'),
  actionDelegateStake(2, 'ACTION_DELEGATE_STAKE');

  const Action(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static Action fromValue(int? value) {
    return Action.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ItemNotFoundException(name: "Action", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static Action from(Object? value) {
    return Action.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse: () => throw ItemNotFoundException(name: "Action", value: value),
    );
  }
}

/// A Claim Records is the metadata of claim data per address
class ClaimRecord extends CosmosProtoMessage {
  /// airdrop identifier
  final String? airdropIdentifier;

  /// address of claim user
  final String? address;

  /// weight that represent the portion from total allocation
  final String? weight;

  /// true if action is completed
  /// index of bool in array refers to action enum #
  final List<bool> actionCompleted;

  const ClaimRecord({
    this.airdropIdentifier,
    this.address,
    this.weight,
    this.actionCompleted = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.bool,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    airdropIdentifier,
    address,
    weight,
    actionCompleted,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'airdrop_identifier': airdropIdentifier,
      'address': address,
      'weight': weight,
      'action_completed': actionCompleted.map((e) => e).toList(),
    };
  }

  factory ClaimRecord.fromJson(Map<String, dynamic> json) {
    return ClaimRecord(
      airdropIdentifier: json.valueAsString<String?>(
        'airdrop_identifier',
        acceptCamelCase: true,
      ),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      weight: json.valueAsString<String?>('weight', acceptCamelCase: true),
      actionCompleted:
          (json.valueEnsureAsList<dynamic>(
            'action_completed',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBool<bool>(e)).toList(),
    );
  }

  factory ClaimRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ClaimRecord(
      airdropIdentifier: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
      weight: decode.getString<String?>(3),
      actionCompleted: decode.getListOrEmpty<bool>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimClaimRecord;
}
