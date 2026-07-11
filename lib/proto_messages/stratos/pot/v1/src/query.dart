import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stratos/pot/v1/src/pot.dart"
    as stratos_pot_v1_pot;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// QueryVolumeReportRequest is request type for the Query/VolumeReport RPC method
class QueryVolumeReportRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVolumeReportResponse> {
  /// epoch defines the epoch number to query for.
  final BigInt? epoch;

  const QueryVolumeReportRequest({this.epoch});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/pot/v1/volume_report/{epoch}",
        ),
      ],
      fields: [ProtoFieldConfig.int64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [epoch];

  @override
  Map<String, dynamic> toJson() {
    return {'epoch': epoch?.toString()};
  }

  factory QueryVolumeReportRequest.fromJson(Map<String, dynamic> json) {
    return QueryVolumeReportRequest(
      epoch: json.valueAsBigInt<BigInt?>('epoch', acceptCamelCase: true),
    );
  }

  factory QueryVolumeReportRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVolumeReportRequest(epoch: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryVolumeReportRequest;
  @override
  QueryVolumeReportResponse onQueryResponse(List<int> bytes) {
    return QueryVolumeReportResponse.deserialize(bytes);
  }

  @override
  QueryVolumeReportResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVolumeReportResponse.fromJson(json);
  }
}

/// QueryVolumeReportResponse is response type for the Query/ResourceNode RPC method
class QueryVolumeReportResponse extends CosmosProtoMessage {
  /// node defines the the volumeReport info.
  final ReportInfo? reportInfo;

  const QueryVolumeReportResponse({this.reportInfo});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [reportInfo];

  @override
  Map<String, dynamic> toJson() {
    return {'report_info': reportInfo?.toJson()};
  }

