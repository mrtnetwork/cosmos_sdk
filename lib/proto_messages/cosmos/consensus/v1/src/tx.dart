import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/tendermint/types/src/params.dart"
    as tendermint_types_params;

/// MsgUpdateParams is the Msg/UpdateParams request type.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// params defines the x/consensus parameters to update.
  /// VersionsParams is not included in this Msg because it is tracked
  /// separarately in x/upgrade.
  ///
  /// NOTE: All parameters must be supplied.
  final tendermint_types_params.BlockParams? block;

  final tendermint_types_params.EvidenceParams? evidence;

  final tendermint_types_params.ValidatorParams? validator;

  final tendermint_types_params.ABCIParams? abci;

  const MsgUpdateParams({
    this.authority,
    this.block,
    this.evidence,
    this.validator,
    this.abci,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/x/consensus/MsgUpdateParams",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.message(4),
        ProtoFieldConfig.message(
          5,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.50",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    block,
    evidence,
    validator,
    abci,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'authority': authority,
      'block': config.encodeMessage(block),
      'evidence': config.encodeMessage(evidence),
      'validator': config.encodeMessage(validator),
      'abci': config.encodeMessage(abci),
    };
  }

  factory MsgUpdateParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      block: json.valueTo<tendermint_types_params.BlockParams?, Object>(
        key: 'block',
        parse:
            (v) => tendermint_types_params.BlockParams.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      evidence: json.valueTo<tendermint_types_params.EvidenceParams?, Object>(
        key: 'evidence',
        parse:
            (v) => tendermint_types_params.EvidenceParams.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      validator: json.valueTo<tendermint_types_params.ValidatorParams?, Object>(
        key: 'validator',
        parse:
            (v) => tendermint_types_params.ValidatorParams.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      abci: json.valueTo<tendermint_types_params.ABCIParams?, Object>(
        key: 'abci',
        parse:
            (v) => tendermint_types_params.ABCIParams.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      block: decode.messageTo<tendermint_types_params.BlockParams?>(
        2,
        (b) => tendermint_types_params.BlockParams.deserialize(b),
      ),
      evidence: decode.messageTo<tendermint_types_params.EvidenceParams?>(
        3,
        (b) => tendermint_types_params.EvidenceParams.deserialize(b),
      ),
      validator: decode.messageTo<tendermint_types_params.ValidatorParams?>(
        4,
        (b) => tendermint_types_params.ValidatorParams.deserialize(b),
      ),
      abci: decode.messageTo<tendermint_types_params.ABCIParams?>(
        5,
        (b) => tendermint_types_params.ABCIParams.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosConsensusV1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// MsgUpdateParamsResponse defines the response structure for executing a
/// MsgUpdateParams message.
class MsgUpdateParamsResponse extends CosmosProtoMessage {
  const MsgUpdateParamsResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory MsgUpdateParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosConsensusV1MsgUpdateParamsResponse;
}
