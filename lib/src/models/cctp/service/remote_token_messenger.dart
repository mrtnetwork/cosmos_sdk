import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

class CCTPV1MsgAddRemoteTokenMessenger
    extends CCTPV1Service<EmptyServiceRequestResponse>
    with AminoMessage {
  final String? from;
  final int? domainId;
  final List<int>? address;
  const CCTPV1MsgAddRemoteTokenMessenger({
    required this.from,
    required this.domainId,
    required this.address,
  });

  factory CCTPV1MsgAddRemoteTokenMessenger.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgAddRemoteTokenMessenger(
      address: decode.getField(3),
      domainId: decode.getField(2),
      from: decode.getField(1),
    );
  }
  factory CCTPV1MsgAddRemoteTokenMessenger.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgAddRemoteTokenMessenger(
      from: json.as("from"),
      address: json.asBytes("address"),
      domainId: json.as("domain_id"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "from": from,
      "address": CosmosUtils.tryToBase64(address),
      "domain_id": domainId,
    };
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgAddRemoteTokenMessenger;

  @override
  List get values => [from, domainId, address];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      CCTPV1Types.msgAddRemoteTokenMessengerResponse,
    );
  }
}
