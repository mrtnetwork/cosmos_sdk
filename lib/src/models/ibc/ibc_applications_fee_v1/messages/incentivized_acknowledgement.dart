import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// IncentivizedAcknowledgement is the acknowledgement format to be used by applications wrapped in the fee middleware
class IncentivizedAcknowledgement extends CosmosMessage {
  /// the underlying app acknowledgement bytes
  final List<int>? appAcknowledgement;

  /// the relayer address which submits the recv packet message
  final String? forwardRelayerAddress;

  /// success flag of the base application callback
  final bool? underlyingAppSuccess;
  IncentivizedAcknowledgement(
      {List<int>? appAcknowledgement,
      this.forwardRelayerAddress,
      this.underlyingAppSuccess})
      : appAcknowledgement =
            BytesUtils.tryToBytes(appAcknowledgement, unmodifiable: true);
  factory IncentivizedAcknowledgement.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IncentivizedAcknowledgement(
        appAcknowledgement: decode.getField(1),
        forwardRelayerAddress: decode.getField(2),
        underlyingAppSuccess: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "app_acknowledgement": BytesUtils.tryToHexString(appAcknowledgement),
      "forward_relayer_address": forwardRelayerAddress,
      "underlying_app_success": underlyingAppSuccess
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.incentivizedAcknowledgement;

  @override
  List get values =>
      [appAcknowledgement, forwardRelayerAddress, underlyingAppSuccess];
}
