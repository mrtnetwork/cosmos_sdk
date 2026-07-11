import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryRunePoolRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRunePoolResponse> {
  final String? height;

  const QueryRunePoolRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/runepool",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height};
  }

  factory QueryRunePoolRequest.fromJson(Map<String, dynamic> json) {
    return QueryRunePoolRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryRunePoolRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRunePoolRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryRunePoolRequest;
  @override
  QueryRunePoolResponse onQueryResponse(List<int> bytes) {
    return QueryRunePoolResponse.deserialize(bytes);
  }

  @override
  QueryRunePoolResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryRunePoolResponse.fromJson(json);
  }
}

class QueryRunePoolResponse extends CosmosProtoMessage {
  final Pol? pol;

  final RunePoolProviders? providers;

  final RunePoolReserve? reserve;

  const QueryRunePoolResponse({this.pol, this.providers, this.reserve});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pol, providers, reserve];

  @override
  Map<String, dynamic> toJson() {
    return {
      'pol': pol?.toJson(),
      'providers': providers?.toJson(),
      'reserve': reserve?.toJson(),
    };
  }

  factory QueryRunePoolResponse.fromJson(Map<String, dynamic> json) {
    return QueryRunePoolResponse(
      pol: json.valueTo<Pol?, Map<String, dynamic>>(
        key: 'pol',
        parse: (v) => Pol.fromJson(v),
        acceptCamelCase: true,
      ),
      providers: json.valueTo<RunePoolProviders?, Map<String, dynamic>>(
        key: 'providers',
        parse: (v) => RunePoolProviders.fromJson(v),
        acceptCamelCase: true,
      ),
      reserve: json.valueTo<RunePoolReserve?, Map<String, dynamic>>(
        key: 'reserve',
        parse: (v) => RunePoolReserve.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryRunePoolResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRunePoolResponse(
      pol: decode.messageTo<Pol?>(1, (b) => Pol.deserialize(b)),
      providers: decode.messageTo<RunePoolProviders?>(
        2,
        (b) => RunePoolProviders.deserialize(b),
      ),
      reserve: decode.messageTo<RunePoolReserve?>(
        3,
        (b) => RunePoolReserve.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryRunePoolResponse;
}

class Pol extends CosmosProtoMessage {
  /// total amount of RUNE deposited into the pools
  final String? runeDeposited;

  /// total amount of RUNE withdrawn from the pools
  final String? runeWithdrawn;

  /// total value of protocol's LP position in RUNE value
  final String? value;

  /// profit and loss of protocol owned liquidity
  final String? pnl;

  /// current amount of rune deposited
  final String? currentDeposit;

  const Pol({
    this.runeDeposited,
    this.runeWithdrawn,
    this.value,
    this.pnl,
    this.currentDeposit,
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
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    runeDeposited,
    runeWithdrawn,
    value,
    pnl,
    currentDeposit,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'rune_deposited': runeDeposited,
      'rune_withdrawn': runeWithdrawn,
      'value': value,
      'pnl': pnl,
      'current_deposit': currentDeposit,
    };
  }

  factory Pol.fromJson(Map<String, dynamic> json) {
    return Pol(
      runeDeposited: json.valueAsString<String?>(
        'rune_deposited',
        acceptCamelCase: true,
      ),
      runeWithdrawn: json.valueAsString<String?>(
        'rune_withdrawn',
        acceptCamelCase: true,
      ),
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
      pnl: json.valueAsString<String?>('pnl', acceptCamelCase: true),
      currentDeposit: json.valueAsString<String?>(
        'current_deposit',
        acceptCamelCase: true,
      ),
    );
  }

  factory Pol.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Pol(
      runeDeposited: decode.getString<String?>(1),
      runeWithdrawn: decode.getString<String?>(2),
      value: decode.getString<String?>(3),
      pnl: decode.getString<String?>(4),
      currentDeposit: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesPol;
}

class RunePoolProviders extends CosmosProtoMessage {
  /// the units of RUNEPool owned by providers (including pending)
  final String? units;

  /// the units of RUNEPool owned by providers that remain pending
  final String? pendingUnits;

  /// the amount of RUNE pending
  final String? pendingRune;

  /// the value of the provider share of the RUNEPool (includes pending RUNE)
  final String? value;

  /// the profit and loss of the provider share of the RUNEPool
  final String? pnl;

  /// the current RUNE deposited by providers
  final String? currentDeposit;

  const RunePoolProviders({
    this.units,
    this.pendingUnits,
    this.pendingRune,
    this.value,
    this.pnl,
    this.currentDeposit,
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
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    units,
    pendingUnits,
    pendingRune,
    value,
    pnl,
    currentDeposit,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'units': units,
      'pending_units': pendingUnits,
      'pending_rune': pendingRune,
      'value': value,
      'pnl': pnl,
      'current_deposit': currentDeposit,
    };
  }

  factory RunePoolProviders.fromJson(Map<String, dynamic> json) {
    return RunePoolProviders(
      units: json.valueAsString<String?>('units', acceptCamelCase: true),
      pendingUnits: json.valueAsString<String?>(
        'pending_units',
        acceptCamelCase: true,
      ),
      pendingRune: json.valueAsString<String?>(
        'pending_rune',
        acceptCamelCase: true,
      ),
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
      pnl: json.valueAsString<String?>('pnl', acceptCamelCase: true),
      currentDeposit: json.valueAsString<String?>(
        'current_deposit',
        acceptCamelCase: true,
      ),
    );
  }

  factory RunePoolProviders.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RunePoolProviders(
      units: decode.getString<String?>(1),
      pendingUnits: decode.getString<String?>(2),
      pendingRune: decode.getString<String?>(3),
      value: decode.getString<String?>(4),
      pnl: decode.getString<String?>(5),
      currentDeposit: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesRunePoolProviders;
}

class RunePoolReserve extends CosmosProtoMessage {
  /// the units of RUNEPool owned by the reserve
  final String? units;

  /// the value of the reserve share of the RUNEPool
  final String? value;

  /// the profit and loss of the reserve share of the RUNEPool
  final String? pnl;

  /// the current RUNE deposited by the reserve
  final String? currentDeposit;

  const RunePoolReserve({
    this.units,
    this.value,
    this.pnl,
    this.currentDeposit,
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
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [units, value, pnl, currentDeposit];

  @override
  Map<String, dynamic> toJson() {
    return {
      'units': units,
      'value': value,
      'pnl': pnl,
      'current_deposit': currentDeposit,
    };
  }

  factory RunePoolReserve.fromJson(Map<String, dynamic> json) {
    return RunePoolReserve(
      units: json.valueAsString<String?>('units', acceptCamelCase: true),
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
      pnl: json.valueAsString<String?>('pnl', acceptCamelCase: true),
      currentDeposit: json.valueAsString<String?>(
        'current_deposit',
        acceptCamelCase: true,
      ),
    );
  }

  factory RunePoolReserve.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RunePoolReserve(
      units: decode.getString<String?>(1),
      value: decode.getString<String?>(2),
      pnl: decode.getString<String?>(3),
      currentDeposit: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesRunePoolReserve;
}
