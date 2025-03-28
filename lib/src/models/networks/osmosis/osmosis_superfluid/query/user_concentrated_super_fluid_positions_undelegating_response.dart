import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/messages/concentrated_pool_user_position_record.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingResponse
    extends CosmosMessage {
  final List<OsmosisSuperfluidConcentratedPoolUserPositionRecord>
      clPoolUserPositionRecords;
  OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingResponse(
      List<OsmosisSuperfluidConcentratedPoolUserPositionRecord>
          clPoolUserPositionRecords)
      : clPoolUserPositionRecords = clPoolUserPositionRecords.immutable;
  factory OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingResponse(
        decode
            .getFields<List<int>>(1)
            .map((e) =>
                OsmosisSuperfluidConcentratedPoolUserPositionRecord.deserialize(
                    e))
            .toList());
  }
  factory OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingResponse(
        (json["cl_pool_user_position_records"] as List?)
                ?.map((e) => OsmosisSuperfluidConcentratedPoolUserPositionRecord
                    .fromJson(e))
                .toList() ??
            <OsmosisSuperfluidConcentratedPoolUserPositionRecord>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "cl_pool_user_position_records":
          clPoolUserPositionRecords.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes
      .userConcentratedSuperfluidPositionsUndelegatingResponse;

  @override
  List get values => [clPoolUserPositionRecords];
}
