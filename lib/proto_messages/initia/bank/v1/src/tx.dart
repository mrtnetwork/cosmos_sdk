import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/bank/v1beta1/src/bank.dart"
    as cosmos_bank_v1beta1_bank;

/// MsgSetDenomMetadata is the Msg/UpdateParams request type.
class MsgSetDenomMetadata extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetDenomMetadataResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// metadata defines the x/bank denom metadata to update.
  final cosmos_bank_v1beta1_bank.Metadata? metadata;

  const MsgSetDenomMetadata({this.authority, this.metadata});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "bank/MsgSetDenomMetadata",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, metadata];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'metadata': metadata?.toJson()};
  }

  factory MsgSetDenomMetadata.fromJson(Map<String, dynamic> json) {
    return MsgSetDenomMetadata(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      metadata: json
          .valueTo<cosmos_bank_v1beta1_bank.Metadata?, Map<String, dynamic>>(
            key: 'metadata',
            parse: (v) => cosmos_bank_v1beta1_bank.Metadata.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgSetDenomMetadata.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetDenomMetadata(
      authority: decode.getString<String?>(1),
      metadata: decode.messageTo<cosmos_bank_v1beta1_bank.Metadata?>(
        2,
        (b) => cosmos_bank_v1beta1_bank.Metadata.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaBankV1MsgSetDenomMetadata;
  @override
  MsgSetDenomMetadataResponse onServiceResponse(List<int> bytes) {
    return MsgSetDenomMetadataResponse.deserialize(bytes);
  }

  @override
  MsgSetDenomMetadataResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSetDenomMetadataResponse.fromJson(json);
  }
}

/// MsgSetDenomMetadataResponse defines the response structure for executing a
/// MsgSetDenomMetadata message.
class MsgSetDenomMetadataResponse extends CosmosProtoMessage {
  const MsgSetDenomMetadataResponse();

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

  factory MsgSetDenomMetadataResponse.fromJson(Map<String, dynamic> json) {
    return MsgSetDenomMetadataResponse();
  }

  factory MsgSetDenomMetadataResponse.deserialize(List<int> bytes) {
    return MsgSetDenomMetadataResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaBankV1MsgSetDenomMetadataResponse;
}
