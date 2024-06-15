import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgUnBond extends CosmosMessage {
  final ThorchainTx txIn;
  final List<int>? nodeAddress;
  final String? bondAddress;
  final BigInt amount;
  final List<int>? signer;
  final List<int>? bondProviderAddress;
  ThorchainMsgUnBond(
      {required this.txIn,
      List<int>? nodeAddress,
      this.bondAddress,
      required this.amount,
      List<int>? signer,
      List<int>? bondProviderAddress})
      : nodeAddress = BytesUtils.tryToBytes(nodeAddress, unmodifiable: true),
        signer = BytesUtils.tryToBytes(signer, unmodifiable: true),
        bondProviderAddress =
            BytesUtils.tryToBytes(bondProviderAddress, unmodifiable: true);
  factory ThorchainMsgUnBond.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgUnBond(
        txIn: ThorchainTx.deserialize(decode.getField(1)),
        nodeAddress: decode.getField(2),
        bondAddress: decode.getField(5),
        amount: BigintUtils.parse(decode.getField<String>(6)),
        signer: decode.getField(7),
        bondProviderAddress: decode.getField(8));
  }

  @override
  List<int> get fieldIds => [1, 2, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx_in": txIn.toJson(),
      "node_address": BytesUtils.tryToHexString(nodeAddress),
      "bond_address": bondAddress,
      "amount": amount.toString(),
      "signer": BytesUtils.tryToHexString(signer),
      "bond_provider_address": BytesUtils.tryToHexString(bondProviderAddress)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgUnBond.typeUrl;

  @override
  List get values => [
        txIn,
        nodeAddress,
        bondAddress,
        amount.toString(),
        signer,
        bondProviderAddress
      ];
}
