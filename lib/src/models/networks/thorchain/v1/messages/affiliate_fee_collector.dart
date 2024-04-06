import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainAffiliateFeeCollector extends CosmosMessage {
  final List<int>? ownerAddress;
  final BigInt runeAmount;
  ThorchainAffiliateFeeCollector(
      {List<int>? ownerAddress, required this.runeAmount})
      : ownerAddress = BytesUtils.tryToBytes(ownerAddress, unmodifiable: true);

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "rune_amount": runeAmount.toString(),
      "owner_address": BytesUtils.tryToHexString(ownerAddress)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.afiliateFeeCollector.typeUrl;

  @override
  List get values => [ownerAddress, runeAmount.toString()];
}
