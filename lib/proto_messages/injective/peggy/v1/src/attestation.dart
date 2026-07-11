import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// Attestation is an aggregate of `claims` that eventually becomes `observed` by
/// all orchestrators
/// EVENT_NONCE:
/// EventNonce a nonce provided by the peggy contract that is unique per event
/// fired These event nonces must be relayed in order. This is a correctness
/// issue, if relaying out of order transaction replay attacks become possible
/// OBSERVED:
/// Observed indicates that >67% of validators have attested to the event,
/// and that the event should be executed by the peggy state machine
///
/// The actual content of the claims is passed in with the transaction making the
/// claim and then passed through the call stack alongside the attestation while
/// it is processed the key in which the attestation is stored is keyed on the
/// exact details of the claim but there is no reason to store those exact
/// details becuause the next message sender will kindly provide you with them.
class Attestation extends CosmosProtoMessage {
  final bool? observed;

  final List<String> votes;

  final BigInt? height;

  final google_protobuf_any.Any? claim;

  const Attestation({
    this.observed,
    this.votes = const [],
    this.height,
    this.claim,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bool(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [observed, votes, height, claim];

  @override
  Map<String, dynamic> toJson() {
    return {
      'observed': observed,
      'votes': votes.map((e) => e).toList(),
      'height': height?.toString(),
      'claim': claim?.toJson(),
    };
  }

  factory Attestation.fromJson(Map<String, dynamic> json) {
    return Attestation(
      observed: json.valueAsBool<bool?>('observed', acceptCamelCase: true),
      votes:
          (json.valueEnsureAsList<dynamic>(
            'votes',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      claim: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'claim',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory Attestation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Attestation(
      observed: decode.getBool<bool?>(1),
      votes: decode.getListOrEmpty<String>(2),
      height: decode.getBigInt<BigInt?>(3),
      claim: decode.messageTo<google_protobuf_any.Any?>(
        4,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1Attestation;
}

/// ERC20Token unique identifier for an Ethereum ERC20 token.
/// CONTRACT:
/// The contract address on ETH of the token, this could be a Cosmos
/// originated token, if so it will be the ERC20 address of the representation
/// (note: developers should look up the token symbol using the address on ETH to
/// display for UI)
class ERC20Token extends CosmosProtoMessage {
  final String? contract;

  final String? amount;

  const ERC20Token({this.contract, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [contract, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'contract': contract, 'amount': amount};
  }

  factory ERC20Token.fromJson(Map<String, dynamic> json) {
    return ERC20Token(
      contract: json.valueAsString<String?>('contract', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory ERC20Token.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ERC20Token(
      contract: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1ERC20Token;
}
