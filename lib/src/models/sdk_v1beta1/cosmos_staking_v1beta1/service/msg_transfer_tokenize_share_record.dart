import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgTransferTokenizeShareRecord transfer a tokenize share record.
///
/// Since: cosmos-sdk 0.47-lsm
class MsgTransferTokenizeShareRecord
    extends StakingV1Beta1Service<EmptyServiceRequestResponse> {
  final BigInt? tokenizeShareRecordId;
  final String? sender;
  final String? newOwner;

  const MsgTransferTokenizeShareRecord({
    required this.tokenizeShareRecordId,
    required this.sender,
    required this.newOwner,
  });
  factory MsgTransferTokenizeShareRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgTransferTokenizeShareRecord(
      tokenizeShareRecordId: decode.getField(1),
      sender: decode.getField(2),
      newOwner: decode.getField(3),
    );
  }
  factory MsgTransferTokenizeShareRecord.fromJson(Map<String, dynamic> json) {
    return MsgTransferTokenizeShareRecord(
      tokenizeShareRecordId: json.asBigInt("tokenize_share_record_id"),
      sender: json.as("sender"),
      newOwner: json.as("new_owner"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tokenize_share_record_id": tokenizeShareRecordId?.toString(),
      "sender": sender,
      "new_owner": newOwner,
    };
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.msgTransferTokenizeShareRecord;

  @override
  List get values => [tokenizeShareRecordId, sender, newOwner];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      StakingV1beta1Types.msgTransferTokenizeShareRecordResponse,
    );
  }

  @override
  List<String?> get signers => [sender];
}
