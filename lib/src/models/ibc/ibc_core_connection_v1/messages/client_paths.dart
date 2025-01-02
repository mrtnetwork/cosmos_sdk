import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// ClientPaths define all the connection paths for a client state.
class IbcConnectionClientPaths extends CosmosMessage {
  /// list of connection paths
  final List<String>? paths;
  IbcConnectionClientPaths({List<String>? paths}) : paths = paths?.immutable;
  factory IbcConnectionClientPaths.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionClientPaths(paths: decode.getFields<String>(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"paths": paths};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcConnectionClientPaths;

  @override
  List get values => [paths];
}
