import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_crisis_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgVerifyInvariant represents a message to verify a particular invariance.
class MsgVerifyInvariant extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// sender is the account address of private key to send coins to fee collector account.
  final CosmosBaseAddress? sender;

  /// name of the invariant modul
  final String? invariantModuleName;

  /// invariant_route is the msg's invariant route
  final String? invariantRoute;
  const MsgVerifyInvariant(
      {this.sender, this.invariantModuleName, this.invariantRoute});
  factory MsgVerifyInvariant.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgVerifyInvariant(
        sender: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        invariantModuleName: decode.getField(2),
        invariantRoute: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get service => CrisisV1beta1.verifyInvariant.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender?.address,
      "invariant_module_name": invariantModuleName,
      "invariant_route": invariantRoute
    };
  }

  @override
  String get typeUrl => CrisisV1beta1.msgVerifyInvariant.typeUrl;

  @override
  List get values => [sender?.address, invariantModuleName, invariantRoute];
  @override
  List<String?> get signers => [sender?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        CrisisV1beta1.msgVerifyInvariantResponse.typeUrl);
  }
}
