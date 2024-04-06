import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainBondProvider extends CosmosMessage {
  final List<int>? bondAddress;
  final BigInt bond;
  ThorchainBondProvider({List<int>? bondAddress, required this.bond})
      : bondAddress = BytesUtils.tryToBytes(bondAddress, unmodifiable: true);
  factory ThorchainBondProvider.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainBondProvider(
      bondAddress: decode.getField(1),
      bond: BigInt.parse(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "bond_address": BytesUtils.tryToHexString(bondAddress),
      "bond": bond.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.bondProvider.typeUrl;

  @override
  List get values => [bondAddress, bond.toString()];
}
