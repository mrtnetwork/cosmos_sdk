import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/messages/grant.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// GenesisState contains a set of fee allowances, persisted from the store
class FeeGrantGenesisState extends CosmosMessage {
  final List<FeeGrant> allowances;
  FeeGrantGenesisState(List<FeeGrant> allowances)
      : allowances = allowances.mutable;
  factory FeeGrantGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return FeeGrantGenesisState(
        decode.getFileds(1).map((e) => FeeGrant.deserialize(e)).toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"allowances": allowances.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl => FeegrantV1beta1Types.feeGrantGenesisState.typeUrl;

  @override
  List get values => [allowances];
}
