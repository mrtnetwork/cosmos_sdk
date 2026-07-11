import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/cosmos/gov/v1beta1/src/gov.dart"
    as cosmos_gov_v1beta1_gov;

/// MsgSubmitProposal defines an sdk.Msg type that supports submitting arbitrary
/// proposal Content.
class MsgSubmitProposal extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSubmitProposalResponse>,
        ICosmosProtoAminoMessage {
  /// content is the proposal's content.
  final google_protobuf_any.Any? content;

  /// initial_deposit is the deposit value that must be paid at proposal submission.
  final List<cosmos_base_v1beta1_coin.Coin> initialDeposit;

  /// proposer is the account address of the proposer.
  final String? proposer;

  const MsgSubmitProposal({
    this.content,
    this.initialDeposit = const [],
    this.proposer,
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
          value: "cosmos-sdk/MsgSubmitProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [content, initialDeposit, proposer];

  @override
  Map<String, dynamic> toJson() {
    return {
      'content': content?.toJson(),
      'initial_deposit': initialDeposit.map((e) => e.toJson()).toList(),
      'proposer': proposer,
    };
  }

  factory MsgSubmitProposal.fromJson(Map<String, dynamic> json) {
    return MsgSubmitProposal(
      content: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'content',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
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
    );
  }

  factory MsgSubmitProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSubmitProposal(
      content: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      initialDeposit:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      proposer: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1MsgSubmitProposal;
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
      fields: [
        ProtoFieldConfig.uint64(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
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
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1MsgSubmitProposalResponse;
}

/// MsgVote defines a message to cast a vote.
class MsgVote extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgVoteResponse>, ICosmosProtoAminoMessage {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// voter is the voter address for the proposal.
  final String? voter;

  /// option defines the vote option.
  final cosmos_gov_v1beta1_gov.VoteOption? option;

  const MsgVote({this.proposalId, this.voter, this.option});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "voter"),
        ProtoOptionString(name: "amino.name", value: "cosmos-sdk/MsgVote"),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.enumType(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId, voter, option];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proposal_id': proposalId?.toString(),
      'voter': voter,
      'option': option?.protoName,
    };
  }

  factory MsgVote.fromJson(Map<String, dynamic> json) {
    return MsgVote(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
      voter: json.valueAsString<String?>('voter', acceptCamelCase: true),
      option: json.valueTo<cosmos_gov_v1beta1_gov.VoteOption?, Object?>(
        key: 'option',
        parse: (v) => cosmos_gov_v1beta1_gov.VoteOption.from(v),
      ),
    );
  }

  factory MsgVote.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgVote(
      proposalId: decode.getBigInt<BigInt?>(1),
      voter: decode.getString<String?>(2),
      option: decode.getEnum<cosmos_gov_v1beta1_gov.VoteOption?>(
        3,
        cosmos_gov_v1beta1_gov.VoteOption.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1MsgVote;
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
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1MsgVoteResponse;
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
  final List<cosmos_gov_v1beta1_gov.WeightedVoteOption> options;

  const MsgVoteWeighted({this.proposalId, this.voter, this.options = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "voter"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgVoteWeighted",
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
  List<Object?> get protoValues => [proposalId, voter, options];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proposal_id': proposalId?.toString(),
      'voter': voter,
      'options': options.map((e) => e.toJson()).toList(),
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
                  cosmos_gov_v1beta1_gov.WeightedVoteOption,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          cosmos_gov_v1beta1_gov.WeightedVoteOption.fromJson(v),
                ),
              )
              .toList(),
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
              .map(
                (b) => cosmos_gov_v1beta1_gov.WeightedVoteOption.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1MsgVoteWeighted;
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
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1MsgVoteWeightedResponse;
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
        ProtoOptionString(name: "amino.name", value: "cosmos-sdk/MsgDeposit"),
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
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
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
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1MsgDeposit;
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
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1MsgDepositResponse;
}
