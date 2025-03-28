import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_create_cosm_wasm_pool_response.dart';

class OsmosisCosmWasmPoolMsgCreateCosmWasmPool extends OsmosisWasmPoolV1Beta1<
    OsmosisCosmWasmPoolMsgCreateCosmWasmPoolResponse> {
  final BigInt? codeIn;
  final List<int>? instantiateMsg;
  final String? sender;

  OsmosisCosmWasmPoolMsgCreateCosmWasmPool(
      {this.codeIn, List<int>? instantiateMsg, required this.sender})
      : instantiateMsg = BytesUtils.tryToBytes(instantiateMsg);
  factory OsmosisCosmWasmPoolMsgCreateCosmWasmPool.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolMsgCreateCosmWasmPool(
        codeIn: decode.getField(1),
        instantiateMsg: decode.getField(2),
        sender: decode.getField(3));
  }
  factory OsmosisCosmWasmPoolMsgCreateCosmWasmPool.fromJson(
      Map<String, dynamic> json) {
    return OsmosisCosmWasmPoolMsgCreateCosmWasmPool(
        codeIn: json.asBigInt("code_id"),
        instantiateMsg: json.asBytes("instantiate_msg"),
        sender: json.as("sender"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "code_id": codeIn?.toString(),
      "instantiate_msg": BytesUtils.tryToHexString(instantiateMsg),
      "sender": sender
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisCosmWasmPoolV1beta1Types.msgCreateCosmWasmPool;

  @override
  List get values => [codeIn, instantiateMsg, sender];

  @override
  OsmosisCosmWasmPoolMsgCreateCosmWasmPoolResponse onResponse(List<int> bytes) {
    return OsmosisCosmWasmPoolMsgCreateCosmWasmPoolResponse.deserialize(bytes);
  }

  @override
  List<String?> get signers => [sender];
}
