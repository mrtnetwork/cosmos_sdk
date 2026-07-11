import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// TakerFeeShareAgreement represents the agreement between the Osmosis protocol
/// and a specific denom to share a certain percent of taker fees generated in
/// any route that contains said denom. For example, if the agreement specifies a
/// 10% skim_percent, this means 10% of the taker fees generated in a swap route
/// containing the specified denom will be sent to the address specified
/// in the skim_address field at the end of each epoch. These skim_percents are
/// additive, so if three taker fee agreements have skim percents of 10%, 20%,
/// and 30%, the total skim percent for the route will be 60%.
class TakerFeeShareAgreement extends CosmosProtoMessage {
  /// denom is the denom that has the taker fee share agreement.
  final String? denom;

  /// skim_percent is the percentage of taker fees that will be skimmed for the
  /// denom, in the event that the denom is included in the swap route.
  final String? skimPercent;

  /// skim_address is the address belonging to the respective denom
  /// that the skimmed taker fees will be sent to at the end of each epoch.
  final String? skimAddress;

  const TakerFeeShareAgreement({
    this.denom,
    this.skimPercent,
    this.skimAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denom, skimPercent, skimAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'denom': denom,
      'skim_percent': skimPercent,
      'skim_address': skimAddress,
    };
  }

  factory TakerFeeShareAgreement.fromJson(Map<String, dynamic> json) {
    return TakerFeeShareAgreement(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      skimPercent: json.valueAsString<String?>(
        'skim_percent',
        acceptCamelCase: true,
      ),
      skimAddress: json.valueAsString<String?>(
        'skim_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory TakerFeeShareAgreement.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TakerFeeShareAgreement(
      denom: decode.getString<String?>(1),
      skimPercent: decode.getString<String?>(2),
      skimAddress: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisPoolmanagerV1beta1TakerFeeShareAgreement;
}

/// TakerFeeSkimAccumulator accumulates the total skimmed taker fees for each
/// denom that has a taker fee share agreement.
class TakerFeeSkimAccumulator extends CosmosProtoMessage {
  /// denom is the denom that has the taker fee share agreement.
  final String? denom;

  /// skimmed_taker_fees is the total skimmed taker fees for the denom.
  final List<cosmos_base_v1beta1_coin.Coin> skimmedTakerFees;

  const TakerFeeSkimAccumulator({this.denom, this.skimmedTakerFees = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denom, skimmedTakerFees];

  @override
  Map<String, dynamic> toJson() {
    return {
      'denom': denom,
      'skimmed_taker_fees': skimmedTakerFees.map((e) => e.toJson()).toList(),
    };
  }

  factory TakerFeeSkimAccumulator.fromJson(Map<String, dynamic> json) {
    return TakerFeeSkimAccumulator(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      skimmedTakerFees:
          (json.valueEnsureAsList<dynamic>(
                'skimmed_taker_fees',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory TakerFeeSkimAccumulator.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TakerFeeSkimAccumulator(
      denom: decode.getString<String?>(1),
      skimmedTakerFees:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1TakerFeeSkimAccumulator;
}

/// AlloyContractTakerFeeShareState contains the contract address of the alloyed
/// asset pool, along with the adjusted taker fee share agreements for any asset
/// within the alloyed asset pool that has a taker fee share agreement. If for
/// instance there are two denoms, and denomA makes up 50 percent and denomB
/// makes up 50 percent, and denom A has a taker fee share agreement with a skim
/// percent of 10%, then the adjusted taker fee share agreement for denomA will
/// be 5%.
class AlloyContractTakerFeeShareState extends CosmosProtoMessage {
  /// contract_address is the address of the alloyed asset pool contract.
  final String? contractAddress;

  /// taker_fee_share_agreements is the adjusted taker fee share agreements for
  /// any asset within the alloyed asset pool that has a taker fee share
  /// agreement.
  final List<TakerFeeShareAgreement> takerFeeShareAgreements;

  const AlloyContractTakerFeeShareState({
    this.contractAddress,
    this.takerFeeShareAgreements = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [contractAddress, takerFeeShareAgreements];

  @override
  Map<String, dynamic> toJson() {
    return {
      'contract_address': contractAddress,
      'taker_fee_share_agreements':
          takerFeeShareAgreements.map((e) => e.toJson()).toList(),
    };
  }

  factory AlloyContractTakerFeeShareState.fromJson(Map<String, dynamic> json) {
    return AlloyContractTakerFeeShareState(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
      takerFeeShareAgreements:
          (json.valueEnsureAsList<dynamic>(
                'taker_fee_share_agreements',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  TakerFeeShareAgreement,
                  Map<String, dynamic>
                >(value: e, parse: (v) => TakerFeeShareAgreement.fromJson(v)),
              )
              .toList(),
    );
  }

  factory AlloyContractTakerFeeShareState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AlloyContractTakerFeeShareState(
      contractAddress: decode.getString<String?>(1),
      takerFeeShareAgreements:
          decode
              .getListOfBytes(2)
              .map((b) => TakerFeeShareAgreement.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisPoolmanagerV1beta1AlloyContractTakerFeeShareState;
}
