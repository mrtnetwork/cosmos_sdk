import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// MerklePath is the path used to verify commitment proofs, which can be an
/// arbitrary structured object (defined by a commitment type).
/// ICS-23 verification supports membership proofs for nested merkle trees.
/// The ICS-24 standard provable keys MUST be stored in the lowest level tree with an optional prefix.
/// The IC24 provable tree may then be stored in a higher level tree(s) that hash up to the root hash
/// stored in the consensus state of the client.
/// Each element of the path represents the key of a merkle tree from the root to the leaf.
/// The elements of the path before the final element must be the path to the tree that contains
/// the ICS24 provable store. Thus, it should remain constant for all ICS24 proofs.
/// The final element of the path is the key of the leaf in the ICS24 provable store,
/// Thus IBC core will append the ICS24 path to the final element of the MerklePath
/// stored in the counterparty to create the full path to the leaf for proof verification.
/// Examples:
/// Cosmos SDK:
/// The Cosmos SDK commits to a multi-tree where each store is an IAVL tree and all store hashes
/// are hashed in a simple merkle tree to get the final root hash. Thus, the MerklePath in the counterparty
/// MerklePrefix has the following structure: ["ibc", ""]
/// The core IBC handler will append the ICS24 path to the final element of the MerklePath
/// like so: ["ibc", "{packetCommitmentPath}"] which will then be used for final verification.
/// Ethereum:
/// The Ethereum client commits to a single Patricia merkle trie. The ICS24 provable store is managed
/// by the smart contract state. Each smart contract has a specific prefix reserved within the global trie.
/// Thus the MerklePath in the counterparty is the prefix to the smart contract state in the global trie.
/// Since there is only one tree in the commitment structure of ethereum the MerklePath in the counterparty
/// MerklePrefix has the following structure: ["IBCCoreContractAddressStoragePrefix"]
/// The core IBC handler will append the ICS24 path to the final element of the MerklePath
/// like so: ["IBCCoreContractAddressStoragePrefix{packetCommitmentPath}"] which will then be used for final
/// verification. Thus the MerklePath in the counterparty MerklePrefix is the nested key path from the root hash of the
/// consensus state down to the ICS24 provable store. The IBC handler retrieves the counterparty key path to the ICS24
/// provable store from the MerklePath and appends the ICS24 path to get the final key path to the value being verified
/// by the client against the root hash in the client's consensus state.
class MerklePath extends CosmosProtoMessage {
  final List<List<int>> keyPath;

  const MerklePath({this.keyPath = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [keyPath];

  @override
  Map<String, dynamic> toJson() {
    return {
      'key_path':
          keyPath
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory MerklePath.fromJson(Map<String, dynamic> json) {
    return MerklePath(
      keyPath:
          (json.valueEnsureAsList<dynamic>('key_path', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
    );
  }

  factory MerklePath.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MerklePath(keyPath: decode.getListOfBytes(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreCommitmentV2MerklePath;
}
