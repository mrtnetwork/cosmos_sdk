import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/opinit/ophost_v1/service/msg_initiate_token_deposit.dart';
import 'package:cosmos_sdk/src/models/opinit/ophost_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OpInitService<T extends CosmosMessage>
    extends ServiceMessage<T> {
  const OpInitService();
  static const String root = "/opinit";
  static const String aminoRoot = "ophost";

  static T? fromJson<T extends ServiceMessage>(
      {required String typeUrl,
      required Map<String, dynamic> json,
      bool amino = false}) {
    final type = OpInitOpHostV1Types.findService(typeUrl, amino: amino);
    final ServiceMessage? service = switch (type) {
      OpInitOpHostV1Types.msgInitiateTokenDepositResponse =>
        OpInitOpHostV1MsgInitiateTokenDeposit.fromJson(json),
      _ => null
    } as ServiceMessage?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid OpInit Service.", details: {
        "excepted": "$T",
        "service": service.runtimeType.toString()
      });
    }
    return service;
  }

  static T? deserialize<T extends ServiceMessage>(
      {required String typeUrl, required List<int> bytes}) {
    final type = OpInitOpHostV1Types.findService(typeUrl);
    final ServiceMessage? service = switch (type) {
      OpInitOpHostV1Types.msgInitiateTokenDepositResponse =>
        OpInitOpHostV1MsgInitiateTokenDeposit.deserialize(bytes),
      _ => null
    } as ServiceMessage?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid OpInit Service.", details: {
        "excepted": "$T",
        "service": service.runtimeType.toString()
      });
    }
    return service;
  }
}
