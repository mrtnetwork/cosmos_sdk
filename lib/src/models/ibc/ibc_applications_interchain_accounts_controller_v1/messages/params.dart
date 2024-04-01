import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Params defines the set of on-chain interchain accounts parameters.
/// The following parameters may be used to disable the controller submodule.
class InterchainAccountsControllerParams extends CosmosMessage {
  /// controller_enabled enables or disables the controller submodule.
  final bool? controllerEnabled;
  const InterchainAccountsControllerParams({this.controllerEnabled});
  factory InterchainAccountsControllerParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InterchainAccountsControllerParams(
        controllerEnabled: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"controller_enabled": controllerEnabled};
  }

  @override
  String get typeUrl => IbcTypes.interchainAccountsControllerParams.typeUrl;

  @override
  List get values => [controllerEnabled];
}
