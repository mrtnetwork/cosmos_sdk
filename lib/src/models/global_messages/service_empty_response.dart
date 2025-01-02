import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgExecResponse defines the Msg/MsgExecResponse response type.
class EmptyServiceRequestResponse extends CosmosMessage {
  const EmptyServiceRequestResponse(this.typeUrl);

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  final TypeUrl typeUrl;

  @override
  List get values => [];
}
