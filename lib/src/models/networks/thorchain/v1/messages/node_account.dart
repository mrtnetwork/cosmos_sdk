import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainNodeAccount extends CosmosMessage {
  final List<int>? nodeAddress;
  final ThorchainNodeStatus? status;
  final ThorchainPubKeySet pubKeySet;
  final String? validatorConsPubKey;
  final BigInt bond;
  final BigInt? activeBlockHeight;
  final String? bondAddress;
  final BigInt? statusSince;
  final List<String>? signerMembership;
  final bool? requestedToLeave;
  final bool? forcedToLeave;
  final BigInt? leaveScore;
  final String? ipAddress;
  final String? version;
  final ThorchainNodeType? type;
  ThorchainNodeAccount(
      {List<int>? nodeAddress,
      this.status,
      required this.pubKeySet,
      this.validatorConsPubKey,
      required this.bond,
      this.activeBlockHeight,
      this.bondAddress,
      this.statusSince,
      List<String>? signerMembership,
      this.requestedToLeave,
      this.forcedToLeave,
      this.leaveScore,
      this.ipAddress,
      this.version,
      this.type})
      : nodeAddress = BytesUtils.tryToBytes(nodeAddress, unmodifiable: true),
        signerMembership = signerMembership?.nullOnEmpy;
  factory ThorchainNodeAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainNodeAccount(
        nodeAddress: decode.getField(1),
        status: decode.getResult(2)?.to<ThorchainNodeStatus, int>(
            (e) => ThorchainNodeStatus.fromValue(e)),
        pubKeySet: ThorchainPubKeySet.deserialize(decode.getField(3)),
        validatorConsPubKey: decode.getField(4),
        bond: BigInt.parse(decode.getField(5)),
        activeBlockHeight: decode.getField(6),
        bondAddress: decode.getField(7),
        statusSince: decode.getField(8),
        signerMembership: decode.getFields(9),
        requestedToLeave: decode.getField(10),
        forcedToLeave: decode.getField(11),
        leaveScore: decode.getField(12),
        ipAddress: decode.getField(13),
        version: decode.getField(14),
        type: decode.getResult(15)?.to<ThorchainNodeType, int>(
            (e) => ThorchainNodeType.fromValue(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

  @override
  Map<String, dynamic> toJson() {
    return {
      "node_address": BytesUtils.tryToHexString(nodeAddress),
      "status": status?.value,
      "pub_key_set": pubKeySet.toJson(),
      "validator_cons_pub_key": validatorConsPubKey,
      "bond": bond.toString(),
      "active_block_height": activeBlockHeight?.toString(),
      "bond_address": bondAddress,
      "status_since": statusSince?.toString(),
      "signer_membership": signerMembership,
      "requested_to_leave": requestedToLeave,
      "forced_to_leave": forcedToLeave,
      "leave_score": leaveScore?.toString(),
      "ip_address": ipAddress,
      "version": version,
      "type": type?.value
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.nodeAccount.typeUrl;

  @override
  List get values => [
        nodeAddress,
        status?.value,
        pubKeySet,
        validatorConsPubKey,
        bond.toString(),
        activeBlockHeight,
        bondAddress,
        statusSince,
        signerMembership,
        requestedToLeave,
        forcedToLeave,
        leaveScore,
        ipAddress,
        version,
        type?.value
      ];
}
