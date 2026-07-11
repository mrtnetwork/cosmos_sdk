import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/cosmos/bank/v1beta1/src/bank.dart"
    as cosmos_bank_v1beta1_bank;

/// MsgSend represents a message to send coins from one account to another.
class MsgSend extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgSendResponse>, ICosmosProtoAminoMessage {
  final String? fromAddress;

  final String? toAddress;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgSend({this.fromAddress, this.toAddress, this.amount = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from_address"),
        ProtoOptionString(name: "amino.name", value: "cosmos-sdk/MsgSend"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [fromAddress, toAddress, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'from_address': fromAddress,
      'to_address': toAddress,
      'amount': amount.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgSend.fromJson(Map<String, dynamic> json) {
    return MsgSend(
      fromAddress: json.valueAsString<String?>(
        'from_address',
        acceptCamelCase: true,
      ),
      toAddress: json.valueAsString<String?>(
        'to_address',
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

  factory MsgSend.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSend(
      fromAddress: decode.getString<String?>(1),
      toAddress: decode.getString<String?>(2),
      amount:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1MsgSend;
  @override
  MsgSendResponse onServiceResponse(List<int> bytes) {
    return MsgSendResponse.deserialize(bytes);
  }

  @override
  MsgSendResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSendResponse.fromJson(json);
  }
}

/// MsgSendResponse defines the Msg/Send response type.
class MsgSendResponse extends CosmosProtoMessage {
  const MsgSendResponse();

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

  factory MsgSendResponse.fromJson(Map<String, dynamic> json) {
    return MsgSendResponse();
  }

  factory MsgSendResponse.deserialize(List<int> bytes) {
    return MsgSendResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1MsgSendResponse;
}

/// MsgMultiSend represents an arbitrary multi-in, multi-out send message.
class MsgMultiSend extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgMultiSendResponse>,
        ICosmosProtoAminoMessage {
  /// Inputs, despite being `repeated`, only allows one sender input. This is
  /// checked in MsgMultiSend's ValidateBasic.
  final List<cosmos_bank_v1beta1_bank.Input> inputs;

  final List<cosmos_bank_v1beta1_bank.Output> outputs;

  const MsgMultiSend({this.inputs = const [], this.outputs = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "inputs"),
        ProtoOptionString(name: "amino.name", value: "cosmos-sdk/MsgMultiSend"),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [inputs, outputs];

  @override
  Map<String, dynamic> toJson() {
    return {
      'inputs': inputs.map((e) => e.toJson()).toList(),
      'outputs': outputs.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgMultiSend.fromJson(Map<String, dynamic> json) {
    return MsgMultiSend(
      inputs:
          (json.valueEnsureAsList<dynamic>('inputs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_bank_v1beta1_bank.Input,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_bank_v1beta1_bank.Input.fromJson(v),
                ),
              )
              .toList(),
      outputs:
          (json.valueEnsureAsList<dynamic>('outputs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_bank_v1beta1_bank.Output,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_bank_v1beta1_bank.Output.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgMultiSend.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgMultiSend(
      inputs:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_bank_v1beta1_bank.Input.deserialize(b))
              .toList(),
      outputs:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_bank_v1beta1_bank.Output.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1MsgMultiSend;
  @override
  MsgMultiSendResponse onServiceResponse(List<int> bytes) {
    return MsgMultiSendResponse.deserialize(bytes);
  }

  @override
  MsgMultiSendResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgMultiSendResponse.fromJson(json);
  }
}

/// MsgMultiSendResponse defines the Msg/MultiSend response type.
class MsgMultiSendResponse extends CosmosProtoMessage {
  const MsgMultiSendResponse();

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

  factory MsgMultiSendResponse.fromJson(Map<String, dynamic> json) {
    return MsgMultiSendResponse();
  }

  factory MsgMultiSendResponse.deserialize(List<int> bytes) {
    return MsgMultiSendResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1MsgMultiSendResponse;
}

/// MsgUpdateParams is the Msg/UpdateParams request type.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// params defines the x/bank parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final cosmos_bank_v1beta1_bank.Params? params;

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
          value: "cosmos-sdk/x/bank/MsgUpdateParams",
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
      params: json
          .valueTo<cosmos_bank_v1beta1_bank.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => cosmos_bank_v1beta1_bank.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<cosmos_bank_v1beta1_bank.Params?>(
        2,
        (b) => cosmos_bank_v1beta1_bank.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1MsgUpdateParams;
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
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1MsgUpdateParamsResponse;
}

/// MsgSetSendEnabled is the Msg/SetSendEnabled request type.
///
/// Only entries to add/update/delete need to be included.
/// Existing SendEnabled entries that are not included in this
/// message are left unchanged.
class MsgSetSendEnabled extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetSendEnabledResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module.
  final String? authority;

  /// send_enabled is the list of entries to add or update.
  final List<cosmos_bank_v1beta1_bank.SendEnabled> sendEnabled;

  /// use_default_for is a list of denoms that should use the params.default_send_enabled value.
  /// Denoms listed here will have their SendEnabled entries deleted.
  /// If a denom is included that doesn't have a SendEnabled entry,
  /// it will be ignored.
  final List<String> useDefaultFor;

  const MsgSetSendEnabled({
    this.authority,
    this.sendEnabled = const [],
    this.useDefaultFor = const [],
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
          value: "cosmos-sdk/MsgSetSendEnabled",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, sendEnabled, useDefaultFor];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'send_enabled': sendEnabled.map((e) => e.toJson()).toList(),
      'use_default_for': useDefaultFor.map((e) => e).toList(),
    };
  }

  factory MsgSetSendEnabled.fromJson(Map<String, dynamic> json) {
    return MsgSetSendEnabled(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      sendEnabled:
          (json.valueEnsureAsList<dynamic>(
                'send_enabled',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_bank_v1beta1_bank.SendEnabled,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => cosmos_bank_v1beta1_bank.SendEnabled.fromJson(v),
                ),
              )
              .toList(),
      useDefaultFor:
          (json.valueEnsureAsList<dynamic>(
            'use_default_for',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgSetSendEnabled.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetSendEnabled(
      authority: decode.getString<String?>(1),
      sendEnabled:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_bank_v1beta1_bank.SendEnabled.deserialize(b))
              .toList(),
      useDefaultFor: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1MsgSetSendEnabled;
  @override
  MsgSetSendEnabledResponse onServiceResponse(List<int> bytes) {
    return MsgSetSendEnabledResponse.deserialize(bytes);
  }

  @override
  MsgSetSendEnabledResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSetSendEnabledResponse.fromJson(json);
  }
}

/// MsgSetSendEnabledResponse defines the Msg/SetSendEnabled response type.
class MsgSetSendEnabledResponse extends CosmosProtoMessage {
  const MsgSetSendEnabledResponse();

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

  factory MsgSetSendEnabledResponse.fromJson(Map<String, dynamic> json) {
    return MsgSetSendEnabledResponse();
  }

  factory MsgSetSendEnabledResponse.deserialize(List<int> bytes) {
    return MsgSetSendEnabledResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1MsgSetSendEnabledResponse;
}
