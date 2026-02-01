import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'genesis_counterparty_info.dart';

/// GenesisState defines the ibc client v2 submodule's genesis state.
class IbcClientV2GenesisState extends CosmosMessage {
  /// counterparty info for each client
  final List<IbcClientV2GenesisCounterpartyInfo>? counterpartyInfos;
  IbcClientV2GenesisState({
    required List<IbcClientV2GenesisCounterpartyInfo>? counterpartyInfos,
  }) : counterpartyInfos = counterpartyInfos?.immutable;
  factory IbcClientV2GenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientV2GenesisState(
      counterpartyInfos:
          decode
              .getFields<List<int>>(1)
              .map((e) => IbcClientV2GenesisCounterpartyInfo.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "counterparty_infos": counterpartyInfos?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibClientV2GenesisState;

  @override
  List get values => [counterpartyInfos];
}
