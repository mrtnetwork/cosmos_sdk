import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'minter.dart'; // Import the Minter class if not already imported
import 'params.dart'; // Import the Params class if not already imported

/// GenesisState defines the mint module's genesis state.
class MintGenesisState extends CosmosMessage {
  /// minter is a space for holding current inflation information.
  final Minter minter;

  /// params defines all the parameters of the module.
  final MintParams params;

  const MintGenesisState({
    required this.minter,
    required this.params,
  });
  factory MintGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MintGenesisState(
        minter: Minter.deserialize(decode.getField(1)),
        params: MintParams.deserialize(decode.getField(2)));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'minter': minter.toJson(),
      'params': params.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get typeUrl => MintV1beta1Types.mintGenesisState;

  @override
  List get values => [minter, params];
}
