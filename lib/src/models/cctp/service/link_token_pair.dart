import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

class CCTPV1MsgLinkTokenPair extends CCTPV1Service<EmptyServiceRequestResponse>
    with AminoMessage<EmptyServiceRequestResponse> {
  final String? from;
  final int? remoteDomain;
  final List<int>? remoteToken;
  final String? localToken;
  const CCTPV1MsgLinkTokenPair({
    this.from,
    this.remoteDomain,
    this.remoteToken,
    this.localToken,
  });

  factory CCTPV1MsgLinkTokenPair.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgLinkTokenPair(
      from: decode.getField(1),
      remoteDomain: decode.getField(2),
      remoteToken: decode.getField(3),
      localToken: decode.getField(4),
    );
  }
  factory CCTPV1MsgLinkTokenPair.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgLinkTokenPair(
      from: json.as("from"),
      remoteDomain: json.as("remote_domain"),
      remoteToken: json.asBytes("remote_token"),
      localToken: json.as("local_token"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "from": from,
      "remote_domain": remoteDomain,
      "remote_token": CosmosUtils.tryToBase64(remoteToken),
      "local_token": localToken,
    };
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgLinkTokenPair;

  @override
  List get values => [from, remoteDomain, remoteToken, localToken];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(CCTPV1Types.msgLinkTokenPairResponse);
  }
}
