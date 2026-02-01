import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GenesisState defines the module's genesis state.
class OsmosisSuperfluidLockIdIntermediaryAccountConnection
    extends CosmosMessage {
  final BigInt? lockId;
  final String? intermediaryAccount;

  const OsmosisSuperfluidLockIdIntermediaryAccountConnection({
    this.lockId,
    this.intermediaryAccount,
  });
  factory OsmosisSuperfluidLockIdIntermediaryAccountConnection.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidLockIdIntermediaryAccountConnection(
      lockId: decode.getField(1),
      intermediaryAccount: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "lock_id": lockId?.toString(),
      "intermediary_account": intermediaryAccount,
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.lockIdIntermediaryAccountConnection;

  @override
  List get values => [lockId, intermediaryAccount];
}
