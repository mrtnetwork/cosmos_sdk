import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/txfees/v1beta1/src/feetoken.dart"
    as osmosis_txfees_v1beta1_feetoken;

/// ===================== MsgSetFeeTokens
class MsgSetFeeTokens extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetFeeTokensResponse>,
        ICosmosProtoAminoMessage {
  final List<osmosis_txfees_v1beta1_feetoken.FeeToken> feeTokens;

  final String? sender;

  const MsgSetFeeTokens({this.feeTokens = const [], this.sender});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "osmosis/set-fee-tokens"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [feeTokens, sender];

  @override
  Map<String, dynamic> toJson() {
    return {
      'fee_tokens': feeTokens.map((e) => e.toJson()).toList(),
      'sender': sender,
    };
  }

  factory MsgSetFeeTokens.fromJson(Map<String, dynamic> json) {
    return MsgSetFeeTokens(
      feeTokens:
          (json.valueEnsureAsList<dynamic>('fee_tokens', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_txfees_v1beta1_feetoken.FeeToken,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          osmosis_txfees_v1beta1_feetoken.FeeToken.fromJson(v),
                ),
              )
              .toList(),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
    );
  }

  factory MsgSetFeeTokens.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetFeeTokens(
      feeTokens:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_txfees_v1beta1_feetoken.FeeToken.deserialize(b),
              )
              .toList(),
      sender: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTxfeesV1beta1MsgSetFeeTokens;
  @override
  MsgSetFeeTokensResponse onServiceResponse(List<int> bytes) {
    return MsgSetFeeTokensResponse.deserialize(bytes);
  }

  @override
  MsgSetFeeTokensResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSetFeeTokensResponse.fromJson(json);
  }
}

class MsgSetFeeTokensResponse extends CosmosProtoMessage {
  const MsgSetFeeTokensResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgSetFeeTokensResponse.fromJson(Map<String, dynamic> json) {
    return MsgSetFeeTokensResponse();
  }

  factory MsgSetFeeTokensResponse.deserialize(List<int> bytes) {
    return MsgSetFeeTokensResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTxfeesV1beta1MsgSetFeeTokensResponse;
}
