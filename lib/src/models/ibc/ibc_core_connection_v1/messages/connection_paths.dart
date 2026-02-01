import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// ConnectionPaths define all the connection paths for a given client state.
class IbcConnectConnectionPaths extends CosmosMessage {
  /// client state unique identifier
  final String? clientId;

  /// list of connection paths
  final List<String>? paths;
  IbcConnectConnectionPaths({this.clientId, List<String>? paths})
    : paths = paths?.emptyAsNull?.immutable;
  factory IbcConnectConnectionPaths.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectConnectionPaths(
      clientId: decode.getField(1),
      paths: decode.getFields<String>(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"client_id": clientId, "paths": paths};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcConnectionConnectionPaths;

  @override
  List get values => [clientId, paths];
}
