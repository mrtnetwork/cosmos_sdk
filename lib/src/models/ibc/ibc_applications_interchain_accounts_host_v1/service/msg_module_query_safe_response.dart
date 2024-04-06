import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgModuleQuerySafeResponse defines the response for Msg/ModuleQuerySafe
class InterchainAccountsHostMsgModuleQuerySafeResponse extends CosmosMessage {
  /// height at which the responses were queried
  final BigInt? height;

  /// protobuf encoded responses for each query
  final List<List<int>>? responses;

  InterchainAccountsHostMsgModuleQuerySafeResponse(
      {this.height, List<List<int>>? responses})
      : responses = responses == null
            ? null
            : List<List<int>>.unmodifiable(
                responses.map((e) => BytesUtils.tryToBytes(e)));
  factory InterchainAccountsHostMsgModuleQuerySafeResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InterchainAccountsHostMsgModuleQuerySafeResponse(
        height: decode.getField(1), responses: decode.getFields<List<int>>(2));
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "height": height?.toString(),
      "responses": responses?.map((e) => BytesUtils.tryToHexString(e)).toList()
    };
  }

  @override
  String get typeUrl =>
      IbcTypes.interchainAccountsHostMsgModuleQuerySafeResponse.typeUrl;

  @override
  List get values => [height, responses];
}
