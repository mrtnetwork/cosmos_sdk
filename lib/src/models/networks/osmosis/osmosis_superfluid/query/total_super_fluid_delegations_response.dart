import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisSuperfluidTotalSuperfluidDelegationsResponse
    extends CosmosMessage {
  final String totalDelegations;
  const OsmosisSuperfluidTotalSuperfluidDelegationsResponse(
    this.totalDelegations,
  );
  factory OsmosisSuperfluidTotalSuperfluidDelegationsResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidTotalSuperfluidDelegationsResponse(
      decode.getField(1),
    );
  }
  factory OsmosisSuperfluidTotalSuperfluidDelegationsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisSuperfluidTotalSuperfluidDelegationsResponse(
      json["total_delegations"],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"total_delegations": totalDelegations};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.totalSuperfluidDelegationsResponse;

  @override
  List get values => [totalDelegations];
}
