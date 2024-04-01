import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/messages/validator_slash_event.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// ValidatorSlashEvents is a collection of ValidatorSlashEvent messages.
class DistributionValidatorSlashEvents extends CosmosMessage {
  final List<DistributionValidatorSlashEvent> validatorSlashEvents;
  DistributionValidatorSlashEvents(
      List<DistributionValidatorSlashEvent> validatorSlashEvents)
      : validatorSlashEvents = validatorSlashEvents.mutable;
  factory DistributionValidatorSlashEvents.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionValidatorSlashEvents(decode
        .getFileds(1)
        .map((e) => DistributionValidatorSlashEvent.deserialize(e))
        .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "validator_slash_events":
          validatorSlashEvents.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl =>
      DistributionV1beta1Types.distributionValidatorSlashEvents.typeUrl;

  @override
  List get values => [validatorSlashEvents];
}
