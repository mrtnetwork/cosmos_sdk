import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// MigrationRecords contains all the links between balancer and concentrated
/// pools
class MigrationRecords extends CosmosProtoMessage {
  final List<BalancerToConcentratedPoolLink> balancerToConcentratedPoolLinks;

  const MigrationRecords({this.balancerToConcentratedPoolLinks = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [balancerToConcentratedPoolLinks];

  @override
  Map<String, dynamic> toJson() {
    return {
      'balancer_to_concentrated_pool_links':
          balancerToConcentratedPoolLinks.map((e) => e.toJson()).toList(),
    };
  }

  factory MigrationRecords.fromJson(Map<String, dynamic> json) {
    return MigrationRecords(
      balancerToConcentratedPoolLinks:
          (json.valueEnsureAsList<dynamic>(
                'balancer_to_concentrated_pool_links',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  BalancerToConcentratedPoolLink,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => BalancerToConcentratedPoolLink.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MigrationRecords.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MigrationRecords(
      balancerToConcentratedPoolLinks:
          decode
              .getListOfBytes(1)
              .map((b) => BalancerToConcentratedPoolLink.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisGammV1beta1MigrationRecords;
}

/// BalancerToConcentratedPoolLink defines a single link between a single
/// balancer pool and a single concentrated liquidity pool. This link is used to
/// allow a balancer pool to migrate to a single canonical full range
/// concentrated liquidity pool position
/// A balancer pool can be linked to a maximum of one cl pool, and a cl pool can
/// be linked to a maximum of one balancer pool.
class BalancerToConcentratedPoolLink extends CosmosProtoMessage {
  final BigInt? balancerPoolId;

  final BigInt? clPoolId;

  const BalancerToConcentratedPoolLink({this.balancerPoolId, this.clPoolId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [balancerPoolId, clPoolId];

  @override
  Map<String, dynamic> toJson() {
    return {
      'balancer_pool_id': balancerPoolId?.toString(),
      'cl_pool_id': clPoolId?.toString(),
    };
  }

  factory BalancerToConcentratedPoolLink.fromJson(Map<String, dynamic> json) {
    return BalancerToConcentratedPoolLink(
      balancerPoolId: json.valueAsBigInt<BigInt?>(
        'balancer_pool_id',
        acceptCamelCase: true,
      ),
      clPoolId: json.valueAsBigInt<BigInt?>(
        'cl_pool_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory BalancerToConcentratedPoolLink.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BalancerToConcentratedPoolLink(
      balancerPoolId: decode.getBigInt<BigInt?>(1),
      clPoolId: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisGammV1beta1BalancerToConcentratedPoolLink;
}
