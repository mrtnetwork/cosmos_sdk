import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// MsgScheduleExecuteContract is the sdk.Msg type for allowing a scheduled
/// execution of a contract
class MsgScheduleExecuteContract extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgScheduleExecuteContractResponse> {
  final String? sender;

  final BigInt? after;

  final BuBytes? msg;

  MsgScheduleExecuteContract({this.sender, this.after, List<int>? msg})
    : msg = msg?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
        ProtoFieldConfig.bytes(
          3,
          options: [
            ProtoOptionString(name: "amino.encoding", value: "inline_json"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, after, msg];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'sender': sender,
      'after': config.encodeBigint(after),
      'msg': config.encodeBinary(msg),
    };
  }

  factory MsgScheduleExecuteContract.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgScheduleExecuteContract(
      sender: json.valueAsString<String?>(
        'sender',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      after: json.valueAsBigInt<BigInt?>(
        'after',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      msg: config.decodeBinary<List<int>?>(
        json.valueAs('msg', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgScheduleExecuteContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgScheduleExecuteContract(
      sender: decode.getString<String?>(1),
      after: decode.getBigInt<BigInt?>(2),
      msg: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainSchedulerV1MsgScheduleExecuteContract;
  @override
  MsgScheduleExecuteContractResponse onServiceResponse(List<int> bytes) {
    return MsgScheduleExecuteContractResponse.deserialize(bytes);
  }

  @override
  MsgScheduleExecuteContractResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgScheduleExecuteContractResponse.fromJson(json);
  }
}

/// MsgScheduleExecuteContractResponse is the return value of
/// MsgScheduleExecuteContract
class MsgScheduleExecuteContractResponse extends CosmosProtoMessage {
  const MsgScheduleExecuteContractResponse();

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

  factory MsgScheduleExecuteContractResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgScheduleExecuteContractResponse();
  }

  factory MsgScheduleExecuteContractResponse.deserialize(List<int> bytes) {
    return MsgScheduleExecuteContractResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .thorchainSchedulerV1MsgScheduleExecuteContractResponse;
}
