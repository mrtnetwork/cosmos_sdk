import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/opinit/opchild/v1/src/types.dart"
    as opinit_opchild_v1_types;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// /////////////////////////
/// Validator Messages
/// MsgExecuteMessages is a message to execute the given
/// authority messages with validator permission.
class MsgExecuteMessages extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgExecuteMessagesResponse>,
        ICosmosProtoAminoMessage {
  /// Sender is the that actor that signed a messages
  final String? sender;

  /// messages are the arbitrary messages to be executed.
  final List<google_protobuf_any.Any> messages;

  const MsgExecuteMessages({this.sender, this.messages = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(
          name: "amino.name",
          value: "opchild/MsgExecuteMessages",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, messages];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'messages': messages.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgExecuteMessages.fromJson(Map<String, dynamic> json) {
    return MsgExecuteMessages(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      messages:
          (json.valueEnsureAsList<dynamic>('messages', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_any.Any,
                  Map<String, dynamic>
                >(value: e, parse: (v) => google_protobuf_any.Any.fromJson(v)),
              )
              .toList(),
    );
  }

  factory MsgExecuteMessages.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExecuteMessages(
      sender: decode.getString<String?>(1),
      messages:
          decode
              .getListOfBytes(2)
              .map((b) => google_protobuf_any.Any.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgExecuteMessages;
  @override
  MsgExecuteMessagesResponse onServiceResponse(List<int> bytes) {
    return MsgExecuteMessagesResponse.deserialize(bytes);
  }

  @override
  MsgExecuteMessagesResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgExecuteMessagesResponse.fromJson(json);
  }
}

/// MsgExecuteMessagesResponse returns MsgExecuteMessages message result data
class MsgExecuteMessagesResponse extends CosmosProtoMessage {
  const MsgExecuteMessagesResponse();

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

  factory MsgExecuteMessagesResponse.fromJson(Map<String, dynamic> json) {
    return MsgExecuteMessagesResponse();
  }

  factory MsgExecuteMessagesResponse.deserialize(List<int> bytes) {
    return MsgExecuteMessagesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgExecuteMessagesResponse;
}

/// ///////////////////////////
/// Bridge Executor messages
/// MsgSetBridgeInfo is a message to set the registered bridge information.
class MsgSetBridgeInfo extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetBridgeInfoResponse>,
        ICosmosProtoAminoMessage {
  /// the sender address
  final String? sender;

  /// bridge_info is the bridge information to be set.
  final opinit_opchild_v1_types.BridgeInfo? bridgeInfo;

  const MsgSetBridgeInfo({this.sender, this.bridgeInfo});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(
          name: "amino.name",
          value: "opchild/MsgSetBridgeInfo",
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
  List<Object?> get protoValues => [sender, bridgeInfo];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'bridge_info': bridgeInfo?.toJson()};
  }

  factory MsgSetBridgeInfo.fromJson(Map<String, dynamic> json) {
    return MsgSetBridgeInfo(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      bridgeInfo: json
          .valueTo<opinit_opchild_v1_types.BridgeInfo?, Map<String, dynamic>>(
            key: 'bridge_info',
            parse: (v) => opinit_opchild_v1_types.BridgeInfo.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgSetBridgeInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetBridgeInfo(
      sender: decode.getString<String?>(1),
      bridgeInfo: decode.messageTo<opinit_opchild_v1_types.BridgeInfo?>(
        2,
        (b) => opinit_opchild_v1_types.BridgeInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgSetBridgeInfo;
  @override
  MsgSetBridgeInfoResponse onServiceResponse(List<int> bytes) {
    return MsgSetBridgeInfoResponse.deserialize(bytes);
  }

  @override
  MsgSetBridgeInfoResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSetBridgeInfoResponse.fromJson(json);
  }
}

/// MsgSetBridgeInfoResponse returns set bridge info result data
class MsgSetBridgeInfoResponse extends CosmosProtoMessage {
  const MsgSetBridgeInfoResponse();

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

  factory MsgSetBridgeInfoResponse.fromJson(Map<String, dynamic> json) {
    return MsgSetBridgeInfoResponse();
  }

  factory MsgSetBridgeInfoResponse.deserialize(List<int> bytes) {
    return MsgSetBridgeInfoResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgSetBridgeInfoResponse;
}

/// MsgFinalizeTokenDeposit is a message to submit deposit funds from upper layer
class MsgFinalizeTokenDeposit extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgFinalizeTokenDepositResponse>,
        ICosmosProtoAminoMessage {
  /// the sender address
  final String? sender;

  /// from is l1 sender address
  final String? from;

  /// to is l2 recipient address
  final String? to;

  /// amount is the coin amount to deposit.
  final cosmos_base_v1beta1_coin.Coin? amount;

  /// sequence is the sequence number of l1 bridge
  final BigInt? sequence;

  /// height is the height of l1 which is including the deposit message
  final BigInt? height;

  /// base_denom is the l1 denomination of the sent coin.
  final String? baseDenom;

  /// / data is a extra bytes for hooks.
  final List<int>? data;

  const MsgFinalizeTokenDeposit({
    this.sender,
    this.from,
    this.to,
    this.amount,
    this.sequence,
    this.height,
    this.baseDenom,
    this.data,
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
          value: "opchild/MsgFinalizeTokenDeposit",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.message(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.uint64(6),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.bytes(
          8,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sender,
    from,
    to,
    amount,
    sequence,
    height,
    baseDenom,
    data,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'from': from,
      'to': to,
      'amount': amount?.toJson(),
      'sequence': sequence?.toString(),
      'height': height?.toString(),
      'base_denom': baseDenom,
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgFinalizeTokenDeposit.fromJson(Map<String, dynamic> json) {
    return MsgFinalizeTokenDeposit(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      from: json.valueAsString<String?>('from', acceptCamelCase: true),
      to: json.valueAsString<String?>('to', acceptCamelCase: true),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      baseDenom: json.valueAsString<String?>(
        'base_denom',
        acceptCamelCase: true,
      ),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgFinalizeTokenDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgFinalizeTokenDeposit(
      sender: decode.getString<String?>(1),
      from: decode.getString<String?>(2),
      to: decode.getString<String?>(3),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        4,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      sequence: decode.getBigInt<BigInt?>(5),
      height: decode.getBigInt<BigInt?>(6),
      baseDenom: decode.getString<String?>(7),
      data: decode.getBytes<List<int>?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgFinalizeTokenDeposit;
  @override
  MsgFinalizeTokenDepositResponse onServiceResponse(List<int> bytes) {
    return MsgFinalizeTokenDepositResponse.deserialize(bytes);
  }

  @override
  MsgFinalizeTokenDepositResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgFinalizeTokenDepositResponse.fromJson(json);
  }
}

/// MsgFinalizeTokenDepositResponse returns deposit result data
class MsgFinalizeTokenDepositResponse extends CosmosProtoMessage {
  final opinit_opchild_v1_types.ResponseResultType? result;

  const MsgFinalizeTokenDepositResponse({this.result});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.enumType(1)],
    );
  }

  @override
  List<Object?> get protoValues => [result];

  @override
  Map<String, dynamic> toJson() {
    return {'result': result?.protoName};
  }

  factory MsgFinalizeTokenDepositResponse.fromJson(Map<String, dynamic> json) {
    return MsgFinalizeTokenDepositResponse(
      result: json
          .valueTo<opinit_opchild_v1_types.ResponseResultType?, Object?>(
            key: 'result',
            parse: (v) => opinit_opchild_v1_types.ResponseResultType.from(v),
          ),
    );
  }

  factory MsgFinalizeTokenDepositResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgFinalizeTokenDepositResponse(
      result: decode.getEnum<opinit_opchild_v1_types.ResponseResultType?>(
        1,
        opinit_opchild_v1_types.ResponseResultType.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgFinalizeTokenDepositResponse;
}

/// /////////////////////////
/// Relayer Messages
/// MsgRelayOracleData is a message for relayers to submit oracle data from L1 along with proof.
class MsgRelayOracleData extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRelayOracleDataResponse>,
        ICosmosProtoAminoMessage {
  /// sender is the relayer address submitting the oracle data.
  final String? sender;

  /// oracle_data contains the oracle price update data with proof.
  final opinit_opchild_v1_types.OracleData? oracleData;

  const MsgRelayOracleData({this.sender, this.oracleData});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(
          name: "amino.name",
          value: "opchild/MsgRelayOracleData",
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
  List<Object?> get protoValues => [sender, oracleData];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'oracle_data': oracleData?.toJson()};
  }

  factory MsgRelayOracleData.fromJson(Map<String, dynamic> json) {
    return MsgRelayOracleData(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      oracleData: json
          .valueTo<opinit_opchild_v1_types.OracleData?, Map<String, dynamic>>(
            key: 'oracle_data',
            parse: (v) => opinit_opchild_v1_types.OracleData.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgRelayOracleData.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRelayOracleData(
      sender: decode.getString<String?>(1),
      oracleData: decode.messageTo<opinit_opchild_v1_types.OracleData?>(
        2,
        (b) => opinit_opchild_v1_types.OracleData.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgRelayOracleData;
  @override
  MsgRelayOracleDataResponse onServiceResponse(List<int> bytes) {
    return MsgRelayOracleDataResponse.deserialize(bytes);
  }

  @override
  MsgRelayOracleDataResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRelayOracleDataResponse.fromJson(json);
  }
}

/// MsgRelayOracleDataResponse returns relay oracle data result
class MsgRelayOracleDataResponse extends CosmosProtoMessage {
  const MsgRelayOracleDataResponse();

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

  factory MsgRelayOracleDataResponse.fromJson(Map<String, dynamic> json) {
    return MsgRelayOracleDataResponse();
  }

  factory MsgRelayOracleDataResponse.deserialize(List<int> bytes) {
    return MsgRelayOracleDataResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgRelayOracleDataResponse;
}

/// MsgInitiateTokenWithdrawal is a message to withdraw a new token from L2 to L1.
class MsgInitiateTokenWithdrawal extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgInitiateTokenWithdrawalResponse>,
        ICosmosProtoAminoMessage {
  /// the l2 sender address
  final String? sender;

  /// to is l1 recipient address
  final String? to;

  /// amount is the coin amount to withdraw.
  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgInitiateTokenWithdrawal({this.sender, this.to, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(
          name: "amino.name",
          value: "opchild/MsgInitiateTokenWithdrawal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, to, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'to': to, 'amount': amount?.toJson()};
  }

  factory MsgInitiateTokenWithdrawal.fromJson(Map<String, dynamic> json) {
    return MsgInitiateTokenWithdrawal(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      to: json.valueAsString<String?>('to', acceptCamelCase: true),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgInitiateTokenWithdrawal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInitiateTokenWithdrawal(
      sender: decode.getString<String?>(1),
      to: decode.getString<String?>(2),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        4,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgInitiateTokenWithdrawal;
  @override
  MsgInitiateTokenWithdrawalResponse onServiceResponse(List<int> bytes) {
    return MsgInitiateTokenWithdrawalResponse.deserialize(bytes);
  }

  @override
  MsgInitiateTokenWithdrawalResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgInitiateTokenWithdrawalResponse.fromJson(json);
  }
}

/// MsgInitiateTokenWithdrawalResponse returns create token result data
class MsgInitiateTokenWithdrawalResponse extends CosmosProtoMessage {
  /// l2 sequence number
  final BigInt? sequence;

  const MsgInitiateTokenWithdrawalResponse({this.sequence});

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

  factory MsgInitiateTokenWithdrawalResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgInitiateTokenWithdrawalResponse(
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
    );
  }

  factory MsgInitiateTokenWithdrawalResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgInitiateTokenWithdrawalResponse(
      sequence: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .opinitOpchildV1MsgInitiateTokenWithdrawalResponse;
}

/// /////////////////////////
/// Authority Messages
/// MsgUpdateSequencer is a message to update the sequencer role in validator set
/// by removing the old sequencer and adding a new one.
class MsgUpdateSequencer extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateSequencerResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/opchild unless overwritten).
  final String? authority;

  final String? moniker;

  final String? sequencerAddress;

  final google_protobuf_any.Any? pubkey;

  const MsgUpdateSequencer({
    this.authority,
    this.moniker,
    this.sequencerAddress,
    this.pubkey,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "opchild/MsgUpdateSequencer",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    moniker,
    sequencerAddress,
    pubkey,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'moniker': moniker,
      'sequencer_address': sequencerAddress,
      'pubkey': pubkey?.toJson(),
    };
  }

  factory MsgUpdateSequencer.fromJson(Map<String, dynamic> json) {
    return MsgUpdateSequencer(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      moniker: json.valueAsString<String?>('moniker', acceptCamelCase: true),
      sequencerAddress: json.valueAsString<String?>(
        'sequencer_address',
        acceptCamelCase: true,
      ),
      pubkey: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'pubkey',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateSequencer.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateSequencer(
      authority: decode.getString<String?>(1),
      moniker: decode.getString<String?>(2),
      sequencerAddress: decode.getString<String?>(3),
      pubkey: decode.messageTo<google_protobuf_any.Any?>(
        4,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgUpdateSequencer;
  @override
  MsgUpdateSequencerResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateSequencerResponse.deserialize(bytes);
  }

  @override
  MsgUpdateSequencerResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateSequencerResponse.fromJson(json);
  }
}

/// MsgUpdateSequencerResponse returns update sequencer result data
class MsgUpdateSequencerResponse extends CosmosProtoMessage {
  const MsgUpdateSequencerResponse();

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

  factory MsgUpdateSequencerResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateSequencerResponse();
  }

  factory MsgUpdateSequencerResponse.deserialize(List<int> bytes) {
    return MsgUpdateSequencerResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgUpdateSequencerResponse;
}

/// MsgAddFeeWhitelistAddresses is a message to add addresses to the x/opchild fee whitelist
class MsgAddFeeWhitelistAddresses extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAddFeeWhitelistAddressesResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/opchild unless overwritten).
  final String? authority;

  final List<String> addresses;

  const MsgAddFeeWhitelistAddresses({
    this.authority,
    this.addresses = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "opchild/MsgAddFeeWhitelistAddresses",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, addresses];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'addresses': addresses.map((e) => e).toList(),
    };
  }

  factory MsgAddFeeWhitelistAddresses.fromJson(Map<String, dynamic> json) {
    return MsgAddFeeWhitelistAddresses(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      addresses:
          (json.valueEnsureAsList<dynamic>(
            'addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgAddFeeWhitelistAddresses.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddFeeWhitelistAddresses(
      authority: decode.getString<String?>(1),
      addresses: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgAddFeeWhitelistAddresses;
  @override
  MsgAddFeeWhitelistAddressesResponse onServiceResponse(List<int> bytes) {
    return MsgAddFeeWhitelistAddressesResponse.deserialize(bytes);
  }

  @override
  MsgAddFeeWhitelistAddressesResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgAddFeeWhitelistAddressesResponse.fromJson(json);
  }
}

/// MsgAddFeeWhitelistAddressesResponse returns the addition result data
class MsgAddFeeWhitelistAddressesResponse extends CosmosProtoMessage {
  const MsgAddFeeWhitelistAddressesResponse();

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

  factory MsgAddFeeWhitelistAddressesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgAddFeeWhitelistAddressesResponse();
  }

  factory MsgAddFeeWhitelistAddressesResponse.deserialize(List<int> bytes) {
    return MsgAddFeeWhitelistAddressesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .opinitOpchildV1MsgAddFeeWhitelistAddressesResponse;
}

/// MsgRemoveFeeWhitelistAddresses is a message to remove addresses from the x/opchild fee whitelist
class MsgRemoveFeeWhitelistAddresses extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRemoveFeeWhitelistAddressesResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/opchild unless overwritten).
  final String? authority;

  final List<String> addresses;

  const MsgRemoveFeeWhitelistAddresses({
    this.authority,
    this.addresses = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "opchild/MsgRemoveFeeWhitelistAddresses",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, addresses];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'addresses': addresses.map((e) => e).toList(),
    };
  }

  factory MsgRemoveFeeWhitelistAddresses.fromJson(Map<String, dynamic> json) {
    return MsgRemoveFeeWhitelistAddresses(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      addresses:
          (json.valueEnsureAsList<dynamic>(
            'addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgRemoveFeeWhitelistAddresses.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveFeeWhitelistAddresses(
      authority: decode.getString<String?>(1),
      addresses: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgRemoveFeeWhitelistAddresses;
  @override
  MsgRemoveFeeWhitelistAddressesResponse onServiceResponse(List<int> bytes) {
    return MsgRemoveFeeWhitelistAddressesResponse.deserialize(bytes);
  }

  @override
  MsgRemoveFeeWhitelistAddressesResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRemoveFeeWhitelistAddressesResponse.fromJson(json);
  }
}

/// MsgRemoveFeeWhitelistAddressesResponse returns the removal result data
class MsgRemoveFeeWhitelistAddressesResponse extends CosmosProtoMessage {
  const MsgRemoveFeeWhitelistAddressesResponse();

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

  factory MsgRemoveFeeWhitelistAddressesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgRemoveFeeWhitelistAddressesResponse();
  }

  factory MsgRemoveFeeWhitelistAddressesResponse.deserialize(List<int> bytes) {
    return MsgRemoveFeeWhitelistAddressesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .opinitOpchildV1MsgRemoveFeeWhitelistAddressesResponse;
}

/// MsgAddBridgeExecutor is a message to add addresses to the x/opchild bridge executors
class MsgAddBridgeExecutor extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAddBridgeExecutorResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/opchild unless overwritten).
  final String? authority;

  final List<String> addresses;

  const MsgAddBridgeExecutor({this.authority, this.addresses = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "opchild/MsgAddBridgeExecutor",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, addresses];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'addresses': addresses.map((e) => e).toList(),
    };
  }

  factory MsgAddBridgeExecutor.fromJson(Map<String, dynamic> json) {
    return MsgAddBridgeExecutor(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      addresses:
          (json.valueEnsureAsList<dynamic>(
            'addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgAddBridgeExecutor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddBridgeExecutor(
      authority: decode.getString<String?>(1),
      addresses: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgAddBridgeExecutor;
  @override
  MsgAddBridgeExecutorResponse onServiceResponse(List<int> bytes) {
    return MsgAddBridgeExecutorResponse.deserialize(bytes);
  }

  @override
  MsgAddBridgeExecutorResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgAddBridgeExecutorResponse.fromJson(json);
  }
}

/// MsgAddBridgeExecutorResponse returns the addition result data
class MsgAddBridgeExecutorResponse extends CosmosProtoMessage {
  const MsgAddBridgeExecutorResponse();

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

  factory MsgAddBridgeExecutorResponse.fromJson(Map<String, dynamic> json) {
    return MsgAddBridgeExecutorResponse();
  }

  factory MsgAddBridgeExecutorResponse.deserialize(List<int> bytes) {
    return MsgAddBridgeExecutorResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgAddBridgeExecutorResponse;
}

/// MsgRemoveBridgeExecutor is a message to remove addresses from the x/opchild bridge executors
class MsgRemoveBridgeExecutor extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRemoveBridgeExecutorResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/opchild unless overwritten).
  final String? authority;

  final List<String> addresses;

  const MsgRemoveBridgeExecutor({this.authority, this.addresses = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "opchild/MsgRemoveBridgeExecutor",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, addresses];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'addresses': addresses.map((e) => e).toList(),
    };
  }

  factory MsgRemoveBridgeExecutor.fromJson(Map<String, dynamic> json) {
    return MsgRemoveBridgeExecutor(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      addresses:
          (json.valueEnsureAsList<dynamic>(
            'addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgRemoveBridgeExecutor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveBridgeExecutor(
      authority: decode.getString<String?>(1),
      addresses: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgRemoveBridgeExecutor;
  @override
  MsgRemoveBridgeExecutorResponse onServiceResponse(List<int> bytes) {
    return MsgRemoveBridgeExecutorResponse.deserialize(bytes);
  }

  @override
  MsgRemoveBridgeExecutorResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRemoveBridgeExecutorResponse.fromJson(json);
  }
}

/// MsgRemoveBridgeExecutorResponse returns the removal result data
class MsgRemoveBridgeExecutorResponse extends CosmosProtoMessage {
  const MsgRemoveBridgeExecutorResponse();

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

  factory MsgRemoveBridgeExecutorResponse.fromJson(Map<String, dynamic> json) {
    return MsgRemoveBridgeExecutorResponse();
  }

  factory MsgRemoveBridgeExecutorResponse.deserialize(List<int> bytes) {
    return MsgRemoveBridgeExecutorResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgRemoveBridgeExecutorResponse;
}

/// MsgUpdateMinGasPrices is a message to update the min gas prices parameter
class MsgUpdateMinGasPrices extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateMinGasPricesResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/opchild unless overwritten).
  final String? authority;

  final List<cosmos_base_v1beta1_coin.DecCoin> minGasPrices;

  const MsgUpdateMinGasPrices({this.authority, this.minGasPrices = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "opchild/MsgUpdateMinGasPrices",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, minGasPrices];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'min_gas_prices': minGasPrices.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgUpdateMinGasPrices.fromJson(Map<String, dynamic> json) {
    return MsgUpdateMinGasPrices(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      minGasPrices:
          (json.valueEnsureAsList<dynamic>(
                'min_gas_prices',
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

  factory MsgUpdateMinGasPrices.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateMinGasPrices(
      authority: decode.getString<String?>(1),
      minGasPrices:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgUpdateMinGasPrices;
  @override
  MsgUpdateMinGasPricesResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateMinGasPricesResponse.deserialize(bytes);
  }

  @override
  MsgUpdateMinGasPricesResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateMinGasPricesResponse.fromJson(json);
  }
}

/// MsgUpdateMinGasPricesResponse returns the update result data
class MsgUpdateMinGasPricesResponse extends CosmosProtoMessage {
  const MsgUpdateMinGasPricesResponse();

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

  factory MsgUpdateMinGasPricesResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateMinGasPricesResponse();
  }

  factory MsgUpdateMinGasPricesResponse.deserialize(List<int> bytes) {
    return MsgUpdateMinGasPricesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgUpdateMinGasPricesResponse;
}

/// MsgUpdateAdmin is a message to update the opchild admin address
class MsgUpdateAdmin extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateAdminResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/opchild unless overwritten).
  final String? authority;

  final String? newAdmin;

  const MsgUpdateAdmin({this.authority, this.newAdmin});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "opchild/MsgUpdateAdmin"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, newAdmin];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'new_admin': newAdmin};
  }

  factory MsgUpdateAdmin.fromJson(Map<String, dynamic> json) {
    return MsgUpdateAdmin(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      newAdmin: json.valueAsString<String?>('new_admin', acceptCamelCase: true),
    );
  }

  factory MsgUpdateAdmin.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateAdmin(
      authority: decode.getString<String?>(1),
      newAdmin: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgUpdateAdmin;
  @override
  MsgUpdateAdminResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateAdminResponse.deserialize(bytes);
  }

  @override
  MsgUpdateAdminResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateAdminResponse.fromJson(json);
  }
}

/// MsgUpdateAdminResponse returns the update result data
class MsgUpdateAdminResponse extends CosmosProtoMessage {
  const MsgUpdateAdminResponse();

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

  factory MsgUpdateAdminResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateAdminResponse();
  }

  factory MsgUpdateAdminResponse.deserialize(List<int> bytes) {
    return MsgUpdateAdminResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgUpdateAdminResponse;
}

/// MsgUpdateParams is a message to update parameters
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/opchild unless overwritten).
  final String? authority;

  /// params are the arbitrary parameters to be updated.
  final opinit_opchild_v1_types.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "opchild/MsgUpdateParams"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
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
      params: json
          .valueTo<opinit_opchild_v1_types.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => opinit_opchild_v1_types.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<opinit_opchild_v1_types.Params?>(
        2,
        (b) => opinit_opchild_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// MsgUpdateParamsResponse returns parameter update result data
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
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgUpdateParamsResponse;
}

/// MsgSpendFeePool is a message to withdraw collected fees from the module
/// account to the recipient address.
class MsgSpendFeePool extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSpendFeePoolResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/opchild unless overwritten).
  final String? authority;

  /// recipient is address to receive the coins.
  final String? recipient;

  /// the coin amount to spend.
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgSpendFeePool({
    this.authority,
    this.recipient,
    this.amount = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "opchild/MsgSpendFeePool"),
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
  List<Object?> get protoValues => [authority, recipient, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'recipient': recipient,
      'amount': amount.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgSpendFeePool.fromJson(Map<String, dynamic> json) {
    return MsgSpendFeePool(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      recipient: json.valueAsString<String?>(
        'recipient',
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

  factory MsgSpendFeePool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSpendFeePool(
      authority: decode.getString<String?>(1),
      recipient: decode.getString<String?>(2),
      amount:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgSpendFeePool;
  @override
  MsgSpendFeePoolResponse onServiceResponse(List<int> bytes) {
    return MsgSpendFeePoolResponse.deserialize(bytes);
  }

  @override
  MsgSpendFeePoolResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSpendFeePoolResponse.fromJson(json);
  }
}

/// MsgSpendFeePoolResponse returns deposit result data
class MsgSpendFeePoolResponse extends CosmosProtoMessage {
  const MsgSpendFeePoolResponse();

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

  factory MsgSpendFeePoolResponse.fromJson(Map<String, dynamic> json) {
    return MsgSpendFeePoolResponse();
  }

  factory MsgSpendFeePoolResponse.deserialize(List<int> bytes) {
    return MsgSpendFeePoolResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgSpendFeePoolResponse;
}

/// MsgUpdateOracle is a message to update oracle prices which contains L1 extended commits for oracle.
class MsgUpdateOracle extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateOracleResponse>,
        ICosmosProtoAminoMessage {
  /// the sender address
  final String? sender;

  /// height is the height of l1 which is including the oracle message
  final BigInt? height;

  /// / data is oracle votes bytes.
  final List<int>? data;

  const MsgUpdateOracle({this.sender, this.height, this.data});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(name: "amino.name", value: "opchild/MsgUpdateOracle"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.bytes(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, height, data];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'height': height?.toString(),
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgUpdateOracle.fromJson(Map<String, dynamic> json) {
    return MsgUpdateOracle(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgUpdateOracle.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateOracle(
      sender: decode.getString<String?>(1),
      height: decode.getBigInt<BigInt?>(2),
      data: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgUpdateOracle;
  @override
  MsgUpdateOracleResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateOracleResponse.deserialize(bytes);
  }

  @override
  MsgUpdateOracleResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateOracleResponse.fromJson(json);
  }
}

/// MsgUpdateOracleResponse returns oracle update result data
class MsgUpdateOracleResponse extends CosmosProtoMessage {
  const MsgUpdateOracleResponse();

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

  factory MsgUpdateOracleResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateOracleResponse();
  }

  factory MsgUpdateOracleResponse.deserialize(List<int> bytes) {
    return MsgUpdateOracleResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgUpdateOracleResponse;
}

/// MsgRegisterMigrationInfo is a message to register the migration information.
class MsgRegisterMigrationInfo extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRegisterMigrationInfoResponse>,
        ICosmosProtoAminoMessage {
  /// the authority address
  final String? authority;

  /// migration_info is the migration information to be registered.
  final opinit_opchild_v1_types.MigrationInfo? migrationInfo;

  const MsgRegisterMigrationInfo({this.authority, this.migrationInfo});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "opchild/MsgRegisterMigrationInfo",
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
  List<Object?> get protoValues => [authority, migrationInfo];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'migration_info': migrationInfo?.toJson()};
  }

  factory MsgRegisterMigrationInfo.fromJson(Map<String, dynamic> json) {
    return MsgRegisterMigrationInfo(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      migrationInfo: json.valueTo<
        opinit_opchild_v1_types.MigrationInfo?,
        Map<String, dynamic>
      >(
        key: 'migration_info',
        parse: (v) => opinit_opchild_v1_types.MigrationInfo.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRegisterMigrationInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRegisterMigrationInfo(
      authority: decode.getString<String?>(1),
      migrationInfo: decode.messageTo<opinit_opchild_v1_types.MigrationInfo?>(
        2,
        (b) => opinit_opchild_v1_types.MigrationInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgRegisterMigrationInfo;
  @override
  MsgRegisterMigrationInfoResponse onServiceResponse(List<int> bytes) {
    return MsgRegisterMigrationInfoResponse.deserialize(bytes);
  }

  @override
  MsgRegisterMigrationInfoResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRegisterMigrationInfoResponse.fromJson(json);
  }
}

/// MsgRegisterMigrationInfoResponse returns the registration result data
class MsgRegisterMigrationInfoResponse extends CosmosProtoMessage {
  const MsgRegisterMigrationInfoResponse();

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

  factory MsgRegisterMigrationInfoResponse.fromJson(Map<String, dynamic> json) {
    return MsgRegisterMigrationInfoResponse();
  }

  factory MsgRegisterMigrationInfoResponse.deserialize(List<int> bytes) {
    return MsgRegisterMigrationInfoResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgRegisterMigrationInfoResponse;
}

/// MsgMigrateToken is a message to migrate the origin OP token to registered IBC token.
class MsgMigrateToken extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgMigrateTokenResponse>,
        ICosmosProtoAminoMessage {
  /// the sender address
  final String? sender;

  /// amount is the coin amount to migrate.
  final cosmos_base_v1beta1_coin.Coin? amount;

  const MsgMigrateToken({this.sender, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(name: "amino.name", value: "opchild/MsgMigrateToken"),
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
  List<Object?> get protoValues => [sender, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'amount': amount?.toJson()};
  }

  factory MsgMigrateToken.fromJson(Map<String, dynamic> json) {
    return MsgMigrateToken(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgMigrateToken.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgMigrateToken(
      sender: decode.getString<String?>(1),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgMigrateToken;
  @override
  MsgMigrateTokenResponse onServiceResponse(List<int> bytes) {
    return MsgMigrateTokenResponse.deserialize(bytes);
  }

  @override
  MsgMigrateTokenResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgMigrateTokenResponse.fromJson(json);
  }
}

/// MsgMigrateTokenResponse returns the migration result data
class MsgMigrateTokenResponse extends CosmosProtoMessage {
  const MsgMigrateTokenResponse();

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

  factory MsgMigrateTokenResponse.fromJson(Map<String, dynamic> json) {
    return MsgMigrateTokenResponse();
  }

  factory MsgMigrateTokenResponse.deserialize(List<int> bytes) {
    return MsgMigrateTokenResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.opinitOpchildV1MsgMigrateTokenResponse;
}
