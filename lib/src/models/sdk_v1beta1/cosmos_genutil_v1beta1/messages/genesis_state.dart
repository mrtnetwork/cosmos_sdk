import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_genutil_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GenesisState defines the raw genesis transaction in JSON.
class GenutilGenesisState extends CosmosMessage {
  /// gen_txs defines the genesis transactions.
  final List<int> genTxs;
  GenutilGenesisState({required List<int> genTxs})
      : genTxs = BytesUtils.toBytes(genTxs, unmodifiable: true);
  factory GenutilGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GenutilGenesisState(genTxs: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"gen_txs": BytesUtils.toHexString(genTxs)};
  }

  @override
  String get typeUrl => GenutilV1beta1Types.genutilGenesisState.typeUrl;

  @override
  List get values => [genTxs];
}
