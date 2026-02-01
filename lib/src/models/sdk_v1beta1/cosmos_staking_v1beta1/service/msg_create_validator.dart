import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/commission_rates.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/description.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgCreateValidator defines a SDK message for creating a new validator.
class MsgCreateValidator
    extends StakingV1Beta1Service<EmptyServiceRequestResponse>
    with AminoMessage<EmptyServiceRequestResponse> {
  final Description description;
  final CommissionRates commission;
  final BigInt minSelfDelegation;

  /// Deprecated: Use of Delegator Address in MsgCreateValidator is deprecated.
  /// The validator address bytes and delegator
  /// address bytes refer to the same account while creating validator (defer only in bech32 notation).
  final CosmosBaseAddress? delegatorAddress;
  final CosmosBaseAddress? validatorAddress;
  final Any? pubkey;
  final Coin value;

  const MsgCreateValidator({
    required this.description,
    required this.commission,
    required this.minSelfDelegation,
    this.delegatorAddress,
    this.validatorAddress,
    this.pubkey,
    required this.value,
  });
  factory MsgCreateValidator.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgCreateValidator(
      description: Description.deserialize(decode.getField(1)),
      commission: CommissionRates.deserialize(decode.getField(2)),
      minSelfDelegation: BigintUtils.parse(decode.getField<String>(3)),
      delegatorAddress: decode
          .getResult(4)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      validatorAddress: decode
          .getResult(5)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      pubkey: decode
          .getResult(6)
          ?.to<Any, List<int>>((e) => Any.deserialize(e)),
      value: Coin.deserialize(decode.getField(7)),
    );
  }
  factory MsgCreateValidator.fromJson(Map<String, dynamic> json) {
    return MsgCreateValidator(
      description: Description.fromJson(json.asMap("description")),
      commission: CommissionRates.fromJson(json.asMap("commission")),
      minSelfDelegation: json.asBigInt("min_self_delegation"),
      delegatorAddress: json.asAddress("delegator_address"),
      validatorAddress: json.asAddress("validator_address"),
      pubkey: json.maybeAs<Any, Map<String, dynamic>>(
        key: "pubkey",
        onValue: (e) => Any.fromJson(e),
      ),
      value: Coin.fromJson(json.asMap("value")),
    );
  }
  @override
  Map<String, dynamic> toJson({bool amino = false}) {
    return {
      'description': description.toJson(),
      'commission': commission.toJson(),
      'min_self_delegation': minSelfDelegation.toString(),
      'delegator_address': delegatorAddress?.address,
      'validator_address': validatorAddress?.address,
      'pubkey': amino ? pubkey?.toAminoJson() : pubkey?.toJson(),
      'value': value.toJson(),
    };
  }

  @override
  Map<String, dynamic> toAminoJson() {
    return {
      "type": typeUrl.aminoType!,
      "value": toJson(amino: true)..removeWhere((k, v) => v == null),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];
  @override
  TypeUrl get typeUrl => StakingV1beta1Types.msgCreateValidator;

  @override
  List get values => [
    description,
    commission,
    minSelfDelegation.toString(),
    delegatorAddress?.address,
    validatorAddress?.address,
    pubkey,
    value,
  ];

  @override
  List<String?> get signers => [validatorAddress?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      StakingV1beta1Types.msgCreateValidatorResponse,
    );
  }
}
