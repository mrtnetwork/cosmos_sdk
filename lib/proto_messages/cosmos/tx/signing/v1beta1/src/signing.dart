import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/cosmos/crypto/multisig/v1beta1/src/multisig.dart"
    as cosmos_crypto_multisig_v1beta1_multisig;

/// SignMode represents a signing mode with its own security guarantees.
///
/// This enum should be considered a registry of all known sign modes
/// in the Cosmos ecosystem. Apps are not expected to support all known
/// sign modes. Apps that would like to support custom  sign modes are
/// encouraged to open a small PR against this file to add a new case
/// to this SignMode enum describing their sign mode so that different
/// apps have a consistent version of this enum.
enum SignMode implements ProtoEnumVariant {
  /// SIGN_MODE_UNSPECIFIED specifies an unknown signing mode and will be
  /// rejected.
  signModeUnspecified(0, 'SIGN_MODE_UNSPECIFIED'),

  /// SIGN_MODE_DIRECT specifies a signing mode which uses SignDoc and is
  /// verified with raw bytes from Tx.
  signModeDirect(1, 'SIGN_MODE_DIRECT'),

  /// SIGN_MODE_TEXTUAL is a future signing mode that will verify some
  /// human-readable textual representation on top of the binary representation
  /// from SIGN_MODE_DIRECT.
  ///
  /// Since: cosmos-sdk 0.50
  signModeTextual(2, 'SIGN_MODE_TEXTUAL'),

  /// SIGN_MODE_DIRECT_AUX specifies a signing mode which uses
  /// SignDocDirectAux. As opposed to SIGN_MODE_DIRECT, this sign mode does not
  /// require signers signing over other signers' `signer_info`.
  ///
  /// Since: cosmos-sdk 0.46
  signModeDirectAux(3, 'SIGN_MODE_DIRECT_AUX'),

  /// SIGN_MODE_LEGACY_AMINO_JSON is a backwards compatibility mode which uses
  /// Amino JSON and will be removed in the future.
  signModeLegacyAminoJson(127, 'SIGN_MODE_LEGACY_AMINO_JSON'),

  /// SIGN_MODE_EIP_191 specifies the sign mode for EIP 191 signing on the Cosmos
  /// SDK. Ref: https://eips.ethereum.org/EIPS/eip-191
  ///
  /// Currently, SIGN_MODE_EIP_191 is registered as a SignMode enum variant,
  /// but is not implemented on the SDK by default. To enable EIP-191, you need
  /// to pass a custom `TxConfig` that has an implementation of
  /// `SignModeHandler` for EIP-191. The SDK may decide to fully support
  /// EIP-191 in the future.
  ///
  /// Since: cosmos-sdk 0.45.2
  signModeEip191(191, 'SIGN_MODE_EIP_191');

