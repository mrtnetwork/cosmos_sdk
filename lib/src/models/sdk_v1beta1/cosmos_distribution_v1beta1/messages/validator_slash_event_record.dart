import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/messages/validator_slash_event.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ValidatorSlashEventRecord is used for import / export via genesis json.
class DistributionValidatorSlashEventRecord extends CosmosMessage {
  /// validator_address is the address of the validator.
  final CosmosBaseAddress? validatorAddress;

  /// height defines the block height at which the slash event occurred.
  final BigInt? height;

  /// period is the period of the slash event
  final BigInt? period;

  /// validator_slash_event describes the slash event.
  final DistributionValidatorSlashEvent validatorSlashEvent;
  const DistributionValidatorSlashEventRecord({
    this.validatorAddress,
    this.height,
    this.period,
    required this.validatorSlashEvent,
  });
  factory DistributionValidatorSlashEventRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionValidatorSlashEventRecord(
      validatorAddress: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      height: decode.getField(2),
      period: decode.getField(3),
      validatorSlashEvent: DistributionValidatorSlashEvent.deserialize(
        decode.getField(4),
      ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "validator_address": validatorAddress?.address,
      "height": height?.toString(),
      "period": period?.toString(),
      "validator_slash_event": validatorSlashEvent.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionValidatorSlashEventRecord;

  @override
  List get values => [
    validatorAddress?.address,
    height,
    period,
    validatorSlashEvent,
  ];
}
