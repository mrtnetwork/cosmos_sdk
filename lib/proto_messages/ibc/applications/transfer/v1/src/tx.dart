import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/ibc/core/client/v1/src/client.dart"
    as ibc_core_client_v1_client;
import "package:cosmos_sdk/proto_messages/ibc/applications/transfer/v1/src/transfer.dart"
    as ibc_applications_transfer_v1_transfer;

/// MsgTransfer defines a msg to transfer fungible tokens (i.e Coins) between
/// ICS20 enabled chains. See ICS Spec here:
/// https://github.com/cosmos/ibc/tree/master/spec/app/ics-020-fungible-token-transfer#data-structures
class MsgTransfer extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgTransferResponse>,
        ICosmosProtoAminoMessage {
  /// the port on which the packet will be sent
  final String? sourcePort;

  /// the channel by which the packet will be sent
  final String? sourceChannel;

  /// token to be transferred
  final cosmos_base_v1beta1_coin.Coin? token;

  /// the sender address
  final String? sender;

  /// the recipient address on the destination chain
  final String? receiver;

  /// Timeout height relative to the current block height.
  /// If you are sending with IBC v1 protocol, either timeout_height or timeout_timestamp must be set.
  /// If you are sending with IBC v2 protocol, timeout_timestamp must be set, and timeout_height must be omitted.
  final ibc_core_client_v1_client.Height? timeoutHeight;

  /// Timeout timestamp in absolute nanoseconds since unix epoch.
  /// If you are sending with IBC v1 protocol, either timeout_height or timeout_timestamp must be set.
  /// If you are sending with IBC v2 protocol, timeout_timestamp must be set.
  final BigInt? timeoutTimestamp;

  /// optional memo
  final String? memo;

  /// optional encoding
  final String? encoding;

  const MsgTransfer({
    this.sourcePort,
    this.sourceChannel,
    this.token,
    this.sender,
    this.receiver,
    this.timeoutHeight,
    this.timeoutTimestamp,
    this.memo,
    this.encoding,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "cosmos-sdk/MsgTransfer"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.message(
          6,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.uint64(7),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.string(9),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sourcePort,
    sourceChannel,
    token,
    sender,
    receiver,
    timeoutHeight,
    timeoutTimestamp,
    memo,
    encoding,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'source_port': sourcePort,
      'source_channel': sourceChannel,
      'token': token?.toJson(),
      'sender': sender,
      'receiver': receiver,
      'timeout_height': timeoutHeight?.toJson(),
      'timeout_timestamp': timeoutTimestamp?.toString(),
      'memo': memo,
      'encoding': encoding,
    };
  }

  factory MsgTransfer.fromJson(Map<String, dynamic> json) {
    return MsgTransfer(
      sourcePort: json.valueAsString<String?>(
        'source_port',
        acceptCamelCase: true,
      ),
      sourceChannel: json.valueAsString<String?>(
        'source_channel',
        acceptCamelCase: true,
      ),
      token: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
        key: 'token',
        parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
        acceptCamelCase: true,
      ),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      receiver: json.valueAsString<String?>('receiver', acceptCamelCase: true),
      timeoutHeight: json
          .valueTo<ibc_core_client_v1_client.Height?, Map<String, dynamic>>(
            key: 'timeout_height',
            parse: (v) => ibc_core_client_v1_client.Height.fromJson(v),
            acceptCamelCase: true,
          ),
      timeoutTimestamp: json.valueAsBigInt<BigInt?>(
        'timeout_timestamp',
        acceptCamelCase: true,
      ),
      memo: json.valueAsString<String?>('memo', acceptCamelCase: true),
      encoding: json.valueAsString<String?>('encoding', acceptCamelCase: true),
    );
  }

  factory MsgTransfer.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTransfer(
      sourcePort: decode.getString<String?>(1),
      sourceChannel: decode.getString<String?>(2),
      token: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      sender: decode.getString<String?>(4),
      receiver: decode.getString<String?>(5),
      timeoutHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        6,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      timeoutTimestamp: decode.getBigInt<BigInt?>(7),
      memo: decode.getString<String?>(8),
      encoding: decode.getString<String?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsTransferV1MsgTransfer;
  @override
  MsgTransferResponse onServiceResponse(List<int> bytes) {
    return MsgTransferResponse.deserialize(bytes);
  }

  @override
  MsgTransferResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgTransferResponse.fromJson(json);
  }
}

/// MsgTransferResponse defines the Msg/Transfer response type.
class MsgTransferResponse extends CosmosProtoMessage {
  /// sequence number of the transfer packet sent
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
  Map<String, dynamic> toJson() {
    return {'sequence': sequence?.toString()};
  }

  factory MsgTransferResponse.fromJson(Map<String, dynamic> json) {
    return MsgTransferResponse(
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
    );
  }

  factory MsgTransferResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTransferResponse(sequence: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsTransferV1MsgTransferResponse;
}

/// MsgUpdateParams is the Msg/UpdateParams request type.
class MsgUpdateParams extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateParamsResponse> {
  /// signer address
  final String? signer;

  /// params defines the transfer parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final ibc_applications_transfer_v1_transfer.Params? params;

  const MsgUpdateParams({this.signer, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [signer, params];

  @override
  Map<String, dynamic> toJson() {
    return {'signer': signer, 'params': params?.toJson()};
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
      params: json.valueTo<
        ibc_applications_transfer_v1_transfer.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => ibc_applications_transfer_v1_transfer.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      signer: decode.getString<String?>(1),
      params: decode.messageTo<ibc_applications_transfer_v1_transfer.Params?>(
        2,
        (b) => ibc_applications_transfer_v1_transfer.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsTransferV1MsgUpdateParams;
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
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsTransferV1MsgUpdateParamsResponse;
}
