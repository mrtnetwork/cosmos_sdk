import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainTradeAccount extends CosmosMessage {
  final ThorchainAsset asset;
  final BigInt units;
  final List<int>? owner;
  final BigInt? lastAddHeight;
  final BigInt? lastWithdrawHeight;
  ThorchainTradeAccount(
      {required this.asset,
      required this.units,
      List<int>? owner,
      this.lastAddHeight,
      this.lastWithdrawHeight})
      : owner = BytesUtils.tryToBytes(owner, unmodifiable: true);
  factory ThorchainTradeAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainTradeAccount(
        asset: ThorchainAsset.deserialize(decode.getField(1)),
        units: BigInt.parse(decode.getField(2)),
        owner: decode.getField(3),
        lastAddHeight: decode.getField(4),
        lastWithdrawHeight: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "asset": asset.toJson(),
      "units": units.toString(),
      "owner": BytesUtils.tryToHexString(owner),
      "last_add_height": lastAddHeight?.toString(),
      "last_withdraw_height": lastWithdrawHeight?.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.tradeAccount.typeUrl;

  @override
  List get values =>
      [asset, units.toString(), owner, lastAddHeight, lastWithdrawHeight];
}
