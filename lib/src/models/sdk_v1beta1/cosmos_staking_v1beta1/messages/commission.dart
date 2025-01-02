import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'commission_rates.dart';

/// Commission defines commission parameters for a given validator.
class Commission extends CosmosMessage {
  /// commission_rates defines the initial commission rates to be used for creating a validator.
  final CommissionRates commissionRates;

  /// update_time is the last time the commission rate was changed.
  final ProtobufTimestamp updateTime;

  factory Commission.fromRpc(Map<String, dynamic> json) {
    return Commission(
        commissionRates: CommissionRates.fromRpc(json["commission_rates"]),
        updateTime: ProtobufTimestamp.fromString(json["update_time"]));
  }
  const Commission({required this.commissionRates, required this.updateTime});
  factory Commission.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Commission(
        commissionRates: CommissionRates.deserialize(decode.getField(1)),
        updateTime: ProtobufTimestamp.deserialize(decode.getField(2)));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'commission_rates': commissionRates.toJson(),
      'update_time': updateTime.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.commission;

  @override
  List get values => [commissionRates, updateTime];
}
