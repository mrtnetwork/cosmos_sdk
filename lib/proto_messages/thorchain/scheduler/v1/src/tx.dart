import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// MsgScheduleExecuteContract is the sdk.Msg type for allowing a scheduled
/// execution of a contract
class MsgScheduleExecuteContract extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgScheduleExecuteContractResponse> {
  final String? sender;

  final BigInt? after;

  final List<int>? msg;

  const MsgScheduleExecuteContract({this.sender, this.after, this.msg});

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
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'after': after?.toString(),
      'msg': switch (msg) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgScheduleExecuteContract.fromJson(Map<String, dynamic> json) {
    return MsgScheduleExecuteContract(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      after: json.valueAsBigInt<BigInt?>('after', acceptCamelCase: true),
      msg: json.valueAsBytes<List<int>?>(
        'msg',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgScheduleExecuteContractResponse.fromJson(
    Map<String, dynamic> json,
  ) {
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
