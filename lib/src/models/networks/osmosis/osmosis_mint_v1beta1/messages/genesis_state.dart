import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_mint_v1beta1/messages/minter.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_mint_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GenesisState defines the mint module's genesis state.
class OsmosisMintGenesisState extends CosmosMessage {
  /// minter is an abstraction for holding current rewards information.
  final OsmosisMintMinter minter;

  /// params defines all the paramaters of the mint module.
  final OsmosisMintParams params;

  /// reduction_started_epoch is the first epoch in which the reduction of mint
  /// begins.
  final BigInt? reductionStartedEpoch;
  const OsmosisMintGenesisState(
      {required this.minter, required this.params, this.reductionStartedEpoch});
  factory OsmosisMintGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisMintGenesisState(
        minter: OsmosisMintMinter.deserialize(decode.getField(1)),
        params: OsmosisMintParams.deserialize(decode.getField(2)),
        reductionStartedEpoch: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "minter": minter.toJson(),
      "params": params.toJson(),
      "reduction_started_epoch": reductionStartedEpoch?.toString()
    };
  }

  @override
  String get typeUrl => OsmosisMintV1beta1Types.genesisState.typeUrl;

  @override
  List get values => [minter, params, reductionStartedEpoch];
}
