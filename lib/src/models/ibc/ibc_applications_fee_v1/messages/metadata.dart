import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Metadata defines the ICS29 channel specific metadata encoded into the channel version
/// bytestring See ICS004: https://github.com/cosmos/ibc/tree/master/spec/core/ics-004-channel-and-packet-semantics#Versioning
class IbcFeeMetadata extends CosmosMessage {
  /// fee_version defines the ICS29 fee version
  final String? feeVersion;

  /// app_version defines the underlying application version, which may or may not be a JSON encoded bytestring
  final String? appVersion;
  const IbcFeeMetadata({this.feeVersion, this.appVersion});
  factory IbcFeeMetadata.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcFeeMetadata(
      feeVersion: decode.getField(1),
      appVersion: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"fee_version": feeVersion, "app_version": appVersion};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.metadata;

  @override
  List get values => [feeVersion, appVersion];
}
