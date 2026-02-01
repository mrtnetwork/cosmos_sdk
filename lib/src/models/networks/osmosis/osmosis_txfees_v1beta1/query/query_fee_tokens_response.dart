import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/messages/fee_token.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/type/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// GenesisState defines the txfees module's genesis state.
class OsmosisTxfeesQueryFeeTokensResponse extends CosmosMessage {
  final List<OsmosisTxfeesFeeToken> feetokens;
  OsmosisTxfeesQueryFeeTokensResponse({
    required List<OsmosisTxfeesFeeToken> feetokens,
  }) : feetokens = feetokens.immutable;
  factory OsmosisTxfeesQueryFeeTokensResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTxfeesQueryFeeTokensResponse(
      feetokens:
          decode
              .getFields<List<int>>(1)
              .map((e) => OsmosisTxfeesFeeToken.deserialize(e))
              .toList(),
    );
  }
  factory OsmosisTxfeesQueryFeeTokensResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisTxfeesQueryFeeTokensResponse(
      feetokens:
          (json["fee_tokens"] as List?)
              ?.map((e) => OsmosisTxfeesFeeToken.fromJson(e))
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
  TypeUrl get typeUrl => OsmosisTxfeesV1beta1Types.queryFeeTokensResponse;

  @override
  List get values => [feetokens];
}
