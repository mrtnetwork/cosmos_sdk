import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/type/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisTxfeesTxFeesTracker extends CosmosMessage {
  final List<Coin> txFees;
  final BigInt? heightAccountingStartsFrom;
  OsmosisTxfeesTxFeesTracker({
    required List<Coin> txFees,
    this.heightAccountingStartsFrom,
  }) : txFees = txFees.immutable;
  factory OsmosisTxfeesTxFeesTracker.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTxfeesTxFeesTracker(
      txFees:
          decode
              .getFields<List<int>>(1)
              .map((e) => Coin.deserialize(e))
              .toList(),
      heightAccountingStartsFrom: decode.getField(2),
    );
  }
  factory OsmosisTxfeesTxFeesTracker.fromJson(Map<String, dynamic> json) {
    return OsmosisTxfeesTxFeesTracker(
      txFees:
          (json["tx_fees"] as List?)?.map((e) => Coin.fromJson(e)).toList() ??
          <Coin>[],
      heightAccountingStartsFrom: BigintUtils.tryParse(
        json["height_accounting_starts_from"],
      ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "height_accounting_starts_from": heightAccountingStartsFrom?.toString(),
      "pootx_feeslID": txFees.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisTxfeesV1beta1Types.txFeesTracker;

  @override
  List get values => [txFees, heightAccountingStartsFrom];
}
