import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

/// SignedMsgType is a type of signed message in the consensus.
class SignedMsgType implements CosmosEnum {
  // unspecified defines an invalid validator status.
  static const SignedMsgType unknown = SignedMsgType._(0, "unknown");

  // Votes
  static const SignedMsgType prevote = SignedMsgType._(1, "prevote");

  static const SignedMsgType precommit = SignedMsgType._(2, "precommit");

  // Proposals
  static const SignedMsgType proposal = SignedMsgType._(32, "proposal");

  @override
  final int value;
  @override
  final String name;

  const SignedMsgType._(this.value, this.name);
  static const List<SignedMsgType> values = [
    unknown,
    prevote,
    precommit,
    proposal
  ];

  static SignedMsgType fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No SignedMsgType element found for the given value.",
          details: {"value": value}),
    );
  }
}
