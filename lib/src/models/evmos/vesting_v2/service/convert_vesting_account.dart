import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/evmos/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgConvertVestingAccount defines a message that enables converting a vesting account to an eth account
class EvmosVestingV2MsgConvertVestingAccount
    extends EvmosService<EmptyServiceRequestResponse> with AminoMessage {
  /// vestingAddress is the address of the vesting account to convert
  final String? vestingAddress;

  const EvmosVestingV2MsgConvertVestingAccount({this.vestingAddress});

  factory EvmosVestingV2MsgConvertVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosVestingV2MsgConvertVestingAccount(
      vestingAddress: decode.getField(1),
    );
  }
  factory EvmosVestingV2MsgConvertVestingAccount.fromJson(
      Map<String, dynamic> json) {
    return EvmosVestingV2MsgConvertVestingAccount(
        vestingAddress: json.as("vesting_address"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"vesting_address": vestingAddress};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.msgConvertVestingAccount;

  @override
  List get values => [vestingAddress];
  @override
  List<String?> get signers => [vestingAddress];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        EvmosErc20V1Types.msgConvertVestingAccountResponse);
  }
}
