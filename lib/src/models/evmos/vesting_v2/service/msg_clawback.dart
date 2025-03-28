import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'msg_clawback_response.dart';
import 'package:cosmos_sdk/src/models/evmos/core/service.dart';

/// MsgClawback defines a message that removes unvested tokens from a
/// ClawbackVestingAccount.
class EvmosVestingV2MsgClawback
    extends EvmosService<EvmosVestingV2MsgClawbackResponse> with AminoMessage {
  /// funder_address is the address which funded the account
  final String? funderAddress;

  /// accountAddress is the address of the ClawbackVestingAccount to claw back
  /// from.
  final String? accountAddress;

  /// dest_address specifies where the clawed-back tokens should be transferred
  /// to. If empty, the tokens will be transferred back to the original funder of
  /// the account.
  final String? destAddress;

  const EvmosVestingV2MsgClawback(
      {this.funderAddress, this.accountAddress, this.destAddress});

  factory EvmosVestingV2MsgClawback.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosVestingV2MsgClawback(
      funderAddress: decode.getField(1),
      accountAddress: decode.getField(2),
      destAddress: decode.getField(3),
    );
  }
  factory EvmosVestingV2MsgClawback.fromJson(Map<String, dynamic> json) {
    return EvmosVestingV2MsgClawback(
      funderAddress: json.as("funder_address"),
      accountAddress: json.as("account_address"),
      destAddress: json.as("dest_address"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "funder_address": funderAddress,
      "account_address": accountAddress,
      "dest_address": destAddress
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.msgClawback;

  @override
  List get values => [funderAddress, accountAddress, destAddress];
  @override
  List<String?> get signers => [funderAddress];

  @override
  EvmosVestingV2MsgClawbackResponse onResponse(List<int> bytes) {
    return EvmosVestingV2MsgClawbackResponse.deserialize(bytes);
  }
}
