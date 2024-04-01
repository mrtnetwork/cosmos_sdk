import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgExecResponse defines the Msg/MsgExecResponse response type.
class AuthzMsgExecResponse extends CosmosMessage {
  final List<List<int>> results;
  AuthzMsgExecResponse({required List<List<int>> results})
      : results = List<List<int>>.unmodifiable(results
            .map((e) => BytesUtils.toBytes(e, unmodifiable: true))
            .toList());
  factory AuthzMsgExecResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthzMsgExecResponse(results: decode.getFileds<List<int>>(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"results": results.map((e) => BytesUtils.toHexString(e)).toList()};
  }

  @override
  String get typeUrl => AuthzV1beta1Types.authzMsgExecResponse.typeUrl;

  @override
  List get values => [results];
}
