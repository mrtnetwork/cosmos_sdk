import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/initia/move_v1/service/execute.dart';
import 'package:cosmos_sdk/src/models/initia/move_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class InitiaService<T extends CosmosMessage>
    extends ServiceMessage<T> {
  const InitiaService();
  static const String root = "/initia";
  static T? fromJson<T extends ServiceMessage>({
    required String typeUrl,
    required Map<String, dynamic> json,
    bool amino = false,
  }) {
    final type = InitiaMoveV1Types.findService(typeUrl, amino: amino);
    final ServiceMessage? service =
        switch (type) {
              InitiaMoveV1Types.msgExecute => InitiaMoveV1MsgExecute.fromJson(
                json,
              ),
              _ => null,
            }
            as ServiceMessage?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid Initia Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends ServiceMessage>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = InitiaMoveV1Types.findService(typeUrl);
    final ServiceMessage? service =
        switch (type) {
              InitiaMoveV1Types.msgExecute =>
                InitiaMoveV1MsgExecute.deserialize(bytes),
              _ => null,
            }
            as ServiceMessage?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid Initia Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
