import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/messages/params.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisSuperfluidQueryParamsResponse extends CosmosMessage {
  final OsmosisSuperfluidParams params;
  const OsmosisSuperfluidQueryParamsResponse(this.params);
  factory OsmosisSuperfluidQueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidQueryParamsResponse(
      OsmosisSuperfluidParams.deserialize(decode.getField(1)),
    );
  }
  factory OsmosisSuperfluidQueryParamsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisSuperfluidQueryParamsResponse(
      OsmosisSuperfluidParams.deserialize(json["params"]),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.queryParamsResponse;

  @override
  List get values => [params];
}
