import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainBondProviders extends CosmosMessage {
  final List<int>? nodeAddress;
  final BigInt nodeOperatorFee;
  final List<ThorchainBondProvider> providers;
  ThorchainBondProviders({
    List<int>? nodeAddress,
    required this.nodeOperatorFee,
    required List<ThorchainBondProvider> providers,
  }) : nodeAddress = BytesUtils.tryToBytes(nodeAddress, unmodifiable: true),
       providers = providers.immutable;
  factory ThorchainBondProviders.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainBondProviders(
      nodeAddress: decode.getField(1),
      nodeOperatorFee: BigInt.parse(decode.getField(2)),
      providers:
          decode
              .getFields<List<int>>(3)
              .map((e) => ThorchainBondProvider.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "nodeAddress": BytesUtils.tryToHexString(nodeAddress),
      "nodeOperatorFee": nodeOperatorFee.toString(),
      "providers": providers.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.bondProviders;

  @override
  List get values => [nodeAddress, nodeOperatorFee.toString(), providers];
}
