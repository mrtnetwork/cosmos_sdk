import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Minter represents the minting state.
class OsmosisMintMinter extends CosmosMessage {
  /// [epochProvisions] represent rewards for the current epoch.
  final String? epochProvisions;
  const OsmosisMintMinter({this.epochProvisions});
  factory OsmosisMintMinter.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisMintMinter(epochProvisions: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"epoch_provisions": epochProvisions};
  }

  @override
  TypeUrl get typeUrl => OsmosisMintV1beta1Types.minter;

  @override
  List get values => [epochProvisions];
}
