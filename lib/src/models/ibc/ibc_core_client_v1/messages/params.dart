import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// Params defines the set of IBC light client parameters.
class IbcClientParams extends CosmosMessage {
  /// allowed_clients defines the list of allowed client state types which can be created
  /// and interacted with. If a client type is removed from the allowed clients list, usage
  /// of this client will be disabled until it is added again to the list.
  final List<String>? allowedClients;
  IbcClientParams({List<String>? allowedClients})
      : allowedClients = allowedClients?.nullOnEmpy;
  factory IbcClientParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientParams(allowedClients: decode.getFileds<String>(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"allowed_clients": allowedClients};
  }

  @override
  String get typeUrl => IbcTypes.ibcClientParams.typeUrl;

  @override
  List get values => [allowedClients];
}
