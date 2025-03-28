import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/models/evmos/core/service.dart';

/// MsgUpdateVestingFunder defines a message that updates the funder account of a
/// ClawbackVestingAccount.
class EvmosVestingV2MsgUpdateVestingFunder
    extends EvmosService<EmptyServiceRequestResponse> with AminoMessage {
  /// funder_address is the current funder address of the ClawbackVestingAccount
  final String? funderAddress;

  /// new_funder_address is the new address to replace the existing funder_address
  final String? newFunderAddress;

  /// vesting_address is the address of the ClawbackVestingAccount being updated
  final String? vestingAddress;

  const EvmosVestingV2MsgUpdateVestingFunder(
      {this.funderAddress, this.newFunderAddress, this.vestingAddress});

  factory EvmosVestingV2MsgUpdateVestingFunder.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosVestingV2MsgUpdateVestingFunder(
      funderAddress: decode.getField(1),
      newFunderAddress: decode.getField(2),
      vestingAddress: decode.getField(3),
    );
  }
  factory EvmosVestingV2MsgUpdateVestingFunder.fromJson(
      Map<String, dynamic> json) {
    return EvmosVestingV2MsgUpdateVestingFunder(
      funderAddress: json.as("funder_address"),
      newFunderAddress: json.as("new_funder_address"),
      vestingAddress: json.as("vesting_address"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "funder_address": funderAddress,
      "new_funder_address": newFunderAddress,
      "vesting_address": vestingAddress
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.msgUpdateVestingFunder;

  @override
  List get values => [funderAddress, newFunderAddress, vestingAddress];
  @override
  List<String?> get signers => [funderAddress];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        EvmosErc20V1Types.msgUpdateVestingFunderResponse);
  }
}
