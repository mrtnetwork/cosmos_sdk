import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Burn STRD
class MsgBurn extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgBurnResponse>, ICosmosProtoAminoMessage {
  final String? burner;

  final String? amount;

  const MsgBurn({this.burner, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "burner"),
        ProtoOptionString(name: "amino.name", value: "strdburner/MsgBurn"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [burner, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'burner': burner, 'amount': amount};
  }

  factory MsgBurn.fromJson(Map<String, dynamic> json) {
    return MsgBurn(
      burner: json.valueAsString<String?>('burner', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory MsgBurn.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBurn(
      burner: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStrdburnerMsgBurn;
  @override
  MsgBurnResponse onServiceResponse(List<int> bytes) {
    return MsgBurnResponse.deserialize(bytes);
  }

  @override
  MsgBurnResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgBurnResponse.fromJson(json);
  }
}

class MsgBurnResponse extends CosmosProtoMessage {
  const MsgBurnResponse();

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

  factory MsgBurnResponse.fromJson(Map<String, dynamic> json) {
    return MsgBurnResponse();
  }

  factory MsgBurnResponse.deserialize(List<int> bytes) {
    return MsgBurnResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStrdburnerMsgBurnResponse;
}

/// Link non-stride address
class MsgLink extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgLinkResponse>, ICosmosProtoAminoMessage {
  final String? strideAddress;

  final String? linkedAddress;

  const MsgLink({this.strideAddress, this.linkedAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "stride_address",
        ),
        ProtoOptionString(name: "amino.name", value: "strdburner/MsgLink"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [strideAddress, linkedAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'stride_address': strideAddress, 'linked_address': linkedAddress};
  }

  factory MsgLink.fromJson(Map<String, dynamic> json) {
    return MsgLink(
      strideAddress: json.valueAsString<String?>(
        'stride_address',
        acceptCamelCase: true,
      ),
      linkedAddress: json.valueAsString<String?>(
        'linked_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgLink.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLink(
      strideAddress: decode.getString<String?>(1),
      linkedAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStrdburnerMsgLink;
  @override
  MsgLinkResponse onServiceResponse(List<int> bytes) {
    return MsgLinkResponse.deserialize(bytes);
  }

  @override
  MsgLinkResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgLinkResponse.fromJson(json);
  }
}

class MsgLinkResponse extends CosmosProtoMessage {
  const MsgLinkResponse();

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

  factory MsgLinkResponse.fromJson(Map<String, dynamic> json) {
    return MsgLinkResponse();
  }

  factory MsgLinkResponse.deserialize(List<int> bytes) {
    return MsgLinkResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStrdburnerMsgLinkResponse;
}
