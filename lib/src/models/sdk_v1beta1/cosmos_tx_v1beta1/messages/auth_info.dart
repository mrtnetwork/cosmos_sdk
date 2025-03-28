import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/fee.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/signer_info.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/tip.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// AuthInfo describes the fee and signer modes that are used to sign a transaction.
class AuthInfo extends CosmosMessage {
  /// signer_infos defines the signing modes for the required signers. The number
  /// and order of elements must match the required signers from TxBody's
  /// messages. The first element is the primary signer and the one which pays
  /// the fee.
  final List<SignerInfo> signerInfos;

  /// Fee is the fee and gas limit for the transaction. The first signer is the
  /// primary signer and the one which pays the fee. The fee can be calculated
  /// based on the cost of evaluating the body and doing signature verification
  /// of the signers. This can be estimated via simulation.
  final Fee fee;

  /// Tip is the optional tip used for transactions fees paid in another denom.
  ///
  /// This field is ignored if the chain didn't enable tips, i.e. didn't add the
  /// `TipDecorator` in its posthandler.
  ///
  /// Since: cosmos-sdk 0.46
  final Tip? tip;
  factory AuthInfo.fromJson(Map<String, dynamic> json) {
    return AuthInfo(
        signerInfos: (json["signer_infos"] as List?)
                ?.map((e) => SignerInfo.fromJson(e))
                .toList() ??
            [],
        fee: Fee.fromJson(json["fee"]),
        tip: json["tip"] == null ? null : Tip.fromJson(json["tip"]));
  }
  AuthInfo({required List<SignerInfo> signerInfos, required this.fee, this.tip})
      : signerInfos = List<SignerInfo>.unmodifiable(signerInfos);

  factory AuthInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);

    return AuthInfo(
        signerInfos: decode
            .getFields<List<int>>(1)
            .map((e) => SignerInfo.deserialize(e))
            .toList(),
        fee: Fee.deserialize(decode.getField(2)),
        tip:
            decode.getResult(3)?.to<Tip, List<int>>((e) => Tip.deserialize(e)));
  }

  AuthInfo copyWith({
    List<SignerInfo>? signerInfos,
    Fee? fee,
    Tip? tip,
  }) {
    return AuthInfo(
      signerInfos: signerInfos ?? this.signerInfos,
      fee: fee ?? this.fee,
      tip: tip ?? this.tip,
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "signer_infos": signerInfos.map((e) => e.toJson()).toList(),
      "fee": fee.toJson(),
      "tip": tip?.toJson()
    };
  }

  @override
  List get values => [signerInfos, fee, tip];

  @override
  TypeUrl get typeUrl => TxV1beta1Types.authInfo;
}
