import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stratos/pot/v1/src/pot.dart"
    as stratos_pot_v1_pot;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// MsgVolumeReport encapsulates an VolumeReport transaction as an SDK message.
class MsgVolumeReport extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgVolumeReportResponse>,
        ICosmosProtoAminoMessage {
  final List<stratos_pot_v1_pot.SingleWalletVolume> walletVolumes;

  final String? reporter;

  final String? epoch;

  final String? reportReference;

  final String? reporterOwner;

  final BLSSignatureInfo? blsSignature;

  const MsgVolumeReport({
    this.walletVolumes = const [],
    this.reporter,
    this.epoch,
    this.reportReference,
    this.reporterOwner,
    this.blsSignature,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "reporter_owner",
        ),
        ProtoOptionString(name: "amino.name", value: "stratos/MsgVolumeReport"),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.message(
          6,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    walletVolumes,
    reporter,
    epoch,
    reportReference,
    reporterOwner,
    blsSignature,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'wallet_volumes':
          walletVolumes.map((e) => config.encodeMessage(e)).toList(),
      'reporter': reporter,
      'epoch': epoch,
      'report_reference': reportReference,
      'reporter_owner': reporterOwner,
      'BLS_signature': config.encodeMessage(blsSignature),
    };
  }

  factory MsgVolumeReport.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgVolumeReport(
      walletVolumes:
          (json.valueEnsureAsList<dynamic>(
                'wallet_volumes',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stratos_pot_v1_pot.SingleWalletVolume,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => stratos_pot_v1_pot.SingleWalletVolume.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      reporter: json.valueAsString<String?>(
        'reporter',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      epoch: json.valueAsString<String?>(
        'epoch',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      reportReference: json.valueAsString<String?>(
        'report_reference',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      reporterOwner: json.valueAsString<String?>(
        'reporter_owner',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blsSignature: json.valueTo<BLSSignatureInfo?, Object>(
        key: 'BLS_signature',
        parse:
            (v) => BLSSignatureInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgVolumeReport.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgVolumeReport(
      walletVolumes:
          decode
              .getListOfBytes(1)
              .map((b) => stratos_pot_v1_pot.SingleWalletVolume.deserialize(b))
              .toList(),
      reporter: decode.getString<String?>(2),
      epoch: decode.getString<String?>(3),
      reportReference: decode.getString<String?>(4),
      reporterOwner: decode.getString<String?>(5),
      blsSignature: decode.messageTo<BLSSignatureInfo?>(
        6,
        (b) => BLSSignatureInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1MsgVolumeReport;
  @override
  MsgVolumeReportResponse onServiceResponse(List<int> bytes) {
    return MsgVolumeReportResponse.deserialize(bytes);
  }

  @override
  MsgVolumeReportResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgVolumeReportResponse.fromJson(json);
  }
}

/// MsgVolumeReportResponse defines the MsgVolumeReport response type
class MsgVolumeReportResponse extends CosmosProtoMessage {
  const MsgVolumeReportResponse();

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

  factory MsgVolumeReportResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgVolumeReportResponse();
  }

  factory MsgVolumeReportResponse.deserialize(List<int> bytes) {
    return MsgVolumeReportResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1MsgVolumeReportResponse;
}

/// MsgWithdraw encapsulates an withdraw transaction as an SDK message.
class MsgWithdraw extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgWithdrawResponse>,
        ICosmosProtoAminoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  final String? walletAddress;

  final String? targetAddress;

  const MsgWithdraw({
    this.amount = const [],
    this.walletAddress,
    this.targetAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "wallet_address",
        ),
        ProtoOptionString(name: "amino.name", value: "stratos/MsgWithdraw"),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [amount, walletAddress, targetAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'amount': amount.map((e) => config.encodeMessage(e)).toList(),
      'wallet_address': walletAddress,
      'target_address': targetAddress,
    };
  }

  factory MsgWithdraw.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgWithdraw(
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
      walletAddress: json.valueAsString<String?>(
        'wallet_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      targetAddress: json.valueAsString<String?>(
        'target_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgWithdraw.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgWithdraw(
      amount:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      walletAddress: decode.getString<String?>(2),
      targetAddress: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1MsgWithdraw;
  @override
  MsgWithdrawResponse onServiceResponse(List<int> bytes) {
    return MsgWithdrawResponse.deserialize(bytes);
  }

  @override
  MsgWithdrawResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgWithdrawResponse.fromJson(json);
  }
}

/// MsgWithdrawResponse defines the Msg/MsgWithdraw response type.
class MsgWithdrawResponse extends CosmosProtoMessage {
  const MsgWithdrawResponse();

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

  factory MsgWithdrawResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgWithdrawResponse();
  }

  factory MsgWithdrawResponse.deserialize(List<int> bytes) {
    return MsgWithdrawResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1MsgWithdrawResponse;
}

/// MsgFoundationDeposit - encapsulates an FoundationDeposit transaction as an SDK message
class MsgFoundationDeposit extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgFoundationDepositResponse>,
        ICosmosProtoAminoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  final String? from;

  const MsgFoundationDeposit({this.amount = const [], this.from});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/MsgFoundationDeposit",
        ),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [amount, from];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'amount': amount.map((e) => config.encodeMessage(e)).toList(),
      'from': from,
    };
  }

  factory MsgFoundationDeposit.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgFoundationDeposit(
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
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgFoundationDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgFoundationDeposit(
      amount:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      from: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1MsgFoundationDeposit;
  @override
  MsgFoundationDepositResponse onServiceResponse(List<int> bytes) {
    return MsgFoundationDepositResponse.deserialize(bytes);
  }

  @override
  MsgFoundationDepositResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgFoundationDepositResponse.fromJson(json);
  }
}

/// MsgFoundationDepositResponse defines the MsgFoundationDeposit response type
class MsgFoundationDepositResponse extends CosmosProtoMessage {
  const MsgFoundationDepositResponse();

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

  factory MsgFoundationDepositResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgFoundationDepositResponse();
  }

  factory MsgFoundationDepositResponse.deserialize(List<int> bytes) {
    return MsgFoundationDepositResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1MsgFoundationDepositResponse;
}

/// MsgRemoveMetaNode - encapsulates an MsgRemoveMetaNode transaction as an SDK message
class MsgSlashingResourceNode extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSlashingResourceNodeResponse>,
        ICosmosProtoAminoMessage {
  final List<String> reporters;

  final List<String> reporterOwner;

  final String? networkAddress;

  final String? walletAddress;

  final String? slashing;

  final bool? suspend;

  const MsgSlashingResourceNode({
    this.reporters = const [],
    this.reporterOwner = const [],
    this.networkAddress,
    this.walletAddress,
    this.slashing,
    this.suspend,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "reporter_owner",
        ),
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/MsgSlashingResourceNode",
        ),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(
          5,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.bool(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    reporters,
    reporterOwner,
    networkAddress,
    walletAddress,
    slashing,
    suspend,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'reporters': reporters.map((e) => e).toList(),
      'reporter_owner': reporterOwner.map((e) => e).toList(),
      'network_address': networkAddress,
      'wallet_address': walletAddress,
      'slashing': slashing,
      'suspend': suspend,
    };
  }

  factory MsgSlashingResourceNode.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSlashingResourceNode(
      reporters:
          (json.valueEnsureAsList<dynamic>(
            'reporters',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      reporterOwner:
          (json.valueEnsureAsList<dynamic>(
            'reporter_owner',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      networkAddress: json.valueAsString<String?>(
        'network_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      walletAddress: json.valueAsString<String?>(
        'wallet_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      slashing: json.valueAsString<String?>(
        'slashing',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      suspend: json.valueAsBool<bool?>(
        'suspend',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgSlashingResourceNode.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSlashingResourceNode(
      reporters: decode.getListOrEmpty<String>(1),
      reporterOwner: decode.getListOrEmpty<String>(2),
      networkAddress: decode.getString<String?>(3),
      walletAddress: decode.getString<String?>(4),
      slashing: decode.getString<String?>(5),
      suspend: decode.getBool<bool?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1MsgSlashingResourceNode;
  @override
  MsgSlashingResourceNodeResponse onServiceResponse(List<int> bytes) {
    return MsgSlashingResourceNodeResponse.deserialize(bytes);
  }

  @override
  MsgSlashingResourceNodeResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSlashingResourceNodeResponse.fromJson(json);
  }
}

/// MsgSlashingResourceNodeResponse defines the Msg/MsgSlashingResourceNode response type.
class MsgSlashingResourceNodeResponse extends CosmosProtoMessage {
  const MsgSlashingResourceNodeResponse();

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

  factory MsgSlashingResourceNodeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSlashingResourceNodeResponse();
  }

  factory MsgSlashingResourceNodeResponse.deserialize(List<int> bytes) {
    return MsgSlashingResourceNodeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1MsgSlashingResourceNodeResponse;
}

class BLSSignatureInfo extends CosmosProtoMessage {
  final List<BuBytes> pubKeys;

  final BuBytes? signature;

  final BuBytes? txData;

  BLSSignatureInfo({
    List<List<int>> pubKeys = const [],
    List<int>? signature,
    List<int>? txData,
  }) : pubKeys = pubKeys.map((e) => e.asImmutableBytes).toImutableList,
       signature = signature?.asImmutableBytes,
       txData = txData?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.bytes,
          options: const [],
        ),
        ProtoFieldConfig.bytes(2, options: const []),
        ProtoFieldConfig.bytes(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pubKeys, signature, txData];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pub_keys': pubKeys.map((e) => config.encodeBinary(e)).toList(),
      'signature': config.encodeBinary(signature),
      'txData': config.encodeBinary(txData),
    };
  }

  factory BLSSignatureInfo.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BLSSignatureInfo(
      pubKeys:
          (json.valueEnsureAsList<dynamic>(
            'pub_keys',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => config.decodeBinary<List<int>>(e)).toList(),
      signature: config.decodeBinary<List<int>?>(
        json.valueAs('signature', normalizeKeyLookup: config.normalizeKeys),
      ),
      txData: config.decodeBinary<List<int>?>(
        json.valueAs('txData', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory BLSSignatureInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BLSSignatureInfo(
      pubKeys: decode.getListOfBytes(1),
      signature: decode.getBytes<List<int>?>(2),
      txData: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1BLSSignatureInfo;
}

/// MsgUpdateParams defines a Msg for updating the x/pot module parameters.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the x/pot parameters to update.
  /// NOTE: All parameters must be supplied.
  final stratos_pot_v1_pot.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/x/pot/MsgUpdateParams",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, params];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'authority': authority, 'params': config.encodeMessage(params)};
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
      params: json.valueTo<stratos_pot_v1_pot.Params?, Object>(
        key: 'params',
        parse:
            (v) => stratos_pot_v1_pot.Params.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<stratos_pot_v1_pot.Params?>(
        2,
        (b) => stratos_pot_v1_pot.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosPotV1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// MsgUpdateParamsResponse defines the response structure for executing a
/// MsgUpdateParams message.
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
      DefaultCosmosProtoTypeUrl.stratosPotV1MsgUpdateParamsResponse;
}
