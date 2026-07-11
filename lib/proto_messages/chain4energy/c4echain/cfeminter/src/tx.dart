import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfeminter/src/minter.dart"
    as chain4energy_c4echain_cfeminter_minter;

class MsgBurn extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgBurnResponse> {
  final String? address;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgBurn({this.address, this.amount = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'amount': amount.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgBurn.fromJson(Map<String, dynamic> json) {
    return MsgBurn(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
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

  factory MsgBurn.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBurn(
      address: decode.getString<String?>(1),
      amount:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeminterMsgBurn;
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
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeminterMsgBurnResponse;
}

class MsgUpdateParams extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateParamsResponse> {
  final String? authority;

  final String? mintDenom;

  final google_protobuf_timestamp.Timestamp? startTime;

  final List<chain4energy_c4echain_cfeminter_minter.Minter> minters;

  const MsgUpdateParams({
    this.authority,
    this.mintDenom,
    this.startTime,
    this.minters = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, mintDenom, startTime, minters];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'mint_denom': mintDenom,
      'start_time': startTime?.toRfc3339(),
      'minters': minters.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
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

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      mintDenom: decode.getString<String?>(2),
      startTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        3,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      minters:
          decode
              .getListOfBytes(4)
              .map(
                (b) => chain4energy_c4echain_cfeminter_minter
                    .Minter.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeminterMsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

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
          .chain4energyC4echainCfeminterMsgUpdateParamsResponse;
}

class MsgUpdateMintersParams extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateMintersParamsResponse> {
  final String? authority;

  final google_protobuf_timestamp.Timestamp? startTime;

  final List<chain4energy_c4echain_cfeminter_minter.Minter> minters;

  const MsgUpdateMintersParams({
    this.authority,
    this.startTime,
    this.minters = const [],
  });

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
  List<Object?> get protoValues => [authority, startTime, minters];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'start_time': startTime?.toRfc3339(),
      'minters': minters.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgUpdateMintersParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateMintersParams(
      authority: json.valueAsString<String?>(
        'authority',
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

  factory MsgUpdateMintersParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateMintersParams(
      authority: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeminterMsgUpdateMintersParams;
  @override
  MsgUpdateMintersParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateMintersParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateMintersParamsResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateMintersParamsResponse.fromJson(json);
  }
}

class MsgUpdateMintersParamsResponse extends CosmosProtoMessage {
  const MsgUpdateMintersParamsResponse();

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

  factory MsgUpdateMintersParamsResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateMintersParamsResponse();
  }

  factory MsgUpdateMintersParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateMintersParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfeminterMsgUpdateMintersParamsResponse;
}
