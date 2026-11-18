import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/chain4energy/c4echain/cfedistributor/src/sub_distributor.dart"
    as chain4energy_c4echain_cfedistributor_sub_distributor;

class MsgUpdateParams extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateParamsResponse> {
  /// authority is the address of the governance account.
  final String? authority;

  final List<
    chain4energy_c4echain_cfedistributor_sub_distributor.SubDistributor
  >
  subDistributors;

  const MsgUpdateParams({this.authority, this.subDistributors = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, subDistributors];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'authority': authority,
      'sub_distributors':
          subDistributors.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory MsgUpdateParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subDistributors:
          (json.valueEnsureAsList<dynamic>(
                'sub_distributors',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  chain4energy_c4echain_cfedistributor_sub_distributor.SubDistributor,
                  Object
                >(
                  value: e,
                  parse:
                      (v) =>
                          chain4energy_c4echain_cfedistributor_sub_distributor
                              .SubDistributor.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                ),
              )
              .toList(),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      subDistributors:
          decode
              .getListOfBytes(2)
              .map(
                (b) => chain4energy_c4echain_cfedistributor_sub_distributor
                    .SubDistributor.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfedistributorMsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

class MsgUpdateParamsResponse extends CosmosProtoMessage {
  const MsgUpdateParamsResponse();

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

  factory MsgUpdateParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfedistributorMsgUpdateParamsResponse;
}

class MsgUpdateSubDistributorParam extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateSubDistributorParamResponse> {
  /// authority is the address of the governance account.
  final String? authority;

  final chain4energy_c4echain_cfedistributor_sub_distributor.SubDistributor?
  subDistributor;

  const MsgUpdateSubDistributorParam({this.authority, this.subDistributor});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [authority, subDistributor];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'authority': authority,
      'sub_distributor': config.encodeMessage(subDistributor),
    };
  }

  factory MsgUpdateSubDistributorParam.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateSubDistributorParam(
      authority: json.valueAsString<String?>(
        'authority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subDistributor: json.valueTo<
        chain4energy_c4echain_cfedistributor_sub_distributor.SubDistributor?,
        Object
      >(
        key: 'sub_distributor',
        parse:
            (v) => chain4energy_c4echain_cfedistributor_sub_distributor
                .SubDistributor.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdateSubDistributorParam.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateSubDistributorParam(
      authority: decode.getString<String?>(1),
      subDistributor: decode.messageTo<
        chain4energy_c4echain_cfedistributor_sub_distributor.SubDistributor?
      >(
        2,
        (b) => chain4energy_c4echain_cfedistributor_sub_distributor
            .SubDistributor.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfedistributorMsgUpdateSubDistributorParam;
  @override
  MsgUpdateSubDistributorParamResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateSubDistributorParamResponse.deserialize(bytes);
  }

  @override
  MsgUpdateSubDistributorParamResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateSubDistributorParamResponse.fromJson(json);
  }
}

class MsgUpdateSubDistributorParamResponse extends CosmosProtoMessage {
  const MsgUpdateSubDistributorParamResponse();

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

  factory MsgUpdateSubDistributorParamResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateSubDistributorParamResponse();
  }

  factory MsgUpdateSubDistributorParamResponse.deserialize(List<int> bytes) {
    return MsgUpdateSubDistributorParamResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfedistributorMsgUpdateSubDistributorParamResponse;
}

class MsgUpdateSubDistributorDestinationShareParam extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<
          MsgUpdateSubDistributorDestinationShareParamResponse
        > {
  final String? authority;

  final String? subDistributorName;

  final String? destinationName;

  final String? share;

  const MsgUpdateSubDistributorDestinationShareParam({
    this.authority,
    this.subDistributorName,
    this.destinationName,
    this.share,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    subDistributorName,
    destinationName,
    share,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'authority': authority,
      'sub_distributor_name': subDistributorName,
      'destination_name': destinationName,
      'share': share,
    };
  }

  factory MsgUpdateSubDistributorDestinationShareParam.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateSubDistributorDestinationShareParam(
      authority: json.valueAsString<String?>(
        'authority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subDistributorName: json.valueAsString<String?>(
        'sub_distributor_name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      destinationName: json.valueAsString<String?>(
        'destination_name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      share: json.valueAsString<String?>(
        'share',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdateSubDistributorDestinationShareParam.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateSubDistributorDestinationShareParam(
      authority: decode.getString<String?>(1),
      subDistributorName: decode.getString<String?>(2),
      destinationName: decode.getString<String?>(3),
      share: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfedistributorMsgUpdateSubDistributorDestinationShareParam;
  @override
  MsgUpdateSubDistributorDestinationShareParamResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgUpdateSubDistributorDestinationShareParamResponse.deserialize(
      bytes,
    );
  }

  @override
  MsgUpdateSubDistributorDestinationShareParamResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateSubDistributorDestinationShareParamResponse.fromJson(json);
  }
}

class MsgUpdateSubDistributorDestinationShareParamResponse
    extends CosmosProtoMessage {
  const MsgUpdateSubDistributorDestinationShareParamResponse();

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

  factory MsgUpdateSubDistributorDestinationShareParamResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateSubDistributorDestinationShareParamResponse();
  }

  factory MsgUpdateSubDistributorDestinationShareParamResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgUpdateSubDistributorDestinationShareParamResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfedistributorMsgUpdateSubDistributorDestinationShareParamResponse;
}

class MsgUpdateSubDistributorBurnShareParam extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<
          MsgUpdateSubDistributorBurnShareParamResponse
        > {
  final String? authority;

  final String? subDistributorName;

  final String? burnShare;

  const MsgUpdateSubDistributorBurnShareParam({
    this.authority,
    this.subDistributorName,
    this.burnShare,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, subDistributorName, burnShare];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'authority': authority,
      'sub_distributor_name': subDistributorName,
      'burn_share': burnShare,
    };
  }

  factory MsgUpdateSubDistributorBurnShareParam.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateSubDistributorBurnShareParam(
      authority: json.valueAsString<String?>(
        'authority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      subDistributorName: json.valueAsString<String?>(
        'sub_distributor_name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      burnShare: json.valueAsString<String?>(
        'burn_share',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdateSubDistributorBurnShareParam.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateSubDistributorBurnShareParam(
      authority: decode.getString<String?>(1),
      subDistributorName: decode.getString<String?>(2),
      burnShare: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfedistributorMsgUpdateSubDistributorBurnShareParam;
  @override
  MsgUpdateSubDistributorBurnShareParamResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgUpdateSubDistributorBurnShareParamResponse.deserialize(bytes);
  }

  @override
  MsgUpdateSubDistributorBurnShareParamResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateSubDistributorBurnShareParamResponse.fromJson(json);
  }
}

class MsgUpdateSubDistributorBurnShareParamResponse extends CosmosProtoMessage {
  const MsgUpdateSubDistributorBurnShareParamResponse();

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

  factory MsgUpdateSubDistributorBurnShareParamResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateSubDistributorBurnShareParamResponse();
  }

  factory MsgUpdateSubDistributorBurnShareParamResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgUpdateSubDistributorBurnShareParamResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfedistributorMsgUpdateSubDistributorBurnShareParamResponse;
}
