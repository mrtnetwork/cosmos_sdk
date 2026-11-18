import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/protorev/v1beta1/src/protorev.dart"
    as osmosis_protorev_v1beta1_protorev;

/// MsgSetHotRoutes defines the Msg/SetHotRoutes request type.
class MsgSetHotRoutes extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetHotRoutesResponse>,
        ICosmosProtoAminoMessage {
  /// admin is the account that is authorized to set the hot routes.
  final String? admin;

  /// hot_routes is the list of hot routes to set.
  final List<osmosis_protorev_v1beta1_protorev.TokenPairArbRoutes> hotRoutes;

  const MsgSetHotRoutes({this.admin, this.hotRoutes = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "osmosis/MsgSetHotRoutes"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/osmosis/protorev/set_hot_routes",
        ),
      ],
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
  List<Object?> get protoValues => [admin, hotRoutes];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'admin': admin,
      'hot_routes': hotRoutes.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory MsgSetHotRoutes.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetHotRoutes(
      admin: json.valueAsString<String?>(
        'admin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      hotRoutes:
          (json.valueEnsureAsList<dynamic>(
                'hot_routes',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_protorev_v1beta1_protorev.TokenPairArbRoutes,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => osmosis_protorev_v1beta1_protorev
                          .TokenPairArbRoutes.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory MsgSetHotRoutes.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetHotRoutes(
      admin: decode.getString<String?>(1),
      hotRoutes:
          decode
              .getListOfBytes(2)
              .map(
                (b) => osmosis_protorev_v1beta1_protorev
                    .TokenPairArbRoutes.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1MsgSetHotRoutes;
  @override
  MsgSetHotRoutesResponse onServiceResponse(List<int> bytes) {
    return MsgSetHotRoutesResponse.deserialize(bytes);
  }

  @override
  MsgSetHotRoutesResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSetHotRoutesResponse.fromJson(json);
  }
}

/// MsgSetHotRoutesResponse defines the Msg/SetHotRoutes response type.
class MsgSetHotRoutesResponse extends CosmosProtoMessage {
  const MsgSetHotRoutesResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory MsgSetHotRoutesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetHotRoutesResponse();
  }

  factory MsgSetHotRoutesResponse.deserialize(List<int> bytes) {
    return MsgSetHotRoutesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1MsgSetHotRoutesResponse;
}

/// MsgSetDeveloperAccount defines the Msg/SetDeveloperAccount request type.
class MsgSetDeveloperAccount extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetDeveloperAccountResponse>,
        ICosmosProtoAminoMessage {
  /// admin is the account that is authorized to set the developer account.
  final String? admin;

  /// developer_account is the account that will receive a portion of the profits
  /// from the protorev module.
  final String? developerAccount;

  const MsgSetDeveloperAccount({this.admin, this.developerAccount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/MsgSetDeveloperAccount",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/osmosis/protorev/set_developer_account",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [admin, developerAccount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'admin': admin, 'developer_account': developerAccount};
  }

  factory MsgSetDeveloperAccount.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetDeveloperAccount(
      admin: json.valueAsString<String?>(
        'admin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      developerAccount: json.valueAsString<String?>(
        'developer_account',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgSetDeveloperAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetDeveloperAccount(
      admin: decode.getString<String?>(1),
      developerAccount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1MsgSetDeveloperAccount;
  @override
  MsgSetDeveloperAccountResponse onServiceResponse(List<int> bytes) {
    return MsgSetDeveloperAccountResponse.deserialize(bytes);
  }

  @override
  MsgSetDeveloperAccountResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetDeveloperAccountResponse.fromJson(json);
  }
}

/// MsgSetDeveloperAccountResponse defines the Msg/SetDeveloperAccount response
/// type.
class MsgSetDeveloperAccountResponse extends CosmosProtoMessage {
  const MsgSetDeveloperAccountResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory MsgSetDeveloperAccountResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetDeveloperAccountResponse();
  }

  factory MsgSetDeveloperAccountResponse.deserialize(List<int> bytes) {
    return MsgSetDeveloperAccountResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1MsgSetDeveloperAccountResponse;
}

/// MsgSetInfoByPoolType defines the Msg/SetInfoByPoolType request type.
class MsgSetInfoByPoolType extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetInfoByPoolTypeResponse>,
        ICosmosProtoAminoMessage {
  /// admin is the account that is authorized to set the pool weights.
  final String? admin;

  /// info_by_pool_type contains information about the pool types.
  final osmosis_protorev_v1beta1_protorev.InfoByPoolType? infoByPoolType;

  const MsgSetInfoByPoolType({this.admin, this.infoByPoolType});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/MsgSetInfoByPoolType",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/osmosis/protorev/set_info_by_pool_type",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [admin, infoByPoolType];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'admin': admin,
      'info_by_pool_type': config.encodeMessage(infoByPoolType),
    };
  }

  factory MsgSetInfoByPoolType.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetInfoByPoolType(
      admin: json.valueAsString<String?>(
        'admin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      infoByPoolType: json
          .valueTo<osmosis_protorev_v1beta1_protorev.InfoByPoolType?, Object>(
            key: 'info_by_pool_type',
            parse:
                (v) =>
                    osmosis_protorev_v1beta1_protorev.InfoByPoolType.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory MsgSetInfoByPoolType.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetInfoByPoolType(
      admin: decode.getString<String?>(1),
      infoByPoolType: decode
          .messageTo<osmosis_protorev_v1beta1_protorev.InfoByPoolType?>(
            2,
            (b) =>
                osmosis_protorev_v1beta1_protorev.InfoByPoolType.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1MsgSetInfoByPoolType;
  @override
  MsgSetInfoByPoolTypeResponse onServiceResponse(List<int> bytes) {
    return MsgSetInfoByPoolTypeResponse.deserialize(bytes);
  }

  @override
  MsgSetInfoByPoolTypeResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetInfoByPoolTypeResponse.fromJson(json);
  }
}

/// MsgSetInfoByPoolTypeResponse defines the Msg/SetInfoByPoolType response type.
class MsgSetInfoByPoolTypeResponse extends CosmosProtoMessage {
  const MsgSetInfoByPoolTypeResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory MsgSetInfoByPoolTypeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetInfoByPoolTypeResponse();
  }

  factory MsgSetInfoByPoolTypeResponse.deserialize(List<int> bytes) {
    return MsgSetInfoByPoolTypeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1MsgSetInfoByPoolTypeResponse;
}

/// MsgSetMaxPoolPointsPerTx defines the Msg/SetMaxPoolPointsPerTx request type.
class MsgSetMaxPoolPointsPerTx extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetMaxPoolPointsPerTxResponse>,
        ICosmosProtoAminoMessage {
  /// admin is the account that is authorized to set the max pool points per tx.
  final String? admin;

  /// max_pool_points_per_tx is the maximum number of pool points that can be
  /// consumed per transaction.
  final BigInt? maxPoolPointsPerTx;

  const MsgSetMaxPoolPointsPerTx({this.admin, this.maxPoolPointsPerTx});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/MsgSetMaxPoolPointsPerTx",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/osmosis/protorev/set_max_pool_points_per_tx",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [admin, maxPoolPointsPerTx];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'admin': admin,
      'max_pool_points_per_tx': config.encodeBigint(maxPoolPointsPerTx),
    };
  }

  factory MsgSetMaxPoolPointsPerTx.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetMaxPoolPointsPerTx(
      admin: json.valueAsString<String?>(
        'admin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maxPoolPointsPerTx: json.valueAsBigInt<BigInt?>(
        'max_pool_points_per_tx',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgSetMaxPoolPointsPerTx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetMaxPoolPointsPerTx(
      admin: decode.getString<String?>(1),
      maxPoolPointsPerTx: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1MsgSetMaxPoolPointsPerTx;
  @override
  MsgSetMaxPoolPointsPerTxResponse onServiceResponse(List<int> bytes) {
    return MsgSetMaxPoolPointsPerTxResponse.deserialize(bytes);
  }

  @override
  MsgSetMaxPoolPointsPerTxResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetMaxPoolPointsPerTxResponse.fromJson(json);
  }
}

/// MsgSetMaxPoolPointsPerTxResponse defines the Msg/SetMaxPoolPointsPerTx
/// response type.
class MsgSetMaxPoolPointsPerTxResponse extends CosmosProtoMessage {
  const MsgSetMaxPoolPointsPerTxResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory MsgSetMaxPoolPointsPerTxResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetMaxPoolPointsPerTxResponse();
  }

  factory MsgSetMaxPoolPointsPerTxResponse.deserialize(List<int> bytes) {
    return MsgSetMaxPoolPointsPerTxResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1MsgSetMaxPoolPointsPerTxResponse;
}

/// MsgSetMaxPoolPointsPerBlock defines the Msg/SetMaxPoolPointsPerBlock request
/// type.
class MsgSetMaxPoolPointsPerBlock extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetMaxPoolPointsPerBlockResponse>,
        ICosmosProtoAminoMessage {
  /// admin is the account that is authorized to set the max pool points per
  /// block.
  final String? admin;

  /// max_pool_points_per_block is the maximum number of pool points that can be
  /// consumed per block.
  final BigInt? maxPoolPointsPerBlock;

  const MsgSetMaxPoolPointsPerBlock({this.admin, this.maxPoolPointsPerBlock});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/MsgSetPoolWeights",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/osmosis/protorev/set_max_pool_points_per_block",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [admin, maxPoolPointsPerBlock];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'admin': admin,
      'max_pool_points_per_block': config.encodeBigint(maxPoolPointsPerBlock),
    };
  }

  factory MsgSetMaxPoolPointsPerBlock.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetMaxPoolPointsPerBlock(
      admin: json.valueAsString<String?>(
        'admin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maxPoolPointsPerBlock: json.valueAsBigInt<BigInt?>(
        'max_pool_points_per_block',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgSetMaxPoolPointsPerBlock.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetMaxPoolPointsPerBlock(
      admin: decode.getString<String?>(1),
      maxPoolPointsPerBlock: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1MsgSetMaxPoolPointsPerBlock;
  @override
  MsgSetMaxPoolPointsPerBlockResponse onServiceResponse(List<int> bytes) {
    return MsgSetMaxPoolPointsPerBlockResponse.deserialize(bytes);
  }

  @override
  MsgSetMaxPoolPointsPerBlockResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetMaxPoolPointsPerBlockResponse.fromJson(json);
  }
}

/// MsgSetMaxPoolPointsPerBlockResponse defines the
/// Msg/SetMaxPoolPointsPerBlock response type.
class MsgSetMaxPoolPointsPerBlockResponse extends CosmosProtoMessage {
  const MsgSetMaxPoolPointsPerBlockResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory MsgSetMaxPoolPointsPerBlockResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetMaxPoolPointsPerBlockResponse();
  }

  factory MsgSetMaxPoolPointsPerBlockResponse.deserialize(List<int> bytes) {
    return MsgSetMaxPoolPointsPerBlockResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisProtorevV1beta1MsgSetMaxPoolPointsPerBlockResponse;
}

/// MsgSetBaseDenoms defines the Msg/SetBaseDenoms request type.
class MsgSetBaseDenoms extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetBaseDenomsResponse>,
        ICosmosProtoAminoMessage {
  /// admin is the account that is authorized to set the base denoms.
  final String? admin;

  /// base_denoms is the list of base denoms to set.
  final List<osmosis_protorev_v1beta1_protorev.BaseDenom> baseDenoms;

  const MsgSetBaseDenoms({this.admin, this.baseDenoms = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/MsgSetBaseDenoms",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/osmosis/protorev/set_base_denoms",
        ),
      ],
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
  List<Object?> get protoValues => [admin, baseDenoms];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'admin': admin,
      'base_denoms': baseDenoms.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory MsgSetBaseDenoms.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetBaseDenoms(
      admin: json.valueAsString<String?>(
        'admin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      baseDenoms:
          (json.valueEnsureAsList<dynamic>(
                'base_denoms',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_protorev_v1beta1_protorev.BaseDenom,
                  Object
                >(
                  value: e,
                  parse:
                      (v) =>
                          osmosis_protorev_v1beta1_protorev.BaseDenom.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                ),
              )
              .toList(),
    );
  }

  factory MsgSetBaseDenoms.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetBaseDenoms(
      admin: decode.getString<String?>(1),
      baseDenoms:
          decode
              .getListOfBytes(2)
              .map(
                (b) =>
                    osmosis_protorev_v1beta1_protorev.BaseDenom.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1MsgSetBaseDenoms;
  @override
  MsgSetBaseDenomsResponse onServiceResponse(List<int> bytes) {
    return MsgSetBaseDenomsResponse.deserialize(bytes);
  }

  @override
  MsgSetBaseDenomsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSetBaseDenomsResponse.fromJson(json);
  }
}

/// Deprecated, but must be retained in the file to allow indexers
/// to index blocks since genesis
class MsgSetBaseDenomsResponse extends CosmosProtoMessage {
  const MsgSetBaseDenomsResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory MsgSetBaseDenomsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetBaseDenomsResponse();
  }

  factory MsgSetBaseDenomsResponse.deserialize(List<int> bytes) {
    return MsgSetBaseDenomsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisProtorevV1beta1MsgSetBaseDenomsResponse;
}
