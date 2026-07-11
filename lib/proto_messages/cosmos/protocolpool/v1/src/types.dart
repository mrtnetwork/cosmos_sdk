import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// ContinuousFund defines the fields of continuous fund proposal.
class ContinuousFund extends CosmosProtoMessage {
  /// Recipient is the address string of the account receiving funds.
  final String? recipient;

  /// Percentage is the percentage of funds to be allocated from Community pool.
  final String? percentage;

  /// Optional, if expiry is set, removes the state object when expired.
  final google_protobuf_timestamp.Timestamp? expiry;

  const ContinuousFund({this.recipient, this.percentage, this.expiry});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [recipient, percentage, expiry];

  @override
  Map<String, dynamic> toJson() {
    return {
      'recipient': recipient,
      'percentage': percentage,
      'expiry': expiry?.toRfc3339(),
    };
  }

  factory ContinuousFund.fromJson(Map<String, dynamic> json) {
    return ContinuousFund(
      recipient: json.valueAsString<String?>(
        'recipient',
        acceptCamelCase: true,
      ),
      percentage: json.valueAsString<String?>(
        'percentage',
        acceptCamelCase: true,
      ),
      expiry: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'expiry',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory ContinuousFund.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ContinuousFund(
      recipient: decode.getString<String?>(1),
      percentage: decode.getString<String?>(2),
      expiry: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        3,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosProtocolpoolV1ContinuousFund;
}

/// Params defines the parameters for the protocolpool module.
class Params extends CosmosProtoMessage {
  /// EnabledDistributionDenoms lists the denoms that are allowed to be distributed.
  /// This is to avoid spending time distributing undesired tokens to continuous funds and budgets.
  final List<String> enabledDistributionDenoms;

  /// DistributionFrequency is the frequency (in terms of blocks) that funds are distributed out from the
  /// x/protocolpool module.
  final BigInt? distributionFrequency;

  const Params({
    this.enabledDistributionDenoms = const [],
    this.distributionFrequency,
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
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.uint64(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    enabledDistributionDenoms,
    distributionFrequency,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'enabled_distribution_denoms':
          enabledDistributionDenoms.map((e) => e).toList(),
      'distribution_frequency': distributionFrequency?.toString(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      enabledDistributionDenoms:
          (json.valueEnsureAsList<dynamic>(
            'enabled_distribution_denoms',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      distributionFrequency: json.valueAsBigInt<BigInt?>(
        'distribution_frequency',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      enabledDistributionDenoms: decode.getListOrEmpty<String>(1),
      distributionFrequency: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosProtocolpoolV1Params;
}