  factory QueryVolumeReportResponse.fromJson(Map<String, dynamic> json) {
    return QueryVolumeReportResponse(
      reportInfo: json.valueTo<ReportInfo?, Map<String, dynamic>>(
        key: 'report_info',
        parse: (v) => ReportInfo.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryVolumeReportResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVolumeReportResponse(
      reportInfo: decode.messageTo<ReportInfo?>(
        1,
        (b) => ReportInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryVolumeReportResponse;
}

class ReportInfo extends CosmosProtoMessage {
  final BigInt? epoch;

  final String? reference;

  final String? txHash;

  final String? reporter;

  const ReportInfo({this.epoch, this.reference, this.txHash, this.reporter});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [epoch, reference, txHash, reporter];

  @override
  Map<String, dynamic> toJson() {
    return {
      'epoch': epoch?.toString(),
      'reference': reference,
      'tx_hash': txHash,
      'reporter': reporter,
    };
  }

  factory ReportInfo.fromJson(Map<String, dynamic> json) {
    return ReportInfo(
      epoch: json.valueAsBigInt<BigInt?>('epoch', acceptCamelCase: true),
      reference: json.valueAsString<String?>(
        'reference',
        acceptCamelCase: true,
      ),
      txHash: json.valueAsString<String?>('tx_hash', acceptCamelCase: true),
      reporter: json.valueAsString<String?>('reporter', acceptCamelCase: true),
    );
  }

  factory ReportInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ReportInfo(
      epoch: decode.getBigInt<BigInt?>(1),
      reference: decode.getString<String?>(2),
      txHash: decode.getString<String?>(3),
      reporter: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1ReportInfo;
}

/// QueryParamsRequest is request type for the Query/Params RPC method.
class QueryParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryParamsResponse> {
  const QueryParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/pot/v1/params",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryParamsRequest.fromJson(Map<String, dynamic> json) {
    return QueryParamsRequest();
  }

  factory QueryParamsRequest.deserialize(List<int> bytes) {
    return QueryParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is response type for the Query/Params RPC method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params holds all the parameters of this module.
  final stratos_pot_v1_pot.Params? params;

  const QueryParamsResponse({this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json.valueTo<stratos_pot_v1_pot.Params?, Map<String, dynamic>>(
        key: 'params',
        parse: (v) => stratos_pot_v1_pot.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<stratos_pot_v1_pot.Params?>(
        1,
        (b) => stratos_pot_v1_pot.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryParamsResponse;
}

/// QueryRewardsByEpochRequest is request type for the Query/RewardsByEpoch by a given epoch RPC method
class QueryRewardsByEpochRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRewardsByEpochResponse> {
  final BigInt? epoch;

  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryRewardsByEpochRequest({this.epoch, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/pot/v1/rewards/epoch/{epoch}",
        ),
      ],
      fields: [ProtoFieldConfig.int64(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [epoch, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'epoch': epoch?.toString(), 'pagination': pagination?.toJson()};
  }

  factory QueryRewardsByEpochRequest.fromJson(Map<String, dynamic> json) {
    return QueryRewardsByEpochRequest(
      epoch: json.valueAsBigInt<BigInt?>('epoch', acceptCamelCase: true),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryRewardsByEpochRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRewardsByEpochRequest(
      epoch: decode.getBigInt<BigInt?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryRewardsByEpochRequest;
  @override
  QueryRewardsByEpochResponse onQueryResponse(List<int> bytes) {
    return QueryRewardsByEpochResponse.deserialize(bytes);
  }

  @override
  QueryRewardsByEpochResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryRewardsByEpochResponse.fromJson(json);
  }
}

/// QueryRewardsByEpochResponse is response type for the Query/RewardsByEpoch RPC method
class QueryRewardsByEpochResponse extends CosmosProtoMessage {
  final List<stratos_pot_v1_pot.Reward> rewards;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryRewardsByEpochResponse({this.rewards = const [], this.pagination});

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
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [rewards, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'rewards': rewards.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryRewardsByEpochResponse.fromJson(Map<String, dynamic> json) {
    return QueryRewardsByEpochResponse(
      rewards:
          (json.valueEnsureAsList<dynamic>('rewards', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  stratos_pot_v1_pot.Reward,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => stratos_pot_v1_pot.Reward.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryRewardsByEpochResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRewardsByEpochResponse(
      rewards:
          decode
              .getListOfBytes(1)
              .map((b) => stratos_pot_v1_pot.Reward.deserialize(b))
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryRewardsByEpochResponse;
}

/// QueryRewardsByOwnerRequest is request type for the Query/RewardsByOwner by a given owner RPC method
class QueryRewardsByWalletRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRewardsByWalletResponse> {
  final String? walletAddress;

  const QueryRewardsByWalletRequest({this.walletAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/pot/v1/rewards/wallet/{wallet_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [walletAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'wallet_address': walletAddress};
  }

  factory QueryRewardsByWalletRequest.fromJson(Map<String, dynamic> json) {
    return QueryRewardsByWalletRequest(
      walletAddress: json.valueAsString<String?>(
        'wallet_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryRewardsByWalletRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRewardsByWalletRequest(
      walletAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryRewardsByWalletRequest;
  @override
  QueryRewardsByWalletResponse onQueryResponse(List<int> bytes) {
    return QueryRewardsByWalletResponse.deserialize(bytes);
  }

  @override
  QueryRewardsByWalletResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryRewardsByWalletResponse.fromJson(json);
  }
}

/// QueryRewardsByOwnerResponse is response type for the Query/RewardsByOwner RPC method
class QueryRewardsByWalletResponse extends CosmosProtoMessage {
  final RewardByWallet? rewards;

  const QueryRewardsByWalletResponse({this.rewards});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [rewards];

  @override
  Map<String, dynamic> toJson() {
    return {'rewards': rewards?.toJson()};
  }

  factory QueryRewardsByWalletResponse.fromJson(Map<String, dynamic> json) {
    return QueryRewardsByWalletResponse(
      rewards: json.valueTo<RewardByWallet?, Map<String, dynamic>>(
        key: 'rewards',
        parse: (v) => RewardByWallet.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryRewardsByWalletResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRewardsByWalletResponse(
      rewards: decode.messageTo<RewardByWallet?>(
        1,
        (b) => RewardByWallet.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryRewardsByWalletResponse;
}

class QueryRewardsByWalletAndEpochRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRewardsByWalletAndEpochResponse> {
  final String? walletAddress;

  final BigInt? epoch;

  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryRewardsByWalletAndEpochRequest({
    this.walletAddress,
    this.epoch,
    this.pagination,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/pot/v1/rewards/wallet/{wallet_address}/epoch/{epoch}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.message(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [walletAddress, epoch, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'wallet_address': walletAddress,
      'epoch': epoch?.toString(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryRewardsByWalletAndEpochRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryRewardsByWalletAndEpochRequest(
      walletAddress: json.valueAsString<String?>(
        'wallet_address',
        acceptCamelCase: true,
      ),
      epoch: json.valueAsBigInt<BigInt?>('epoch', acceptCamelCase: true),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryRewardsByWalletAndEpochRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRewardsByWalletAndEpochRequest(
      walletAddress: decode.getString<String?>(1),
      epoch: decode.getBigInt<BigInt?>(2),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            3,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryRewardsByWalletAndEpochRequest;
  @override
  QueryRewardsByWalletAndEpochResponse onQueryResponse(List<int> bytes) {
    return QueryRewardsByWalletAndEpochResponse.deserialize(bytes);
  }

  @override
  QueryRewardsByWalletAndEpochResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryRewardsByWalletAndEpochResponse.fromJson(json);
  }
}

class QueryRewardsByWalletAndEpochResponse extends CosmosProtoMessage {
  final List<stratos_pot_v1_pot.Reward> rewards;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryRewardsByWalletAndEpochResponse({
    this.rewards = const [],
    this.pagination,
  });

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
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [rewards, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'rewards': rewards.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryRewardsByWalletAndEpochResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryRewardsByWalletAndEpochResponse(
      rewards:
          (json.valueEnsureAsList<dynamic>('rewards', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  stratos_pot_v1_pot.Reward,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => stratos_pot_v1_pot.Reward.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryRewardsByWalletAndEpochResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRewardsByWalletAndEpochResponse(
      rewards:
          decode
              .getListOfBytes(1)
              .map((b) => stratos_pot_v1_pot.Reward.deserialize(b))
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .stratosPotV1QueryRewardsByWalletAndEpochResponse;
}

class RewardByWallet extends CosmosProtoMessage {
  final String? walletAddress;

  final List<cosmos_base_v1beta1_coin.Coin> matureTotalReward;

  final List<cosmos_base_v1beta1_coin.Coin> immatureTotalReward;

  const RewardByWallet({
    this.walletAddress,
    this.matureTotalReward = const [],
    this.immatureTotalReward = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    walletAddress,
    matureTotalReward,
    immatureTotalReward,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'wallet_address': walletAddress,
      'mature_total_reward': matureTotalReward.map((e) => e.toJson()).toList(),
      'immature_total_reward':
          immatureTotalReward.map((e) => e.toJson()).toList(),
    };
  }

  factory RewardByWallet.fromJson(Map<String, dynamic> json) {
    return RewardByWallet(
      walletAddress: json.valueAsString<String?>(
        'wallet_address',
        acceptCamelCase: true,
      ),
      matureTotalReward:
          (json.valueEnsureAsList<dynamic>(
                'mature_total_reward',
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
      immatureTotalReward:
          (json.valueEnsureAsList<dynamic>(
                'immature_total_reward',
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

  factory RewardByWallet.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RewardByWallet(
      walletAddress: decode.getString<String?>(1),
      matureTotalReward:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      immatureTotalReward:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1RewardByWallet;
}

/// QuerySlashingByOwnerRequest is request type for the Query/Slashing by a given owner RPC method
class QuerySlashingByOwnerRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySlashingByOwnerResponse> {
  final String? walletAddress;

  const QuerySlashingByOwnerRequest({this.walletAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/pot/v1/slashing/{wallet_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [walletAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'wallet_address': walletAddress};
  }

  factory QuerySlashingByOwnerRequest.fromJson(Map<String, dynamic> json) {
    return QuerySlashingByOwnerRequest(
      walletAddress: json.valueAsString<String?>(
        'wallet_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QuerySlashingByOwnerRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySlashingByOwnerRequest(
      walletAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QuerySlashingByOwnerRequest;
  @override
  QuerySlashingByOwnerResponse onQueryResponse(List<int> bytes) {
    return QuerySlashingByOwnerResponse.deserialize(bytes);
  }

  @override
  QuerySlashingByOwnerResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySlashingByOwnerResponse.fromJson(json);
  }
}

/// QuerySlashingByOwnerResponse is response type for the Query/Slashing RPC method
class QuerySlashingByOwnerResponse extends CosmosProtoMessage {
  final String? slashing;

  const QuerySlashingByOwnerResponse({this.slashing});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [slashing];

  @override
  Map<String, dynamic> toJson() {
    return {'slashing': slashing};
  }

  factory QuerySlashingByOwnerResponse.fromJson(Map<String, dynamic> json) {
    return QuerySlashingByOwnerResponse(
      slashing: json.valueAsString<String?>('slashing', acceptCamelCase: true),
    );
  }

  factory QuerySlashingByOwnerResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySlashingByOwnerResponse(slashing: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QuerySlashingByOwnerResponse;
}

class QueryTotalMinedTokenRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTotalMinedTokenResponse> {
  const QueryTotalMinedTokenRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/pot/v1/total_mined_token",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryTotalMinedTokenRequest.fromJson(Map<String, dynamic> json) {
    return QueryTotalMinedTokenRequest();
  }

  factory QueryTotalMinedTokenRequest.deserialize(List<int> bytes) {
    return QueryTotalMinedTokenRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryTotalMinedTokenRequest;
  @override
  QueryTotalMinedTokenResponse onQueryResponse(List<int> bytes) {
    return QueryTotalMinedTokenResponse.deserialize(bytes);
  }

  @override
  QueryTotalMinedTokenResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTotalMinedTokenResponse.fromJson(json);
  }
}

class QueryTotalMinedTokenResponse extends CosmosProtoMessage {
  final cosmos_base_v1beta1_coin.Coin? totalMinedToken;

  const QueryTotalMinedTokenResponse({this.totalMinedToken});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [totalMinedToken];

  @override
  Map<String, dynamic> toJson() {
    return {'total_mined_token': totalMinedToken?.toJson()};
  }

  factory QueryTotalMinedTokenResponse.fromJson(Map<String, dynamic> json) {
    return QueryTotalMinedTokenResponse(
      totalMinedToken: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'total_mined_token',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryTotalMinedTokenResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalMinedTokenResponse(
      totalMinedToken: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        1,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryTotalMinedTokenResponse;
}

class QueryCirculationSupplyRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCirculationSupplyResponse> {
  const QueryCirculationSupplyRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/pot/v1/circulation_supply",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryCirculationSupplyRequest.fromJson(Map<String, dynamic> json) {
    return QueryCirculationSupplyRequest();
  }

  factory QueryCirculationSupplyRequest.deserialize(List<int> bytes) {
    return QueryCirculationSupplyRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryCirculationSupplyRequest;
  @override
  QueryCirculationSupplyResponse onQueryResponse(List<int> bytes) {
    return QueryCirculationSupplyResponse.deserialize(bytes);
  }

  @override
  QueryCirculationSupplyResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryCirculationSupplyResponse.fromJson(json);
  }
}

class QueryCirculationSupplyResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> circulationSupply;

  const QueryCirculationSupplyResponse({this.circulationSupply = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [circulationSupply];

  @override
  Map<String, dynamic> toJson() {
    return {
      'circulation_supply': circulationSupply.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryCirculationSupplyResponse.fromJson(Map<String, dynamic> json) {
    return QueryCirculationSupplyResponse(
      circulationSupply:
          (json.valueEnsureAsList<dynamic>(
                'circulation_supply',
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

  factory QueryCirculationSupplyResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCirculationSupplyResponse(
      circulationSupply:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryCirculationSupplyResponse;
}

class QueryTotalRewardByEpochRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTotalRewardByEpochResponse> {
  final BigInt? epoch;

  const QueryTotalRewardByEpochRequest({this.epoch});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/pot/v1/total_reward/{epoch}",
        ),
      ],
      fields: [ProtoFieldConfig.int64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [epoch];

  @override
  Map<String, dynamic> toJson() {
    return {'epoch': epoch?.toString()};
  }

  factory QueryTotalRewardByEpochRequest.fromJson(Map<String, dynamic> json) {
    return QueryTotalRewardByEpochRequest(
      epoch: json.valueAsBigInt<BigInt?>('epoch', acceptCamelCase: true),
    );
  }

  factory QueryTotalRewardByEpochRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalRewardByEpochRequest(epoch: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryTotalRewardByEpochRequest;
  @override
  QueryTotalRewardByEpochResponse onQueryResponse(List<int> bytes) {
    return QueryTotalRewardByEpochResponse.deserialize(bytes);
  }

  @override
  QueryTotalRewardByEpochResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryTotalRewardByEpochResponse.fromJson(json);
  }
}

class QueryTotalRewardByEpochResponse extends CosmosProtoMessage {
  final stratos_pot_v1_pot.TotalReward? totalReward;

  final bool? isLegacy;

  const QueryTotalRewardByEpochResponse({this.totalReward, this.isLegacy});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.bool(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [totalReward, isLegacy];

  @override
  Map<String, dynamic> toJson() {
    return {'total_reward': totalReward?.toJson(), 'is_legacy': isLegacy};
  }

  factory QueryTotalRewardByEpochResponse.fromJson(Map<String, dynamic> json) {
    return QueryTotalRewardByEpochResponse(
      totalReward: json
          .valueTo<stratos_pot_v1_pot.TotalReward?, Map<String, dynamic>>(
            key: 'total_reward',
            parse: (v) => stratos_pot_v1_pot.TotalReward.fromJson(v),
            acceptCamelCase: true,
          ),
      isLegacy: json.valueAsBool<bool?>('is_legacy', acceptCamelCase: true),
    );
  }

  factory QueryTotalRewardByEpochResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalRewardByEpochResponse(
      totalReward: decode.messageTo<stratos_pot_v1_pot.TotalReward?>(
        1,
        (b) => stratos_pot_v1_pot.TotalReward.deserialize(b),
      ),
      isLegacy: decode.getBool<bool?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryTotalRewardByEpochResponse;
}

class QueryMetricsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMetricsResponse> {
  const QueryMetricsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/pot/v1/metrics",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryMetricsRequest.fromJson(Map<String, dynamic> json) {
    return QueryMetricsRequest();
  }

  factory QueryMetricsRequest.deserialize(List<int> bytes) {
    return QueryMetricsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryMetricsRequest;
  @override
  QueryMetricsResponse onQueryResponse(List<int> bytes) {
    return QueryMetricsResponse.deserialize(bytes);
  }

  @override
  QueryMetricsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMetricsResponse.fromJson(json);
  }
}

class QueryMetricsResponse extends CosmosProtoMessage {
  final stratos_pot_v1_pot.Metrics? metrics;

  const QueryMetricsResponse({this.metrics});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [metrics];

  @override
  Map<String, dynamic> toJson() {
    return {'metrics': metrics?.toJson()};
  }

  factory QueryMetricsResponse.fromJson(Map<String, dynamic> json) {
    return QueryMetricsResponse(
      metrics: json.valueTo<stratos_pot_v1_pot.Metrics?, Map<String, dynamic>>(
        key: 'metrics',
        parse: (v) => stratos_pot_v1_pot.Metrics.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryMetricsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMetricsResponse(
      metrics: decode.messageTo<stratos_pot_v1_pot.Metrics?>(
        1,
        (b) => stratos_pot_v1_pot.Metrics.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1QueryMetricsResponse;
}
