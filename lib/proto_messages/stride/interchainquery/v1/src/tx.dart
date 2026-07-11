import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/tendermint/crypto/src/proof.dart"
    as tendermint_crypto_proof;

/// MsgSubmitQueryResponse represents a message type to fulfil a query request.
class MsgSubmitQueryResponse extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSubmitQueryResponseResponse>,
        ICosmosProtoAminoMessage {
  final String? chainId;

  final String? queryId;

  final List<int>? result;

  final tendermint_crypto_proof.ProofOps? proofOps;

  final BigInt? height;

  final String? fromAddress;

  const MsgSubmitQueryResponse({
    this.chainId,
    this.queryId,
    this.result,
    this.proofOps,
    this.height,
    this.fromAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from_address"),
        ProtoOptionString(
          name: "amino.name",
          value: "interchainquery/MsgSubmitQueryResponse",
        ),
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.post,
          path: "/interchainquery/tx/v1beta1/submitquery",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.bytes(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.int64(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    chainId,
    queryId,
    result,
    proofOps,
    height,
    fromAddress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'chain_id': chainId,
      'query_id': queryId,
      'result': switch (result) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proof_ops': proofOps?.toJson(),
      'height': height?.toString(),
      'from_address': fromAddress,
    };
  }

  factory MsgSubmitQueryResponse.fromJson(Map<String, dynamic> json) {
    return MsgSubmitQueryResponse(
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      queryId: json.valueAsString<String?>('query_id', acceptCamelCase: true),
      result: json.valueAsBytes<List<int>?>(
        'result',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proofOps: json
          .valueTo<tendermint_crypto_proof.ProofOps?, Map<String, dynamic>>(
            key: 'proof_ops',
            parse: (v) => tendermint_crypto_proof.ProofOps.fromJson(v),
            acceptCamelCase: true,
          ),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      fromAddress: json.valueAsString<String?>(
        'from_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSubmitQueryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSubmitQueryResponse(
      chainId: decode.getString<String?>(1),
      queryId: decode.getString<String?>(2),
      result: decode.getBytes<List<int>?>(3),
      proofOps: decode.messageTo<tendermint_crypto_proof.ProofOps?>(
        4,
        (b) => tendermint_crypto_proof.ProofOps.deserialize(b),
      ),
      height: decode.getBigInt<BigInt?>(5),
      fromAddress: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideInterchainqueryV1MsgSubmitQueryResponse;
  @override
  MsgSubmitQueryResponseResponse onServiceResponse(List<int> bytes) {
    return MsgSubmitQueryResponseResponse.deserialize(bytes);
  }

  @override
  MsgSubmitQueryResponseResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSubmitQueryResponseResponse.fromJson(json);
  }
}

/// MsgSubmitQueryResponseResponse defines the MsgSubmitQueryResponse response
/// type.
class MsgSubmitQueryResponseResponse extends CosmosProtoMessage {
  const MsgSubmitQueryResponseResponse();

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

  factory MsgSubmitQueryResponseResponse.fromJson(Map<String, dynamic> json) {
    return MsgSubmitQueryResponseResponse();
  }

  factory MsgSubmitQueryResponseResponse.deserialize(List<int> bytes) {
    return MsgSubmitQueryResponseResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideInterchainqueryV1MsgSubmitQueryResponseResponse;
}
