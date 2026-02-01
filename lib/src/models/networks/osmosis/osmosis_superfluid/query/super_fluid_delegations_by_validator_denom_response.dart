import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/messages/super_fluid_delegation_record.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomResponse
    extends CosmosMessage {
  final List<OsmosisSuperfluidSuperfluidDelegationRecord>
  superfluidDelegationRecords;

  OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomResponse({
    required List<OsmosisSuperfluidSuperfluidDelegationRecord>
    superfluidDelegationRecords,
  }) : superfluidDelegationRecords = superfluidDelegationRecords.immutable;
  factory OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomResponse(
      superfluidDelegationRecords:
          decode
              .getFields<List<int>>(1)
              .map(
                (e) =>
                    OsmosisSuperfluidSuperfluidDelegationRecord.deserialize(e),
              )
              .toList(),
    );
  }
  factory OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisSuperfluidSuperfluidDelegationsByValidatorDenomResponse(
      superfluidDelegationRecords:
          (json["superfluid_delegation_records"] as List?)
              ?.map(
                (e) => OsmosisSuperfluidSuperfluidDelegationRecord.fromJson(e),
              )
              .toList() ??
          <OsmosisSuperfluidSuperfluidDelegationRecord>[],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "superfluid_delegation_records":
          superfluidDelegationRecords.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.superfluidDelegationsByValidatorDenomResponse;

  @override
  List get values => [superfluidDelegationRecords];
}
