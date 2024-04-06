import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgBond extends CosmosMessage {
  final ThorchainTx txIn;
  final List<int>? nodeAddress;
  final String bond;
  final String? bondAddress;
  final List<int>? signer;
  final List<int>? bondProviderAddress;
  final BigInt? operatorFee;
  ThorchainMsgBond(
      {required this.txIn,
      List<int>? nodeAddress,
      required this.bond,
      this.bondAddress,
      List<int>? signer,
      List<int>? bondProviderAddress,
      this.operatorFee})
      : nodeAddress = BytesUtils.tryToBytes(nodeAddress, unmodifiable: true),
        signer = BytesUtils.tryToBytes(signer, unmodifiable: true),
        bondProviderAddress =
            BytesUtils.tryToBytes(bondProviderAddress, unmodifiable: true);
  factory ThorchainMsgBond.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgBond(
        txIn: ThorchainTx.deserialize(decode.getField(1)),
        nodeAddress: decode.getField(2),
        bond: decode.getField(3),
        bondAddress: decode.getField(4),
        signer: decode.getField(5),
        bondProviderAddress: decode.getField(6),
        operatorFee: decode.getField(7));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx_in": txIn.toJson(),
      "node_address": BytesUtils.tryToHexString(nodeAddress),
      "bond": bond,
      "bond_address": bondAddress,
      "signer": BytesUtils.tryToHexString(signer),
      "bond_provider_address": BytesUtils.tryToHexString(bondProviderAddress),
      "operator_fee": operatorFee?.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgBond.typeUrl;

  @override
  List get values => [
        txIn,
        nodeAddress,
        bond,
        bondAddress,
        signer,
        bondProviderAddress,
        operatorFee
      ];
}
