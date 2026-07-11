import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/stratos/sds/v1/src/sds.dart"
    as stratos_sds_v1_sds;

class MsgFileUpload extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgFileUploadResponse>,
        ICosmosProtoAminoMessage {
  final String? fileHash;

  final String? from;

  final String? reporter;

  final String? uploader;

  const MsgFileUpload({this.fileHash, this.from, this.reporter, this.uploader});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(name: "amino.name", value: "stratos/MsgFileUpload"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [fileHash, from, reporter, uploader];

  @override
  Map<String, dynamic> toJson() {
    return {
      'file_hash': fileHash,
      'from': from,
      'reporter': reporter,
      'uploader': uploader,
    };
  }

  factory MsgFileUpload.fromJson(Map<String, dynamic> json) {
    return MsgFileUpload(
      fileHash: json.valueAsString<String?>('file_hash', acceptCamelCase: true),
      from: json.valueAsString<String?>('from', acceptCamelCase: true),
      reporter: json.valueAsString<String?>('reporter', acceptCamelCase: true),
      uploader: json.valueAsString<String?>('uploader', acceptCamelCase: true),
    );
  }

  factory MsgFileUpload.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgFileUpload(
      fileHash: decode.getString<String?>(1),
      from: decode.getString<String?>(2),
      reporter: decode.getString<String?>(3),
      uploader: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1MsgFileUpload;
  @override
  MsgFileUploadResponse onServiceResponse(List<int> bytes) {
    return MsgFileUploadResponse.deserialize(bytes);
  }

  @override
  MsgFileUploadResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgFileUploadResponse.fromJson(json);
  }
}

class MsgFileUploadResponse extends CosmosProtoMessage {
  const MsgFileUploadResponse();

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

  factory MsgFileUploadResponse.fromJson(Map<String, dynamic> json) {
    return MsgFileUploadResponse();
  }

  factory MsgFileUploadResponse.deserialize(List<int> bytes) {
    return MsgFileUploadResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1MsgFileUploadResponse;
}

class MsgPrepay extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgPrepayResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final String? beneficiary;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgPrepay({this.sender, this.beneficiary, this.amount = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(name: "amino.name", value: "stratos/MsgPrepay"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, beneficiary, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'beneficiary': beneficiary,
      'amount': amount.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgPrepay.fromJson(Map<String, dynamic> json) {
    return MsgPrepay(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      beneficiary: json.valueAsString<String?>(
        'beneficiary',
        acceptCamelCase: true,
      ),
      amount:
          (json.valueEnsureAsList<dynamic>('amount', acceptCamelCase: true))
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
    );
  }

  factory MsgPrepay.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgPrepay(
      sender: decode.getString<String?>(1),
      beneficiary: decode.getString<String?>(2),
      amount:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1MsgPrepay;
  @override
  MsgPrepayResponse onServiceResponse(List<int> bytes) {
    return MsgPrepayResponse.deserialize(bytes);
  }

  @override
  MsgPrepayResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgPrepayResponse.fromJson(json);
  }
}

class MsgPrepayResponse extends CosmosProtoMessage {
  const MsgPrepayResponse();

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

  factory MsgPrepayResponse.fromJson(Map<String, dynamic> json) {
    return MsgPrepayResponse();
  }

  factory MsgPrepayResponse.deserialize(List<int> bytes) {
    return MsgPrepayResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1MsgPrepayResponse;
}

/// MsgUpdateParams defines a Msg for updating the x/sds module parameters.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the x/sds parameters to update.
  /// NOTE: All parameters must be supplied.
  final stratos_sds_v1_sds.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/x/sds/MsgUpdateParams",
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
  List<Object?> get protoValues => [authority, params];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'params': params?.toJson()};
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      params: json.valueTo<stratos_sds_v1_sds.Params?, Map<String, dynamic>>(
        key: 'params',
        parse: (v) => stratos_sds_v1_sds.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<stratos_sds_v1_sds.Params?>(
        2,
        (b) => stratos_sds_v1_sds.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// MsgUpdateParamsResponse defines the response structure for executing a
/// MsgUpdateParams message.
class MsgUpdateParamsResponse extends CosmosProtoMessage {
  const MsgUpdateParamsResponse();

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

  factory MsgUpdateParamsResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1MsgUpdateParamsResponse;
}
