import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

import 'dv_pair.dart';

/// DVPairs defines an array of DVPair objects.
class DVPairs extends CosmosMessage {
  final List<DVPair> pairs;

  const DVPairs({required this.pairs});
  factory DVPairs.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DVPairs(
      pairs:
          decode
              .getFields<List<int>>(1)
              .map((e) => DVPair.deserialize(e))
              .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {'pairs': pairs.map((pair) => pair.toJson()).toList()};
  }

  @override
  List<int> get fieldIds => [1];

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.dVPairs;

  @override
  List get values => [pairs];
}
