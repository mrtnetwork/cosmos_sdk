import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';
import 'package:blockchain_utils/exception/exception.dart';

/// SignMode represents a signing mode with its own security guarantees.

/// This enum should be considered a registry of all known sign modes in the Cosmos ecosystem.
/// Apps are not expected to support all known sign modes. Apps that would like to support custom
/// sign modes are encouraged to open a small PR against this file to add a new case to this SignMode
/// enum describing their sign mode so that different apps have a consistent version of this enum.
class SignMode implements CosmosEnum {
  @override
  final int value;
  @override
  final String name;
  const SignMode._(this.value, this.name);

  /// sign-mode-unspecified specifies an unknown signing mode and will be
  /// rejected.
  static const SignMode signModeUnspecified =
      SignMode._(0, "signModeUnspecified");

  /// sign-mode-direct specifies a signing mode which uses SignDoc and is
  /// verified with raw bytes from Tx.
  static const SignMode signModeDirect = SignMode._(1, "signModeDirect");

  /// sign-mode-textual is a future signing mode that will verify some
  /// human-readable textual representation on top of the binary representation
  /// from sign-mode-direct.
  ///
  /// Since: cosmos-sdk 0.50
  static const SignMode signModeTextual = SignMode._(2, "signModeTextual");

  /// sign-mode-direct-aux specifies a signing mode which uses
  /// SignDocDirectAux. As opposed to sign-mode-direct, this sign mode does not
  /// require signers signing over other signers' `signer_info`.
  ///
  /// Since: cosmos-sdk 0.46
  static const SignMode signModeDirectAux = SignMode._(3, "signModeDirectAux");

  /// sign-mode-legacy-amino-json is a backwards compatibility mode which uses
  /// Amino JSON and will be removed in the future.
  static const SignMode signModeLegacyAminoJson =
      SignMode._(127, "signModeLegacyAminoJson");

  /// sign-mode-eip-191 specifies the sign mode for EIP 191 signing on the Cosmos
  /// SDK. Ref: https://eips.ethereum.org/EIPS/eip-191
  ///
  /// Currently, sign-mode-eip-191 is registered as a SignMode enum variant,
  /// but is not implemented on the SDK by default. To enable EIP-191, you need
  /// to pass a custom `TxConfig` that has an implementation of
  /// `SignModeHandler` for EIP-191. The SDK may decide to fully support
  /// EIP-191 in the future.
  ///
  /// Since: cosmos-sdk 0.45.2
  /// Deprecated: post 0.47.x Sign mode refers to a method of encoding string data for
  /// signing, but in the SDK, it also refers to how to encode a transaction into a string.
  /// This opens the possibility for additional EIP191 sign modes, like sign-mode-eip-191-textual,
  /// sign-mode-eip-191-legacy-json, and more.
  /// Each new EIP191 sign mode should be accompanied by an associated ADR.
  static const SignMode signModeEip191 = SignMode._(191, "signModeEip191");

  static const List<SignMode> values = [
    signModeUnspecified,
    signModeDirect,
    signModeTextual,
    signModeDirectAux,
    signModeLegacyAminoJson,
    signModeEip191
  ];

  static SignMode fromValue(int? value) {
    return values.firstWhere(
      (element) => element.value == value,
      orElse: () => throw MessageException(
          "No matching element found for the given value.",
          details: {"value": value}),
    );
  }
}
