import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// VersionParams contains the ABCI application version.
class TendermintVersionParams extends CosmosMessage {
  final BigInt? app;
  const TendermintVersionParams({this.app});
  factory TendermintVersionParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return TendermintVersionParams(app: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"app": app?.toString()};
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.tendermintVersionParams;

  @override
  List get values => [app];
}
