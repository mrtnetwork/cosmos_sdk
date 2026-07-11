import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/tendermint/types/src/types.dart"
    as tendermint_types_types;
import "package:cosmos_sdk/proto_messages/tendermint/types/src/evidence.dart"
    as tendermint_types_evidence;

class Block extends CosmosProtoMessage {
  final tendermint_types_types.Header? header;

  final tendermint_types_types.Data? data;

  final tendermint_types_evidence.EvidenceList? evidence;

  final tendermint_types_types.Commit? lastCommit;

  const Block({this.header, this.data, this.evidence, this.lastCommit});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.message(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [header, data, evidence, lastCommit];

  @override
  Map<String, dynamic> toJson() {
    return {
      'header': header?.toJson(),
      'data': data?.toJson(),
      'evidence': evidence?.toJson(),
      'last_commit': lastCommit?.toJson(),
    };
  }

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
      header: json
          .valueTo<tendermint_types_types.Header?, Map<String, dynamic>>(
            key: 'header',
            parse: (v) => tendermint_types_types.Header.fromJson(v),
            acceptCamelCase: true,
          ),
      data: json.valueTo<tendermint_types_types.Data?, Map<String, dynamic>>(
        key: 'data',
        parse: (v) => tendermint_types_types.Data.fromJson(v),
        acceptCamelCase: true,
      ),
      evidence: json.valueTo<
        tendermint_types_evidence.EvidenceList?,
        Map<String, dynamic>
      >(
        key: 'evidence',
        parse: (v) => tendermint_types_evidence.EvidenceList.fromJson(v),
        acceptCamelCase: true,
      ),
      lastCommit: json
          .valueTo<tendermint_types_types.Commit?, Map<String, dynamic>>(
            key: 'last_commit',
            parse: (v) => tendermint_types_types.Commit.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory Block.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Block(
      header: decode.messageTo<tendermint_types_types.Header?>(
        1,
        (b) => tendermint_types_types.Header.deserialize(b),
      ),
      data: decode.messageTo<tendermint_types_types.Data?>(
        2,
        (b) => tendermint_types_types.Data.deserialize(b),
      ),
      evidence: decode.messageTo<tendermint_types_evidence.EvidenceList?>(
        3,
        (b) => tendermint_types_evidence.EvidenceList.deserialize(b),
      ),
      lastCommit: decode.messageTo<tendermint_types_types.Commit?>(
        4,
        (b) => tendermint_types_types.Commit.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesBlock;
}
