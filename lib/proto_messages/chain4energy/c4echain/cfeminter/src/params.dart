import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfeminter/src/minter.dart"
    as chain4energy_c4echain_cfeminter_minter;

/// Params defines the parameters for the module.
class Params extends CosmosProtoMessage {
  final String? mintDenom;

  final google_protobuf_timestamp.Timestamp? startTime;

  final List<chain4energy_c4echain_cfeminter_minter.Minter> minters;

  const Params({this.mintDenom, this.startTime, this.minters = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [mintDenom, startTime, minters];

  @override
  Map<String, dynamic> toJson() {
    return {
      'mint_denom': mintDenom,
      'start_time': startTime?.toRfc3339(),
      'minters': minters.map((e) => e.toJson()).toList(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      mintDenom: json.valueAsString<String?>(
        'mint_denom',
        acceptCamelCase: true,
      ),
      startTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'start_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      minters:
          (json.valueEnsureAsList<dynamic>('minters', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfeminter_minter.Minter,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => chain4energy_c4echain_cfeminter_minter
                          .Minter.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      mintDenom: decode.getString<String?>(1),
      startTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        2,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      minters:
          decode
              .getListOfBytes(3)
              .map(
                (b) => chain4energy_c4echain_cfeminter_minter
                    .Minter.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeminterParams;
}
