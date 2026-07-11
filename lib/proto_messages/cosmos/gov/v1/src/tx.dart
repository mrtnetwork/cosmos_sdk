import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/cosmos/gov/v1/src/gov.dart"
    as cosmos_gov_v1_gov;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// MsgSubmitProposal defines an sdk.Msg type that supports submitting arbitrary
/// proposal Content.
class MsgSubmitProposal extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSubmitProposalResponse>,
        ICosmosProtoAminoMessage {
  /// messages are the arbitrary messages to be executed if proposal passes.
  final List<google_protobuf_any.Any> messages;

  /// initial_deposit is the deposit value that must be paid at proposal submission.
  final List<cosmos_base_v1beta1_coin.Coin> initialDeposit;

  /// proposer is the account address of the proposer.
  final String? proposer;

  /// metadata is any arbitrary metadata attached to the proposal.
  final String? metadata;

  /// title is the title of the proposal.
  final String? title;

  /// summary is the summary of the proposal
  final String? summary;

  /// expedited defines if the proposal is expedited or not
  final bool? expedited;

  const MsgSubmitProposal({
    this.messages = const [],
    this.initialDeposit = const [],
    this.proposer,
    this.metadata,
    this.title,
    this.summary,
    this.expedited,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "proposer"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/v1/MsgSubmitProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(
          5,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.47",
            ),
          ],
        ),
        ProtoFieldConfig.string(
          6,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.47",
            ),
          ],
        ),
        ProtoFieldConfig.bool(
          7,
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
    messages,
    initialDeposit,
    proposer,
    metadata,
    title,
    summary,
    expedited,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'messages': messages.map((e) => e.toJson()).toList(),
      'initial_deposit': initialDeposit.map((e) => e.toJson()).toList(),
      'proposer': proposer,
      'metadata': metadata,
      'title': title,
      'summary': summary,
      'expedited': expedited,
    };
  }

  factory MsgSubmitProposal.fromJson(Map<String, dynamic> json) {
    return MsgSubmitProposal(
      messages:
          (json.valueEnsureAsList<dynamic>('messages', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_any.Any,
                  Map<String, dynamic>
                >(value: e, parse: (v) => google_protobuf_any.Any.fromJson(v)),
              )
              .toList(),
      initialDeposit:
          (json.valueEnsureAsList<dynamic>(
                'initial_deposit',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      proposer: json.valueAsString<String?>('proposer', acceptCamelCase: true),
      metadata: json.valueAsString<String?>('metadata', acceptCamelCase: true),
      title: json.valueAsString<String?>('title', acceptCamelCase: true),
      summary: json.valueAsString<String?>('summary', acceptCamelCase: true),
      expedited: json.valueAsBool<bool?>('expedited', acceptCamelCase: true),
    );
  }

  factory MsgSubmitProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSubmitProposal(
      messages:
          decode
              .getListOfBytes(1)
              .map((b) => google_protobuf_any.Any.deserialize(b))
              .toList(),
      initialDeposit:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      proposer: decode.getString<String?>(3),
      metadata: decode.getString<String?>(4),
      title: decode.getString<String?>(5),
      summary: decode.getString<String?>(6),
      expedited: decode.getBool<bool?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1MsgSubmitProposal;
  @override
  MsgSubmitProposalResponse onServiceResponse(List<int> bytes) {
    return MsgSubmitProposalResponse.deserialize(bytes);
  }

  @override
  MsgSubmitProposalResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSubmitProposalResponse.fromJson(json);
  }
}

/// MsgSubmitProposalResponse defines the Msg/SubmitProposal response type.
class MsgSubmitProposalResponse extends CosmosProtoMessage {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  const MsgSubmitProposalResponse({this.proposalId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId];

  @override
  Map<String, dynamic> toJson() {
    return {'proposal_id': proposalId?.toString()};
  }

  factory MsgSubmitProposalResponse.fromJson(Map<String, dynamic> json) {
    return MsgSubmitProposalResponse(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSubmitProposalResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSubmitProposalResponse(proposalId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1MsgSubmitProposalResponse;
}

/// MsgExecLegacyContent is used to wrap the legacy content field into a message.
/// This ensures backwards compatibility with v1beta1.MsgSubmitProposal.
class MsgExecLegacyContent extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgExecLegacyContentResponse>,
        ICosmosProtoAminoMessage {
  /// content is the proposal's content.
  final google_protobuf_any.Any? content;

  /// authority must be the gov module address.
  final String? authority;

  const MsgExecLegacyContent({this.content, this.authority});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/v1/MsgExecLegacyContent",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [content, authority];

  @override
  Map<String, dynamic> toJson() {
    return {'content': content?.toJson(), 'authority': authority};
  }

  factory MsgExecLegacyContent.fromJson(Map<String, dynamic> json) {
    return MsgExecLegacyContent(
      content: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'content',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgExecLegacyContent.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgExecLegacyContent(
      content: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      authority: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1MsgExecLegacyContent;
  @override
  MsgExecLegacyContentResponse onServiceResponse(List<int> bytes) {
    return MsgExecLegacyContentResponse.deserialize(bytes);
  }

  @override
  MsgExecLegacyContentResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgExecLegacyContentResponse.fromJson(json);
  }
}

/// MsgExecLegacyContentResponse defines the Msg/ExecLegacyContent response type.
class MsgExecLegacyContentResponse extends CosmosProtoMessage {
  const MsgExecLegacyContentResponse();

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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgExecLegacyContentResponse.fromJson(Map<String, dynamic> json) {
    return MsgExecLegacyContentResponse();
  }

  factory MsgExecLegacyContentResponse.deserialize(List<int> bytes) {
    return MsgExecLegacyContentResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1MsgExecLegacyContentResponse;
}

/// MsgVote defines a message to cast a vote.
class MsgVote extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgVoteResponse>, ICosmosProtoAminoMessage {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// voter is the voter address for the proposal.
  final String? voter;

  /// option defines the vote option.
  final cosmos_gov_v1_gov.VoteOption? option;

  /// metadata is any arbitrary metadata attached to the Vote.
  final String? metadata;

  const MsgVote({this.proposalId, this.voter, this.option, this.metadata});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "voter"),
        ProtoOptionString(name: "amino.name", value: "cosmos-sdk/v1/MsgVote"),
      ],
      fields: [
        ProtoFieldConfig.uint64(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.enumType(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId, voter, option, metadata];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proposal_id': proposalId?.toString(),
      'voter': voter,
      'option': option?.protoName,
      'metadata': metadata,
    };
  }

  factory MsgVote.fromJson(Map<String, dynamic> json) {
    return MsgVote(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
      voter: json.valueAsString<String?>('voter', acceptCamelCase: true),
      option: json.valueTo<cosmos_gov_v1_gov.VoteOption?, Object?>(
        key: 'option',
        parse: (v) => cosmos_gov_v1_gov.VoteOption.from(v),
      ),
      metadata: json.valueAsString<String?>('metadata', acceptCamelCase: true),
    );
  }

  factory MsgVote.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgVote(
      proposalId: decode.getBigInt<BigInt?>(1),
      voter: decode.getString<String?>(2),
      option: decode.getEnum<cosmos_gov_v1_gov.VoteOption?>(
        3,
        cosmos_gov_v1_gov.VoteOption.values,
      ),
      metadata: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1MsgVote;
  @override
  MsgVoteResponse onServiceResponse(List<int> bytes) {
    return MsgVoteResponse.deserialize(bytes);
  }

  @override
  MsgVoteResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgVoteResponse.fromJson(json);
  }
}

/// MsgVoteResponse defines the Msg/Vote response type.
class MsgVoteResponse extends CosmosProtoMessage {
  const MsgVoteResponse();

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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgVoteResponse.fromJson(Map<String, dynamic> json) {
    return MsgVoteResponse();
  }

  factory MsgVoteResponse.deserialize(List<int> bytes) {
    return MsgVoteResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1MsgVoteResponse;
}

/// MsgVoteWeighted defines a message to cast a vote.
class MsgVoteWeighted extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgVoteWeightedResponse>,
        ICosmosProtoAminoMessage {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// voter is the voter address for the proposal.
  final String? voter;

  /// options defines the weighted vote options.
  final List<cosmos_gov_v1_gov.WeightedVoteOption> options;

  /// metadata is any arbitrary metadata attached to the VoteWeighted.
  final String? metadata;

  const MsgVoteWeighted({
    this.proposalId,
    this.voter,
    this.options = const [],
    this.metadata,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "voter"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/v1/MsgVoteWeighted",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId, voter, options, metadata];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proposal_id': proposalId?.toString(),
      'voter': voter,
      'options': options.map((e) => e.toJson()).toList(),
      'metadata': metadata,
    };
  }

  factory MsgVoteWeighted.fromJson(Map<String, dynamic> json) {
    return MsgVoteWeighted(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
      voter: json.valueAsString<String?>('voter', acceptCamelCase: true),
      options:
          (json.valueEnsureAsList<dynamic>('options', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_gov_v1_gov.WeightedVoteOption,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => cosmos_gov_v1_gov.WeightedVoteOption.fromJson(v),
                ),
              )
              .toList(),
      metadata: json.valueAsString<String?>('metadata', acceptCamelCase: true),
    );
  }

  factory MsgVoteWeighted.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgVoteWeighted(
      proposalId: decode.getBigInt<BigInt?>(1),
      voter: decode.getString<String?>(2),
      options:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_gov_v1_gov.WeightedVoteOption.deserialize(b))
              .toList(),
      metadata: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1MsgVoteWeighted;
  @override
  MsgVoteWeightedResponse onServiceResponse(List<int> bytes) {
    return MsgVoteWeightedResponse.deserialize(bytes);
  }

  @override
  MsgVoteWeightedResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgVoteWeightedResponse.fromJson(json);
  }
}

/// MsgVoteWeightedResponse defines the Msg/VoteWeighted response type.
class MsgVoteWeightedResponse extends CosmosProtoMessage {
  const MsgVoteWeightedResponse();

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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgVoteWeightedResponse.fromJson(Map<String, dynamic> json) {
    return MsgVoteWeightedResponse();
  }

  factory MsgVoteWeightedResponse.deserialize(List<int> bytes) {
    return MsgVoteWeightedResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1MsgVoteWeightedResponse;
}

/// MsgDeposit defines a message to submit a deposit to an existing proposal.
class MsgDeposit extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDepositResponse>,
        ICosmosProtoAminoMessage {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// depositor defines the deposit addresses from the proposals.
  final String? depositor;

  /// amount to be deposited by depositor.
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgDeposit({this.proposalId, this.depositor, this.amount = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "depositor"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/v1/MsgDeposit",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId, depositor, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proposal_id': proposalId?.toString(),
      'depositor': depositor,
      'amount': amount.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgDeposit.fromJson(Map<String, dynamic> json) {
    return MsgDeposit(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
      depositor: json.valueAsString<String?>(
        'depositor',
        acceptCamelCase: true,
      ),
      amount:
          (json.valueEnsureAsList<dynamic>('amount', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDeposit(
      proposalId: decode.getBigInt<BigInt?>(1),
      depositor: decode.getString<String?>(2),
      amount:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1MsgDeposit;
  @override
  MsgDepositResponse onServiceResponse(List<int> bytes) {
    return MsgDepositResponse.deserialize(bytes);
  }

  @override
  MsgDepositResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgDepositResponse.fromJson(json);
  }
}

/// MsgDepositResponse defines the Msg/Deposit response type.
class MsgDepositResponse extends CosmosProtoMessage {
  const MsgDepositResponse();

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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgDepositResponse.fromJson(Map<String, dynamic> json) {
    return MsgDepositResponse();
  }

  factory MsgDepositResponse.deserialize(List<int> bytes) {
    return MsgDepositResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1MsgDepositResponse;
}

/// MsgUpdateParams is the Msg/UpdateParams request type.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// params defines the x/gov parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final cosmos_gov_v1_gov.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/x/gov/v1/MsgUpdateParams",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, params];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'params': params?.toJson()};
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      params: json.valueTo<cosmos_gov_v1_gov.Params?, Map<String, dynamic>>(
        key: 'params',
        parse: (v) => cosmos_gov_v1_gov.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<cosmos_gov_v1_gov.Params?>(
        2,
        (b) => cosmos_gov_v1_gov.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1MsgUpdateParams;
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUpdateParamsResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1MsgUpdateParamsResponse;
}

/// MsgCancelProposal is the Msg/CancelProposal request type.
class MsgCancelProposal extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgCancelProposalResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// proposer is the account address of the proposer.
  final String? proposer;

  const MsgCancelProposal({this.proposalId, this.proposer});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "proposer"),
      ],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId, proposer];

  @override
  Map<String, dynamic> toJson() {
    return {'proposal_id': proposalId?.toString(), 'proposer': proposer};
  }

  factory MsgCancelProposal.fromJson(Map<String, dynamic> json) {
    return MsgCancelProposal(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
      proposer: json.valueAsString<String?>('proposer', acceptCamelCase: true),
    );
  }

  factory MsgCancelProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCancelProposal(
      proposalId: decode.getBigInt<BigInt?>(1),
      proposer: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1MsgCancelProposal;
  @override
  MsgCancelProposalResponse onServiceResponse(List<int> bytes) {
    return MsgCancelProposalResponse.deserialize(bytes);
  }

  @override
  MsgCancelProposalResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCancelProposalResponse.fromJson(json);
  }
}

/// MsgCancelProposalResponse defines the response structure for executing a
/// MsgCancelProposal message.
class MsgCancelProposalResponse extends CosmosProtoMessage {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// canceled_time is the time when proposal is canceled.
  final google_protobuf_timestamp.Timestamp? canceledTime;

  /// canceled_height defines the block height at which the proposal is canceled.
  final BigInt? canceledHeight;

  const MsgCancelProposalResponse({
    this.proposalId,
    this.canceledTime,
    this.canceledHeight,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId, canceledTime, canceledHeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proposal_id': proposalId?.toString(),
      'canceled_time': canceledTime?.toRfc3339(),
      'canceled_height': canceledHeight?.toString(),
    };
  }

  factory MsgCancelProposalResponse.fromJson(Map<String, dynamic> json) {
    return MsgCancelProposalResponse(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
      canceledTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'canceled_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      canceledHeight: json.valueAsBigInt<BigInt?>(
        'canceled_height',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCancelProposalResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCancelProposalResponse(
      proposalId: decode.getBigInt<BigInt?>(1),
      canceledTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        2,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      canceledHeight: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1MsgCancelProposalResponse;
}
