import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// MsgSubmitEvidence represents a message that supports submitting arbitrary
/// Evidence of misbehavior such as equivocation or counterfactual signing.
class MsgSubmitEvidence extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSubmitEvidenceResponse>,
        ICosmosProtoAminoMessage {
  /// submitter is the signer account address of evidence.
  final String? submitter;

  /// evidence defines the evidence of misbehavior.
  final google_protobuf_any.Any? evidence;

  const MsgSubmitEvidence({this.submitter, this.evidence});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "submitter"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgSubmitEvidence",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [submitter, evidence];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'submitter': submitter, 'evidence': config.encodeMessage(evidence)};
  }

  factory MsgSubmitEvidence.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSubmitEvidence(
      submitter: json.valueAsString<String?>(
        'submitter',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      evidence: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'evidence',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgSubmitEvidence.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSubmitEvidence(
      submitter: decode.getString<String?>(1),
      evidence: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEvidenceV1beta1MsgSubmitEvidence;
  @override
  MsgSubmitEvidenceResponse onServiceResponse(List<int> bytes) {
    return MsgSubmitEvidenceResponse.deserialize(bytes);
  }

  @override
  MsgSubmitEvidenceResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSubmitEvidenceResponse.fromJson(json);
  }
}

/// MsgSubmitEvidenceResponse defines the Msg/SubmitEvidence response type.
class MsgSubmitEvidenceResponse extends CosmosProtoMessage {
  /// hash defines the hash of the evidence.
  final BuBytes? hash;

  MsgSubmitEvidenceResponse({List<int>? hash}) : hash = hash?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(4)],
    );
  }

  @override
  List<Object?> get protoValues => [hash];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'hash': config.encodeBinary(hash)};
  }

  factory MsgSubmitEvidenceResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSubmitEvidenceResponse(
      hash: config.decodeBinary<List<int>?>(
        json.valueAs('hash', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgSubmitEvidenceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSubmitEvidenceResponse(hash: decode.getBytes<List<int>?>(4));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEvidenceV1beta1MsgSubmitEvidenceResponse;
}
