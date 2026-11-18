import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/core/client/v1/src/client.dart"
    as ibc_core_client_v1_client;
import "package:cosmos_sdk/proto_messages/ibc/applications/nft_transfer/v1/src/types.dart"
    as ibc_applications_nft_transfer_v1_types;

/// MsgTransfer defines a msg to transfer non-fungible tokens (i.e NFTs) between
/// ics721-1 enabled chains. See ICS Spec here:
/// https://github.com/cosmos/ibc/tree/main/spec/app/ics-721-nft-transfer
class MsgTransfer extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgTransferResponse>,
        ICosmosProtoAminoMessage {
  /// the port on which the packet will be sent
  final String? sourcePort;

  /// the channel by which the packet will be sent
  final String? sourceChannel;

  /// the class id is the struct tag of the extension
  final String? classId;

  /// the token id of the NFT
  final List<String> tokenIds;

  /// the sender address
  final String? sender;

  /// the recipient address on the destination chain
  final String? receiver;

  /// Timeout height relative to the current block height.
  /// The timeout is disabled when set to 0.
  final ibc_core_client_v1_client.Height? timeoutHeight;

  /// Timeout timestamp in absolute nanoseconds since unix epoch.
  /// The timeout is disabled when set to 0.
  final BigInt? timeoutTimestamp;

  /// optional memo
  final String? memo;

  const MsgTransfer({
    this.sourcePort,
    this.sourceChannel,
    this.classId,
    this.tokenIds = const [],
    this.sender,
    this.receiver,
    this.timeoutHeight,
    this.timeoutTimestamp,
    this.memo,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(
          name: "amino.name",
          value: "nft-transfer/MsgTransfer",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.uint64(8, options: const []),
        ProtoFieldConfig.string(9),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sourcePort,
    sourceChannel,
    classId,
    tokenIds,
    sender,
    receiver,
    timeoutHeight,
    timeoutTimestamp,
    memo,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'source_port': sourcePort,
      'source_channel': sourceChannel,
      'class_id': classId,
      'token_ids': tokenIds.map((e) => e).toList(),
      'sender': sender,
      'receiver': receiver,
      'timeout_height': config.encodeMessage(timeoutHeight),
      'timeout_timestamp': config.encodeBigint(timeoutTimestamp),
      'memo': memo,
    };
  }

  factory MsgTransfer.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgTransfer(
      sourcePort: json.valueAsString<String?>(
        'source_port',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sourceChannel: json.valueAsString<String?>(
        'source_channel',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      classId: json.valueAsString<String?>(
        'class_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tokenIds:
          (json.valueEnsureAsList<dynamic>(
            'token_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      sender: json.valueAsString<String?>(
        'sender',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      receiver: json.valueAsString<String?>(
        'receiver',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      timeoutHeight: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'timeout_height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      timeoutTimestamp: json.valueAsBigInt<BigInt?>(
        'timeout_timestamp',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      memo: json.valueAsString<String?>(
        'memo',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgTransfer.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTransfer(
      sourcePort: decode.getString<String?>(1),
      sourceChannel: decode.getString<String?>(2),
      classId: decode.getString<String?>(3),
      tokenIds: decode.getListOrEmpty<String>(4),
      sender: decode.getString<String?>(5),
      receiver: decode.getString<String?>(6),
      timeoutHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        7,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      timeoutTimestamp: decode.getBigInt<BigInt?>(8),
      memo: decode.getString<String?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsNftTransferV1MsgTransfer;
  @override
  MsgTransferResponse onServiceResponse(List<int> bytes) {
    return MsgTransferResponse.deserialize(bytes);
  }

  @override
  MsgTransferResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgTransferResponse.fromJson(json);
  }
}

/// MsgTransferResponse defines the Msg/NftTransfer response type.
class MsgTransferResponse extends CosmosProtoMessage {
  /// sequence number of the nft transfer packet sent
  final BigInt? sequence;

  const MsgTransferResponse({this.sequence});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [sequence];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'sequence': config.encodeBigint(sequence)};
  }

  factory MsgTransferResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgTransferResponse(
      sequence: json.valueAsBigInt<BigInt?>(
        'sequence',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgTransferResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTransferResponse(sequence: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsNftTransferV1MsgTransferResponse;
}

/// MsgUpdateParams is the Msg/UpdateParams request type.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// params defines the x/nft-transfer parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final ibc_applications_nft_transfer_v1_types.Params? params;

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
          value: "nft-transfer/MsgUpdateParams",
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'authority': authority, 'params': config.encodeMessage(params)};
  }

  factory MsgUpdateParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      params: json
          .valueTo<ibc_applications_nft_transfer_v1_types.Params?, Object>(
            key: 'params',
            parse:
                (v) => ibc_applications_nft_transfer_v1_types.Params.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<ibc_applications_nft_transfer_v1_types.Params?>(
        2,
        (b) => ibc_applications_nft_transfer_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsNftTransferV1MsgUpdateParams;
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
///
/// Since: cosmos-sdk 0.47
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory MsgUpdateParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsNftTransferV1MsgUpdateParamsResponse;
}
