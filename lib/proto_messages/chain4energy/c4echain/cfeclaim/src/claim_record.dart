import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

class UserEntry extends CosmosProtoMessage {
  final String? address;

  final List<ClaimRecord> claimRecords;

  const UserEntry({this.address, this.claimRecords = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, claimRecords];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'address': address,
      'claim_records':
          claimRecords.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory UserEntry.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return UserEntry(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      claimRecords:
          (json.valueEnsureAsList<dynamic>(
                'claim_records',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<ClaimRecord, Object>(
                  value: e,
                  parse:
                      (v) => ClaimRecord.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory UserEntry.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UserEntry(
      address: decode.getString<String?>(1),
      claimRecords:
          decode
              .getListOfBytes(3)
              .map((b) => ClaimRecord.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeclaimUserEntry;
}

class ClaimRecord extends CosmosProtoMessage {
  final BigInt? campaignId;

  final String? address;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  final List<BigInt> completedMissions;

  final List<BigInt> claimedMissions;

  const ClaimRecord({
    this.campaignId,
    this.address,
    this.amount = const [],
    this.completedMissions = const [],
    this.claimedMissions = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.uint64,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.uint64,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    campaignId,
    address,
    amount,
    completedMissions,
    claimedMissions,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'campaign_id': config.encodeBigint(campaignId),
      'address': address,
      'amount': amount.map((e) => config.encodeMessage(e)).toList(),
      'completed_missions':
          completedMissions.map((e) => config.encodeBigint(e)).toList(),
      'claimed_missions':
          claimedMissions.map((e) => config.encodeBigint(e)).toList(),
    };
  }

  factory ClaimRecord.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ClaimRecord(
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount:
          (json.valueEnsureAsList<dynamic>(
                'amount',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
      completedMissions:
          (json.valueEnsureAsList<dynamic>(
            'completed_missions',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      claimedMissions:
          (json.valueEnsureAsList<dynamic>(
            'claimed_missions',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
    );
  }

  factory ClaimRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ClaimRecord(
      campaignId: decode.getBigInt<BigInt?>(1),
      address: decode.getString<String?>(2),
      amount:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      completedMissions: decode.getListOrEmpty<BigInt>(4),
      claimedMissions: decode.getListOrEmpty<BigInt>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeclaimClaimRecord;
}

class ClaimRecordEntry extends CosmosProtoMessage {
  final BigInt? campaignId;

  final String? userEntryAddress;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const ClaimRecordEntry({
    this.campaignId,
    this.userEntryAddress,
    this.amount = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [campaignId, userEntryAddress, amount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'campaign_id': config.encodeBigint(campaignId),
      'user_entry_address': userEntryAddress,
      'amount': amount.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory ClaimRecordEntry.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ClaimRecordEntry(
      campaignId: json.valueAsBigInt<BigInt?>(
        'campaign_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      userEntryAddress: json.valueAsString<String?>(
        'user_entry_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount:
          (json.valueEnsureAsList<dynamic>(
                'amount',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory ClaimRecordEntry.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ClaimRecordEntry(
      campaignId: decode.getBigInt<BigInt?>(1),
      userEntryAddress: decode.getString<String?>(2),
      amount:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeclaimClaimRecordEntry;
}
