import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'msg_create_cosm_wasm_pool_response.dart';

class OsmosisCosmWasmPoolMsgCreateCosmWasmPool extends CosmosMessage
    with ServiceMessage<OsmosisCosmWasmPoolMsgCreateCosmWasmPoolResponse> {
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
  String get typeUrl =>
      OsmosisCosmWasmPoolV1beta1Types.msgCreateCosmWasmPool.typeUrl;

  @override
  List get values => [codeIn, instantiateMsg, sender];

  @override
  OsmosisCosmWasmPoolMsgCreateCosmWasmPoolResponse onResponse(List<int> bytes) {
    return OsmosisCosmWasmPoolMsgCreateCosmWasmPoolResponse.deserialize(bytes);
  }

  @override
  String get service =>
      OsmosisCosmWasmPoolV1beta1Types.createCosmWasmPool.typeUrl;

  @override
  List<String?> get signers => [sender];
}
