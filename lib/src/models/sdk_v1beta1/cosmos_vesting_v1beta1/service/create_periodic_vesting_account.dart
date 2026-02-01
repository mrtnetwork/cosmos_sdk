import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/messages/period.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgCreateVestingAccount defines a message that enables creating a vesting account.
///
/// Since: cosmos-sdk 0.46
class MsgCreatePeriodicVestingAccount
    extends VestingV1Beta1Service<EmptyServiceRequestResponse> {
  final CosmosBaseAddress? fromAddress;
  final CosmosBaseAddress? toAddress;

  /// The start time of vesting as Unix time (in seconds).
  final BigInt? startTime;

  final List<Period> vestingPeriods;

  /// Constructs a new instance of [MsgCreatePeriodicVestingAccount].
  MsgCreatePeriodicVestingAccount({
    this.fromAddress,
    this.toAddress,
    this.startTime,
    required List<Period> vestingPeriods,
  }) : vestingPeriods = vestingPeriods.immutable;
  factory MsgCreatePeriodicVestingAccount.fromJson(Map<String, dynamic> json) {
    return MsgCreatePeriodicVestingAccount(
      fromAddress: json.asAddress("from_address"),
      toAddress: json.asAddress("to_address"),
      startTime: json.asBigInt("start_time"),
      vestingPeriods:
          json
              .asListOfMap("vesting_periods")
              ?.map((e) => Period.fromJson(e))
              .toList() ??
          [],
    );
  }
  factory MsgCreatePeriodicVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgCreatePeriodicVestingAccount(
      fromAddress: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      toAddress: decode
          .getResult(2)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      startTime: decode.getField(3),
      vestingPeriods:
          decode
              .getFields<List<int>>(4)
              .map((e) => Period.deserialize(e))
              .toList(),
    );
  }

  /// Converts this instance of [MsgCreatePeriodicVestingAccount] to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'from_address': fromAddress?.address,
      'to_address': toAddress?.address,
      'start_time': startTime?.toString(),
      'vesting_periods':
          vestingPeriods.map((period) => period.toJson()).toList(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  TypeUrl get typeUrl => VestingV1beta1Types.msgCreatePeriodicVestingAccount;

  @override
  List get values => [
    fromAddress?.address,
    toAddress?.address,
    startTime,
    vestingPeriods,
  ];

  @override
  List<String?> get signers => [fromAddress?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      VestingV1beta1Types.msgCreatePeriodicVestingAccountResponse,
    );
  }
}
