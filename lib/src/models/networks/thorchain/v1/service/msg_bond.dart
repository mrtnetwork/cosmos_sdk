import 'package:cosmos_sdk/src/address/address/address.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgBond extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final ThorchainTx txIn;
  final CosmosBaseAddress? nodeAddress;
  final String bond;
  final String? bondAddress;
  final CosmosBaseAddress? signer;
  final CosmosBaseAddress? bondProviderAddress;
  final BigInt? operatorFee;
  ThorchainMsgBond(
      {required this.txIn,
      required this.bond,
      this.bondAddress,
      this.operatorFee,
      this.signer,
      this.bondProviderAddress,
      this.nodeAddress});
  factory ThorchainMsgBond.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgBond(
        txIn: ThorchainTx.deserialize(decode.getField(1)),
        nodeAddress: decode.getResult(2)?.to<CosmosBaseAddress, List<int>>(
            (e) => CosmosBaseAddress.fromBytes(e)),
        bond: decode.getField(3),
        bondAddress: decode.getField(4),
        signer: decode.getResult(5)?.to<CosmosBaseAddress, List<int>>(
            (e) => CosmosBaseAddress.fromBytes(e)),
        bondProviderAddress: decode
            .getResult(6)
            ?.to<CosmosBaseAddress, List<int>>(
                (e) => CosmosBaseAddress.fromBytes(e)),
        operatorFee: decode.getField(7));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx_in": txIn.toJson(),
      "node_address": nodeAddress?.address,
      "bond": bond,
      "bond_address": bondAddress,
      "signer": signer?.address,
      "bond_provider_address": bondProviderAddress?.address,
      "operator_fee": operatorFee?.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgBond.typeUrl;

  @override
  List get values => [
        txIn,
        nodeAddress?.toBytes(),
        bond,
        bondAddress,
        signer?.toBytes(),
        bondProviderAddress?.toBytes(),
        operatorFee
      ];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(typeUrl);
  }

  @override
  String get service => typeUrl;

  @override
  List<String?> get signers => [signer?.address];
}
