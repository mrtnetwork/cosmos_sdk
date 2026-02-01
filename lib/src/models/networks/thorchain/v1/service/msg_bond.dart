import 'package:cosmos_sdk/src/address/address/address.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/core/service.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

class ThorchainMsgBond extends ThorchainV1Service<EmptyServiceRequestResponse> {
  final ThorchainTx txIn;
  final CosmosBaseAddress? nodeAddress;
  final String bond;
  final String? bondAddress;
  final CosmosBaseAddress? signer;
  final CosmosBaseAddress? bondProviderAddress;
  final BigInt? operatorFee;
  ThorchainMsgBond({
    required this.txIn,
    required this.bond,
    this.bondAddress,
    this.operatorFee,
    this.signer,
    this.bondProviderAddress,
    this.nodeAddress,
  });
  factory ThorchainMsgBond.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgBond(
      txIn: ThorchainTx.deserialize(decode.getField(1)),
      nodeAddress: decode
          .getResult(2)
          ?.to<CosmosBaseAddress, List<int>>(
            (e) => CosmosBaseAddress.fromBytes(e),
          ),
      bond: decode.getField(3),
      bondAddress: decode.getField(4),
      signer: decode
          .getResult(5)
          ?.to<CosmosBaseAddress, List<int>>(
            (e) => CosmosBaseAddress.fromBytes(e),
          ),
      bondProviderAddress: decode
          .getResult(6)
          ?.to<CosmosBaseAddress, List<int>>(
            (e) => CosmosBaseAddress.fromBytes(e),
          ),
      operatorFee: decode.getField(7),
    );
  }
  factory ThorchainMsgBond.fromJson(Map<String, dynamic> json) {
    return ThorchainMsgBond(
      txIn: ThorchainTx.fromJson(json.asMap("tx_in")),
      nodeAddress: json.maybeAs<CosmosBaseAddress, String>(
        key: "node_address",
        onValue: (e) {
          return CosmosBaseAddress.fromBytes(CosmosUtils.toBytes(e));
        },
      ),
      bond: json.as("bond"),
      bondAddress: json.as("bond_address"),
      signer: json.maybeAs<CosmosBaseAddress, String>(
        key: "signer",
        onValue: (e) {
          return CosmosBaseAddress.fromBytes(CosmosUtils.toBytes(e));
        },
      ),
      bondProviderAddress: json.maybeAs<CosmosBaseAddress, String>(
        key: "bond_provider_address",
        onValue: (e) {
          return CosmosBaseAddress.fromBytes(CosmosUtils.toBytes(e));
        },
      ),
      operatorFee: json.asBigInt("operator_fee"),
    );
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
      "operator_fee": operatorFee?.toString(),
    };
  }

  @override
  ThorchainV1Types get typeUrl => ThorchainV1Types.msgBond;

  @override
  List get values => [
    txIn,
    nodeAddress?.toBytes(),
    bond,
    bondAddress,
    signer?.toBytes(),
    bondProviderAddress?.toBytes(),
    operatorFee,
  ];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(typeUrl);
  }

  @override
  List<String?> get signers => [signer?.address];
}
