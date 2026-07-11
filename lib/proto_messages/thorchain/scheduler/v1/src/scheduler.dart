import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/scheduler/v1/src/tx.dart"
    as thorchain_scheduler_v1_tx;

class Schedule extends CosmosProtoMessage {
  final BigInt? height;

  final List<thorchain_scheduler_v1_tx.MsgScheduleExecuteContract> msgs;

  const Schedule({this.height, this.msgs = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [height, msgs];

  @override
  Map<String, dynamic> toJson() {
    return {
      'height': height?.toString(),
      'msgs': msgs.map((e) => e.toJson()).toList(),
    };
  }

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      msgs:
          (json.valueEnsureAsList<dynamic>('msgs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  thorchain_scheduler_v1_tx.MsgScheduleExecuteContract,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => thorchain_scheduler_v1_tx
                          .MsgScheduleExecuteContract.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory Schedule.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Schedule(
      height: decode.getBigInt<BigInt?>(1),
      msgs:
          decode
              .getListOfBytes(2)
              .map(
                (b) => thorchain_scheduler_v1_tx
                    .MsgScheduleExecuteContract.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainSchedulerV1Schedule;
}
