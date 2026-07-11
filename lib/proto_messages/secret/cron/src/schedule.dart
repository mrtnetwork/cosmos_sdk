import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Defines the schedule for execution
class Schedule extends CosmosProtoMessage {
  /// Name of schedule
  final String? name;

  /// Period in blocks
  final BigInt? period;

  /// Msgs that will be executed every certain number of blocks, specified in the `period` field
  final List<MsgExecuteContract> msgs;

  /// Last execution's block height
  final BigInt? lastExecuteHeight;

  const Schedule({
    this.name,
    this.period,
    this.msgs = const [],
    this.lastExecuteHeight,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.uint64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [name, period, msgs, lastExecuteHeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'period': period?.toString(),
      'msgs': msgs.map((e) => e.toJson()).toList(),
      'last_execute_height': lastExecuteHeight?.toString(),
    };
  }

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      period: json.valueAsBigInt<BigInt?>('period', acceptCamelCase: true),
      msgs:
          (json.valueEnsureAsList<dynamic>('msgs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  MsgExecuteContract,
                  Map<String, dynamic>
                >(value: e, parse: (v) => MsgExecuteContract.fromJson(v)),
              )
              .toList(),
      lastExecuteHeight: json.valueAsBigInt<BigInt?>(
        'last_execute_height',
        acceptCamelCase: true,
      ),
    );
  }

  factory Schedule.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Schedule(
      name: decode.getString<String?>(1),
      period: decode.getBigInt<BigInt?>(2),
      msgs:
          decode
              .getListOfBytes(3)
              .map((b) => MsgExecuteContract.deserialize(b))
              .toList(),
      lastExecuteHeight: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretCronSchedule;
}

/// Defines the contract and the message to pass
class MsgExecuteContract extends CosmosProtoMessage {
  /// The address of the smart contract
  final String? contract;

  /// JSON encoded message to be passed to the contract
  final String? msg;

  const MsgExecuteContract({this.contract, this.msg});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [contract, msg];

  @override
  Map<String, dynamic> toJson() {
    return {'contract': contract, 'msg': msg};
  }

  factory MsgExecuteContract.fromJson(Map<String, dynamic> json) {
    return MsgExecuteContract(
      contract: json.valueAsString<String?>('contract', acceptCamelCase: true),
      msg: json.valueAsString<String?>('msg', acceptCamelCase: true),
    );
  }

  factory MsgExecuteContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExecuteContract(
      contract: decode.getString<String?>(1),
      msg: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretCronMsgExecuteContract;
}
