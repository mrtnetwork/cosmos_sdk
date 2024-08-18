import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'vault_pubkey_info.dart';

class ThorVaultPubkeysInfoResponse {
  final List<VaultPubKeyInfo> asgard;
  final List<VaultPubKeyInfo> yggdrasil;
  final List<VaultPubKeyInfo> inactive;

  ThorVaultPubkeysInfoResponse({
    required List<VaultPubKeyInfo> asgard,
    required List<VaultPubKeyInfo> yggdrasil,
    required List<VaultPubKeyInfo> inactive,
  })  : asgard = asgard.immutable,
        yggdrasil = yggdrasil.immutable,
        inactive = inactive.immutable;

  factory ThorVaultPubkeysInfoResponse.fromJson(Map<String, dynamic> json) {
    return ThorVaultPubkeysInfoResponse(
      asgard: (json['asgard'] as List<dynamic>)
          .map((categoryJson) => VaultPubKeyInfo.fromJson(categoryJson))
          .toList(),
      yggdrasil: (json['yggdrasil'] as List<dynamic>)
          .map((categoryJson) => VaultPubKeyInfo.fromJson(categoryJson))
          .toList(),
      inactive: (json['inactive'] as List<dynamic>)
          .map((categoryJson) => VaultPubKeyInfo.fromJson(categoryJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'asgard': asgard.map((category) => category.toJson()).toList(),
      'yggdrasil': yggdrasil.map((category) => category.toJson()).toList(),
      'inactive': inactive.map((category) => category.toJson()).toList(),
    };
  }
}
