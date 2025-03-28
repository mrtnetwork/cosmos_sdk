import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgPruneAllowances prunes expired fee allowances.
/// Since cosmos-sdk 0.50
class MsgPruneAllowances
    extends FeeGrantV1Beta1Service<EmptyServiceRequestResponse> {
  /// pruner is the address of the user pruning expired allowances
  final CosmosBaseAddress? pruner;
  const MsgPruneAllowances({this.pruner});
  factory MsgPruneAllowances.fromJson(Map<String, dynamic> json) {
    return MsgPruneAllowances(pruner: json.asAddress("pruner"));
  }
  factory MsgPruneAllowances.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);

    return MsgPruneAllowances(
        pruner: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pruner": pruner?.address};
  }

  @override
  TypeUrl get typeUrl => FeegrantV1beta1Types.msgPruneAllowances;

  @override
  List get values => [pruner];
  @override
  List<String?> get signers => [pruner?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        FeegrantV1beta1Types.msgPruneAllowancesResponse);
  }
}
