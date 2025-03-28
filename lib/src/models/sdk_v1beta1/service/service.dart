import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_authz_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_crisis_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_crisis_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_vesting_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

abstract class CosmosSDKService<T extends CosmosMessage>
    extends ServiceMessage<T> {
  const CosmosSDKService();
  static const String root = "/cosmos";
  static T? fromJson<T extends ServiceMessage>(
      {required String typeUrl, required Map<String, dynamic> json}) {
    final String root = CosmosUtils.extractServiceRoot(typeUrl);
    final ServiceMessage? service = switch (root) {
      AuthV1beta1Types.root =>
        AuthzV1Beta1Service.fromJson(typeUrl: typeUrl, json: json),
      AuthzV1beta1Types.root =>
        AuthzV1Beta1Service.fromJson(typeUrl: typeUrl, json: json),
      BankV1beta1Types.root =>
        BankV1Beta1Service.fromJson(typeUrl: typeUrl, json: json),
      CrisisV1beta1.root =>
        CrisisV1Beta1Service.fromJson(typeUrl: typeUrl, json: json),
      DistributionV1beta1Types.root =>
        DistributionV1Beta1Service.fromJson(typeUrl: typeUrl, json: json),
      FeegrantV1beta1Types.root =>
        FeeGrantV1Beta1Service.fromJson(typeUrl: typeUrl, json: json),
      GovV1beta1types.root =>
        GovV1Beta1Service.fromJson(typeUrl: typeUrl, json: json),
      SlashingV1beta1Types.root =>
        SlashingV1Beta1Service.fromJson(typeUrl: typeUrl, json: json),
      MintV1beta1Types.root =>
        MintV1Beta1Service.fromJson(typeUrl: typeUrl, json: json),
      NFTV1beta1Types.root =>
        NFTV1Beta1Service.fromJson(typeUrl: typeUrl, json: json),
      StakingV1beta1Types.root =>
        StakingV1Beta1Service.fromJson(typeUrl: typeUrl, json: json),
      UpgradeV1beta1Types.root =>
        UpgradeV1Beta1Service.fromJson(typeUrl: typeUrl, json: json),
      VestingV1beta1Types.root =>
        VestingV1Beta1Service.fromJson(typeUrl: typeUrl, json: json),
      _ => null,
    };
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid CosmosSDK Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }

  static T? deserialize<T extends ServiceMessage>(
      {required String typeUrl, required List<int> bytes}) {
    final String root = CosmosUtils.extractServiceRoot(typeUrl);
    final ServiceMessage? service = switch (root) {
      AuthV1beta1Types.root =>
        AuthzV1Beta1Service.deserialize(typeUrl: typeUrl, bytes: bytes),
      AuthzV1beta1Types.root =>
        AuthzV1Beta1Service.deserialize(typeUrl: typeUrl, bytes: bytes),
      BankV1beta1Types.root =>
        BankV1Beta1Service.deserialize(typeUrl: typeUrl, bytes: bytes),
      CrisisV1beta1.root =>
        CrisisV1Beta1Service.deserialize(typeUrl: typeUrl, bytes: bytes),
      DistributionV1beta1Types.root =>
        DistributionV1Beta1Service.deserialize(typeUrl: typeUrl, bytes: bytes),
      FeegrantV1beta1Types.root =>
        FeeGrantV1Beta1Service.deserialize(typeUrl: typeUrl, bytes: bytes),
      GovV1beta1types.root =>
        GovV1Beta1Service.deserialize(typeUrl: typeUrl, bytes: bytes),
      SlashingV1beta1Types.root =>
        SlashingV1Beta1Service.deserialize(typeUrl: typeUrl, bytes: bytes),
      MintV1beta1Types.root =>
        MintV1Beta1Service.deserialize(typeUrl: typeUrl, bytes: bytes),
      NFTV1beta1Types.root =>
        NFTV1Beta1Service.deserialize(typeUrl: typeUrl, bytes: bytes),
      StakingV1beta1Types.root =>
        StakingV1Beta1Service.deserialize(typeUrl: typeUrl, bytes: bytes),
      UpgradeV1beta1Types.root =>
        UpgradeV1Beta1Service.deserialize(typeUrl: typeUrl, bytes: bytes),
      VestingV1beta1Types.root =>
        VestingV1Beta1Service.deserialize(typeUrl: typeUrl, bytes: bytes),
      _ => null,
    };
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid CosmosSDK Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }
}
