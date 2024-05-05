import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/messages/fee_token.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/type/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// GenesisState defines the txfees module's genesis state.
class OsmosisTxfeesQueryFeeTokensResponse extends CosmosMessage {
  final List<OsmosisTxfeesFeeToken> feetokens;
  OsmosisTxfeesQueryFeeTokensResponse({
    required List<OsmosisTxfeesFeeToken> feetokens,
  }) : feetokens = feetokens.mutable;
  factory OsmosisTxfeesQueryFeeTokensResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTxfeesQueryFeeTokensResponse(
        feetokens: decode
            .getFields(1)
            .map((e) => OsmosisTxfeesFeeToken.deserialize(e))
            .toList());
  }
  factory OsmosisTxfeesQueryFeeTokensResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisTxfeesQueryFeeTokensResponse(
      feetokens: (json["fee_tokens"] as List?)
              ?.map((e) => OsmosisTxfeesFeeToken.fromRpc(e))
              .toList() ??
          <OsmosisTxfeesFeeToken>[],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"fee_tokens": feetokens.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl =>
      OsmosisTxfeesV1beta1Types.queryFeeTokensResponse.typeUrl;

  @override
  List get values => [feetokens];
}
