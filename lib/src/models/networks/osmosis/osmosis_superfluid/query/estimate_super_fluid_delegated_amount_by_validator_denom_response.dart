import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomResponse
    extends CosmosMessage {
  final List<Coin> totalDelegatedCoins;
  OsmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomResponse(
    List<Coin> totalDelegatedCoins,
  ) : totalDelegatedCoins = totalDelegatedCoins.immutable;
  factory OsmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomResponse(
      decode.getFields<List<int>>(1).map((e) => Coin.deserialize(e)).toList(),
    );
  }
  factory OsmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomResponse(
      (json["total_delegated_coins"] as List?)
              ?.map((e) => Coin.fromJson(e))
              .toList() ??
          <Coin>[],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "total_delegated_coins":
          totalDelegatedCoins.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes
          .estimateSuperfluidDelegatedAmountByValidatorDenomResponse;

  @override
  List get values => [totalDelegatedCoins];
}
