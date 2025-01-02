import 'package:cosmos_sdk/src/crypto/multisig_v1beta1/compact_bitarray.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_signing_v1beta1/messages/sign_mode.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';

/// ModeInfo describes the signing mode of a single or nested multisig signer.
class ModeInfo extends CosmosMessage {
  final ModeInfoMode mode;
  const ModeInfo(this.mode);
  factory ModeInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    final List<int>? singleMode = decode.getField(1);
    if (singleMode != null) {
      return ModeInfo(ModeInfoSignle.deserialize(singleMode));
    }
    final List<int>? multiMode = decode.getField(2);
    if (multiMode != null) {
      return ModeInfo.deserialize(multiMode);
    }
    throw const DartCosmosSdkPluginException("Invalid mode info bytes.");
  }
  factory ModeInfo.fromRpc(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
  @override
  List<int> get fieldIds => [mode.id];

  @override
  Map<String, dynamic> toJson() {
    return {"mode": mode.toJson()};
  }

  @override
  TypeUrl get typeUrl => TxV1beta1Types.modeInfo;
  @override
  List get values => [mode];
}

abstract class ModeInfoMode extends CosmosMessage {
  const ModeInfoMode();
  abstract final int id;
}

/// Single is the mode info for a single signer.
/// It is structured as a message to allow for additional
/// fields such as locale for SIGN_MODE_TEXTUAL in the future
class ModeInfoSignle extends ModeInfoMode {
  /// mode is the signing mode of the single signer
  final SignMode mode;
  const ModeInfoSignle(this.mode);
  factory ModeInfoSignle.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ModeInfoSignle(SignMode.fromValue(decode.getField(1)));
  }
  factory ModeInfoSignle.fromRpc(Map<String, dynamic> json) {
    return ModeInfoSignle(SignMode.fromName(json["mode"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"mode": mode.value};
  }

  @override
  List get values => [mode];

  @override
  int get id => 1;
  @override
  TypeUrl get typeUrl => TxV1beta1Types.modeInfoSingle;
}

/// Multi is the mode info for a multisig public key
class ModeInfoMulti extends ModeInfoMode {
  /// bitarray specifies which keys within the multisig are signing
  final CompactBitArray bitarray;

  /// mode_infos is the corresponding modes of the signers of the multisig
  /// which could include nested multisig public keys
  final List<ModeInfo> modeInfos;
  ModeInfoMulti({required this.bitarray, required List<ModeInfo> modeInfos})
      : modeInfos = List<ModeInfo>.unmodifiable(modeInfos);
  factory ModeInfoMulti.fromValue(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ModeInfoMulti(
        bitarray: CompactBitArray.deserialize(decode.getField(1)),
        modeInfos: (decode.getField(2) as List)
            .map((e) => ModeInfo.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "bitarray": bitarray.toJson(),
      "mode_infos": modeInfos.map((e) => e.toJson()).toList()
    };
  }

  @override
  List get values => [bitarray, modeInfos];

  @override
  int get id => 2;
  @override
  TypeUrl get typeUrl => TxV1beta1Types.modeInfoMulti;
}
