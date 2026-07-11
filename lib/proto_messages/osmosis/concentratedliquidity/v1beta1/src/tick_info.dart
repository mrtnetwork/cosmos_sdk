import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

class UptimeTracker extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.DecCoin> uptimeGrowthOutside;

  const UptimeTracker({this.uptimeGrowthOutside = const []});

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
  List<Object?> get protoValues => [uptimeGrowthOutside];

  @override
  Map<String, dynamic> toJson() {
    return {
      'uptime_growth_outside':
          uptimeGrowthOutside.map((e) => e.toJson()).toList(),
    };
  }

  factory UptimeTracker.fromJson(Map<String, dynamic> json) {
    return UptimeTracker(
      uptimeGrowthOutside:
          (json.valueEnsureAsList<dynamic>(
                'uptime_growth_outside',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.DecCoin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory UptimeTracker.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UptimeTracker(
      uptimeGrowthOutside:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisConcentratedliquidityV1beta1UptimeTracker;
}