  const SignMode(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static SignMode fromValue(int? value) {
    return SignMode.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ItemNotFoundException(name: "SignMode", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static SignMode from(Object? value) {
    return SignMode.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse: () => throw ItemNotFoundException(name: "SignMode", value: value),
    );
  }
}

/// SignatureDescriptors wraps multiple SignatureDescriptor's.
class SignatureDescriptors extends CosmosProtoMessage {
  /// signatures are the signature descriptors
  final List<SignatureDescriptor> signatures;

  const SignatureDescriptors({this.signatures = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [signatures];

  @override
  Map<String, dynamic> toJson() {
    return {'signatures': signatures.map((e) => e.toJson()).toList()};
  }

  factory SignatureDescriptors.fromJson(Map<String, dynamic> json) {
    return SignatureDescriptors(
      signatures:
          (json.valueEnsureAsList<dynamic>('signatures', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  SignatureDescriptor,
                  Map<String, dynamic>
                >(value: e, parse: (v) => SignatureDescriptor.fromJson(v)),
              )
              .toList(),
    );
  }

  factory SignatureDescriptors.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SignatureDescriptors(
      signatures:
          decode
              .getListOfBytes(1)
              .map((b) => SignatureDescriptor.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxSigningV1beta1SignatureDescriptors;
}

/// SignatureDescriptor is a convenience type which represents the full data for
/// a signature including the public key of the signer, signing modes and the
/// signature itself. It is primarily used for coordinating signatures between
/// clients.
class SignatureDescriptor extends CosmosProtoMessage {
  /// public_key is the public key of the signer
  final google_protobuf_any.Any? publicKey;

  final SignatureDescriptorData? data;

  /// sequence is the sequence of the account, which describes the
  /// number of committed transactions signed by a given address. It is used to prevent
  /// replay attacks.
  final BigInt? sequence;

  const SignatureDescriptor({this.publicKey, this.data, this.sequence});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [publicKey, data, sequence];

  @override
  Map<String, dynamic> toJson() {
    return {
      'public_key': publicKey?.toJson(),
      'data': data?.toJson(),
      'sequence': sequence?.toString(),
    };
  }

  factory SignatureDescriptor.fromJson(Map<String, dynamic> json) {
    return SignatureDescriptor(
      publicKey: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'public_key',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
      data: json.valueTo<SignatureDescriptorData?, Map<String, dynamic>>(
        key: 'data',
        parse: (v) => SignatureDescriptorData.fromJson(v),
        acceptCamelCase: true,
      ),
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
    );
  }

  factory SignatureDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SignatureDescriptor(
      publicKey: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      data: decode.messageTo<SignatureDescriptorData?>(
        2,
        (b) => SignatureDescriptorData.deserialize(b),
      ),
      sequence: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxSigningV1beta1SignatureDescriptor;
}

/// Data represents signature data
class SignatureDescriptorData extends CosmosProtoMessage {
  /// sum is the oneof that specifies whether this represents single or multi-signature data
  /// single represents a single signer
  final SignatureDescriptorDataSingle? single;

  /// multi represents a multisig signer
  final SignatureDescriptorDataMulti? multi;

  const SignatureDescriptorData({this.single, this.multi});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [single, multi];

  @override
  Map<String, dynamic> toJson() {
    return {'single': single?.toJson(), 'multi': multi?.toJson()};
  }

  factory SignatureDescriptorData.fromJson(Map<String, dynamic> json) {
    return SignatureDescriptorData(
      single: json
          .valueTo<SignatureDescriptorDataSingle?, Map<String, dynamic>>(
            key: 'single',
            parse: (v) => SignatureDescriptorDataSingle.fromJson(v),
            acceptCamelCase: true,
          ),
      multi: json.valueTo<SignatureDescriptorDataMulti?, Map<String, dynamic>>(
        key: 'multi',
        parse: (v) => SignatureDescriptorDataMulti.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory SignatureDescriptorData.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SignatureDescriptorData(
      single: decode.messageTo<SignatureDescriptorDataSingle?>(
        1,
        (b) => SignatureDescriptorDataSingle.deserialize(b),
      ),
      multi: decode.messageTo<SignatureDescriptorDataMulti?>(
        2,
        (b) => SignatureDescriptorDataMulti.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosTxSigningV1beta1SignatureDescriptorData;
}

/// Single is the signature data for a single signer
class SignatureDescriptorDataSingle extends CosmosProtoMessage {
  /// mode is the signing mode of the single signer
  final SignMode? mode;

  /// signature is the raw signature bytes
  final List<int>? signature;

  const SignatureDescriptorDataSingle({this.mode, this.signature});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.enumType(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [mode, signature];

  @override
  Map<String, dynamic> toJson() {
    return {
      'mode': mode?.protoName,
      'signature': switch (signature) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory SignatureDescriptorDataSingle.fromJson(Map<String, dynamic> json) {
    return SignatureDescriptorDataSingle(
      mode: json.valueTo<SignMode?, Object?>(
        key: 'mode',
        parse: (v) => SignMode.from(v),
      ),
      signature: json.valueAsBytes<List<int>?>(
        'signature',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory SignatureDescriptorDataSingle.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SignatureDescriptorDataSingle(
      mode: decode.getEnum<SignMode?>(1, SignMode.values),
      signature: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosTxSigningV1beta1SignatureDescriptorDataSingle;
}

/// Multi is the signature data for a multisig public key
class SignatureDescriptorDataMulti extends CosmosProtoMessage {
  /// bitarray specifies which keys within the multisig are signing
  final cosmos_crypto_multisig_v1beta1_multisig.CompactBitArray? bitarray;

  /// signatures is the signatures of the multi-signature
  final List<SignatureDescriptorData> signatures;

  const SignatureDescriptorDataMulti({
    this.bitarray,
    this.signatures = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [bitarray, signatures];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bitarray': bitarray?.toJson(),
      'signatures': signatures.map((e) => e.toJson()).toList(),
    };
  }

  factory SignatureDescriptorDataMulti.fromJson(Map<String, dynamic> json) {
    return SignatureDescriptorDataMulti(
      bitarray: json.valueTo<
        cosmos_crypto_multisig_v1beta1_multisig.CompactBitArray?,
        Map<String, dynamic>
      >(
        key: 'bitarray',
        parse:
            (v) => cosmos_crypto_multisig_v1beta1_multisig
                .CompactBitArray.fromJson(v),
        acceptCamelCase: true,
      ),
      signatures:
          (json.valueEnsureAsList<dynamic>('signatures', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  SignatureDescriptorData,
                  Map<String, dynamic>
                >(value: e, parse: (v) => SignatureDescriptorData.fromJson(v)),
              )
              .toList(),
    );
  }

  factory SignatureDescriptorDataMulti.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SignatureDescriptorDataMulti(
      bitarray: decode
          .messageTo<cosmos_crypto_multisig_v1beta1_multisig.CompactBitArray?>(
            1,
            (b) => cosmos_crypto_multisig_v1beta1_multisig
                .CompactBitArray.deserialize(b),
          ),
      signatures:
          decode
              .getListOfBytes(2)
              .map((b) => SignatureDescriptorData.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosTxSigningV1beta1SignatureDescriptorDataMulti;
}
