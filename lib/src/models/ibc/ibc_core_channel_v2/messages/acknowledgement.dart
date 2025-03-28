import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// Acknowledgement contains a list of all ack results associated with a single packet.
/// In the case of a successful receive, the acknowledgement will contain an app acknowledgement
/// for each application that received a payload in the same order that the payloads were sent
/// in the packet.
/// If the receive is not successful, the acknowledgement will contain a single app acknowledgment
/// which will be a constant error acknowledgment as defined by the IBC v2 protocol.
class IbcChannelV2Acknowledgement extends CosmosMessage {
  final List<int>? appAcknowledgements;

  IbcChannelV2Acknowledgement({List<int>? appAcknowledgements})
      : appAcknowledgements = appAcknowledgements?.asImmutableBytes;
  factory IbcChannelV2Acknowledgement.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2Acknowledgement(appAcknowledgements: decode.getField(1));
  }
  factory IbcChannelV2Acknowledgement.fromJson(Map<String, dynamic> json) {
    return IbcChannelV2Acknowledgement(
        appAcknowledgements: json.asBytes("app_acknowledgements"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "app_acknowledgements": CosmosUtils.tryToBase64(appAcknowledgements)
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2Acknowledgement;

  @override
  List get values => [appAcknowledgements];
}
