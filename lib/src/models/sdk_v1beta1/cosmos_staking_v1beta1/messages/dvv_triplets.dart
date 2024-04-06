import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

import 'dvv_triplet.dart';

/// DVVTriplets defines an array of DVVTriplet objects.
class DVVTriplets extends CosmosMessage {
  final List<DVVTriplet> triplets;

  const DVVTriplets({required this.triplets});
  factory DVVTriplets.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DVVTriplets(
        triplets: decode
            .getFields<List<int>>(1)
            .map((e) => DVVTriplet.deserialize(e))
            .toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'triplets': triplets.map((triplet) => triplet.toJson()).toList(),
    };
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get typeUrl => StakingV1beta1Types.dVVTriplets.typeUrl;

  @override
  List get values => [triplets];
}
