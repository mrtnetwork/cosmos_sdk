import 'package:blockchain_utils/utils/numbers/utils/bigint_utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/types/types.dart';

/// GasInfo defines tx execution gas context.
class GasInfo extends CosmosMessage {
  /// GasWanted is the maximum units of work we allow this tx to perform.
  final BigInt? gasWanted;

  /// GasUsed is the amount of gas actually consumed.
  final BigInt gasUsed;
  const GasInfo({required this.gasUsed, required this.gasWanted});
  factory GasInfo.fromJson(Map<String, dynamic> json) {
    return GasInfo(
        gasWanted: BigintUtils.tryParse(json["gas_wanted"]),
        gasUsed: BigintUtils.parse(json["gas_used"]));
  }
  factory GasInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GasInfo(gasUsed: decode.getField(2), gasWanted: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"gas_wanted": gasWanted.toString(), "gas_used": gasUsed.toString()};
  }

  @override
  TypeUrl get typeUrl => BaseAbciV1beta1.gasInfo;

  @override
  List get values => [gasWanted, gasUsed];
}
