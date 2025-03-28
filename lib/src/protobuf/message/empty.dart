import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

/// https://buf.build/protocolbuffers/wellknowntypes/docs/main:google.protobuf#google.protobuf.Empty
class ProtobufEmpty extends CosmosMessage {
  const ProtobufEmpty();

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  List get values => [];

  @override
  TypeUrl get typeUrl => UnknownTypeUrl("/google.protobuf.Empty");
}
