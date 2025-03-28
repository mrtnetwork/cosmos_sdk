import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'taker_fee_params.dart';

/// Params holds parameters for the poolmanager module.
class OsmosisPoolManagerParams extends CosmosMessage {
  final List<Coin> poolCreationFee;

  /// [takerFeeParams] is the container of taker fee parameters.
  final OsmosisPoolManagerTakerFeeParams takerFeeParams;

  /// authorized_quote_denoms is a list of quote denoms that can be used as
  /// token1 when creating a concentrated pool. We limit the quote assets to a
  /// small set for the purposes of having convinient price increments stemming
  /// from tick to price conversion. These increments are in a human readable
  /// magnitude only for token1 as a quote. For limit orders in the future, this
  /// will be a desirable property in terms of UX as to allow users to set limit
  /// orders at prices in terms of token1 (quote asset) that are easy to reason
  /// about.
  final List<String>? authorizedQuoteDenoms;

  OsmosisPoolManagerParams({
    required List<Coin> poolCreationFee,
    required this.takerFeeParams,
    List<String>? authorizedQuoteDenoms,
  })  : poolCreationFee = poolCreationFee.immutable,
        authorizedQuoteDenoms = authorizedQuoteDenoms?.emptyAsNull?.immutable;
  factory OsmosisPoolManagerParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerParams(
        poolCreationFee: decode
            .getFields<List<int>>(1)
            .map((e) => Coin.deserialize(e))
            .toList(),
        takerFeeParams:
            OsmosisPoolManagerTakerFeeParams.deserialize(decode.getField(2)),
        authorizedQuoteDenoms: decode.getFields<String>(3));
  }
  factory OsmosisPoolManagerParams.fromJson(Map<String, dynamic> json) {
    return OsmosisPoolManagerParams(
        poolCreationFee: (json["pool_creation_fee"] as List?)
                ?.map((e) => Coin.fromJson(e))
                .toList() ??
            <Coin>[],
        takerFeeParams:
            OsmosisPoolManagerTakerFeeParams.fromJson(json["taker_fee_params"]),
        authorizedQuoteDenoms: json["authorized_quote_denoms"]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_creation_fee": poolCreationFee.map((e) => e.toJson()).toList(),
      "taker_fee_params": takerFeeParams.toJson(),
      "authorized_quote_denoms": authorizedQuoteDenoms
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.params;

  @override
  List get values => [poolCreationFee, takerFeeParams, authorizedQuoteDenoms];
}
