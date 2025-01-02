import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/type/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'fee_token.dart';

/// GenesisState defines the txfees module's genesis state.
class OsmosisTxfeesGenesisState extends CosmosMessage {
  final String? basedenom;
  final List<OsmosisTxfeesFeeToken> feetokens;
  OsmosisTxfeesGenesisState({
    this.basedenom,
    required List<OsmosisTxfeesFeeToken> feetokens,
  }) : feetokens = feetokens.immutable;
  factory OsmosisTxfeesGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTxfeesGenesisState(
        basedenom: decode.getField(1),
        feetokens: decode
            .getFields(2)
            .map((e) => OsmosisTxfeesFeeToken.deserialize(e))
            .toList());
  }
  factory OsmosisTxfeesGenesisState.fromRpc(Map<String, dynamic> json) {
    return OsmosisTxfeesGenesisState(
      basedenom: json["basedenom"],
      feetokens: (json["feetokens"] as List?)
              ?.map((e) => OsmosisTxfeesFeeToken.fromRpc(e))
              .toList() ??
          <OsmosisTxfeesFeeToken>[],
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "basedenom": basedenom,
      "feetokens": feetokens.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisTxfeesV1beta1Types.genesisState;

  @override
  List get values => [basedenom, feetokens];
}
