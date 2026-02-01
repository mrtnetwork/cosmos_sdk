import 'package:blockchain_utils/utils/numbers/utils/bigint_utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/mode_info.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// SignerInfo describes the public key and signing mode of a single top-level signer.
class SignerInfo extends CosmosMessage {
  /// public_key is the public key of the signer. It is optional for accounts
  /// that already exist in state. If unset, the verifier can use the required
  /// signer address for this position and lookup the public key.
  final Any publicKey;

  /// mode_info describes the signing mode of the signer and is a nested
  /// structure to support nested multisig pubkey's
  final ModeInfo modeInfo;

  /// sequence is the sequence of the account, which describes the
  /// number of committed transactions signed by a given address. It is used to
  /// prevent replay attacks.
  final BigInt sequence;
  SignerInfo({
    required this.publicKey,
    required this.modeInfo,
    required this.sequence,
  });
  factory SignerInfo.fromJson(Map<String, dynamic> json) {
    return SignerInfo(
      publicKey: Any.fromJson(json["public_key"]),
      modeInfo: ModeInfo.fromJson(json["mode_info"]),
      sequence: BigintUtils.parse(json["sequence"]),
    );
  }

  factory SignerInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SignerInfo(
      publicKey: Any.deserialize(decode.getField(1)),
      modeInfo: ModeInfo.deserialize(decode.getField(2)),
      sequence: decode.getField<BigInt?>(3) ?? BigInt.zero,
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "public_key": publicKey.toJson(),
      "mode_info": modeInfo.toJson(),
      "sequence": sequence.toString(),
    };
  }

  @override
  List get values => [
    publicKey,
    modeInfo,
    sequence == BigInt.zero ? null : sequence,
  ];
  @override
  TypeUrl get typeUrl => TxV1beta1Types.signerInfo;

  SignerInfo copyWith({Any? publicKey, ModeInfo? modeInfo, BigInt? sequence}) {
    return SignerInfo(
      publicKey: publicKey ?? this.publicKey,
      modeInfo: modeInfo ?? this.modeInfo,
      sequence: sequence ?? this.sequence,
    );
  }
}
