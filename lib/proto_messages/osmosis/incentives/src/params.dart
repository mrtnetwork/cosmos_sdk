import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;

/// Params holds parameters for the incentives module
class Params extends CosmosProtoMessage {
  /// distr_epoch_identifier is what epoch type distribution will be triggered by
  /// (day, week, etc.)
  final String? distrEpochIdentifier;

  /// group_creation_fee is the fee required to create a new group
  /// It is only charged to all addresses other than incentive module account
  /// or addresses in the unrestricted_creator_whitelist
  final List<cosmos_base_v1beta1_coin.Coin> groupCreationFee;

  /// unrestricted_creator_whitelist is a list of addresses that are
  /// allowed to bypass restrictions on permissionless Group
  /// creation. In the future, we might expand these to creating gauges
  /// as well.
  /// The goal of this is to allow a subdao to manage incentives efficiently
  /// without being stopped by 5 day governance process or a high fee.
  /// At the same time, it prevents spam by having a fee for all
  /// other users.
  final List<String> unrestrictedCreatorWhitelist;

  /// internal_uptime is the uptime used for internal incentives on pools that
  /// use NoLock gauges (currently only Concentrated Liquidity pools).
  ///
  /// Since Group gauges route through internal gauges, this parameter affects
  /// the uptime of those incentives as well (i.e. distributions through volume
  /// splitting incentives will use this uptime).
  final google_protobuf_duration.Duration? internalUptime;

  /// min_value_for_distribution is the minimum amount a token must be worth
  /// in order to be eligible for distribution. If the token is worth
  /// less than this amount (or the route between the two denoms is not
  /// registered), it will not be distributed and is forfeited to the remaining
  /// distributees that are eligible.
  final cosmos_base_v1beta1_coin.Coin? minValueForDistribution;

  const Params({
    this.distrEpochIdentifier,
    this.groupCreationFee = const [],
    this.unrestrictedCreatorWhitelist = const [],
    this.internalUptime,
    this.minValueForDistribution,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    distrEpochIdentifier,
    groupCreationFee,
    unrestrictedCreatorWhitelist,
    internalUptime,
    minValueForDistribution,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'distr_epoch_identifier': distrEpochIdentifier,
      'group_creation_fee': groupCreationFee.map((e) => e.toJson()).toList(),
      'unrestricted_creator_whitelist':
          unrestrictedCreatorWhitelist.map((e) => e).toList(),
      'internal_uptime': internalUptime?.encodeString(asNanos: true),
      'min_value_for_distribution': minValueForDistribution?.toJson(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      distrEpochIdentifier: json.valueAsString<String?>(
        'distr_epoch_identifier',
        acceptCamelCase: true,
      ),
      groupCreationFee:
          (json.valueEnsureAsList<dynamic>(
                'group_creation_fee',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      unrestrictedCreatorWhitelist:
          (json.valueEnsureAsList<dynamic>(
            'unrestricted_creator_whitelist',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      internalUptime: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'internal_uptime',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
      minValueForDistribution: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'min_value_for_distribution',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      distrEpochIdentifier: decode.getString<String?>(1),
      groupCreationFee:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      unrestrictedCreatorWhitelist: decode.getListOrEmpty<String>(3),
      internalUptime: decode.messageTo<google_protobuf_duration.Duration?>(
        4,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      minValueForDistribution: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        5,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisIncentivesParams;
}
