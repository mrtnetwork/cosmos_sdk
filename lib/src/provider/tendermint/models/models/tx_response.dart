import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/provider/tendermint/models/models/check_tx.dart';
import 'package:cosmos_sdk/src/provider/tendermint/models/models/deliver_tx_response.dart';

class BrodcastTxResponse {
  final CheckTxResponse checkTx;
  final DeliverTxResponse deliverTx;
  final BigInt height;
  final String hash;
  const BrodcastTxResponse(
      {required this.checkTx,
      required this.hash,
      required this.height,
      required this.deliverTx});
  factory BrodcastTxResponse.fromJson(Map<String, dynamic> json) {
    return BrodcastTxResponse(
        checkTx: CheckTxResponse.fromJson(json["check_tx"]),
        hash: json["hash"],
        height: BigintUtils.parse(json["height"]),
        deliverTx: DeliverTxResponse.fromJson(json["deliver_tx"]));
  }
  Map<String, dynamic> toJson() {
    return {
      'check_tx': checkTx.toJson(),
      'deliver_tx': deliverTx.toJson(),
      'height': height.toString(),
      'hash': hash,
    };
  }

  bool get isSuccess =>
      height > BigInt.zero && checkTx.code == 0 && deliverTx.code == 0;

  String? get error {
    if (isSuccess) return null;
    if (checkTx.code == 0) return deliverTx.log;
    return checkTx.log;
  }

  int? get errorCode {
    if (isSuccess) return null;
    if (checkTx.code == 0) return deliverTx.code;
    return checkTx.code;
  }

  @override
  String toString() {
    return "BrodcastTxResponse{${toJson()}}";
  }
}
