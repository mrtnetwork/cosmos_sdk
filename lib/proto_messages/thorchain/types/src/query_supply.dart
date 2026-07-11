import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class LockedSupply extends CosmosProtoMessage {
  final BigInt? reserve;

  const LockedSupply({this.reserve});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.int64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [reserve];

  @override
  Map<String, dynamic> toJson() {
    return {'reserve': reserve?.toString()};
  }

  factory LockedSupply.fromJson(Map<String, dynamic> json) {
    return LockedSupply(
      reserve: json.valueAsBigInt<BigInt?>('reserve', acceptCamelCase: true),
    );
  }

  factory LockedSupply.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LockedSupply(reserve: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesLockedSupply;
}

class QuerySupplyRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySupplyResponse> {
  final String? height;

  const QuerySupplyRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/supply",
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

  factory QuerySupplyRequest.fromJson(Map<String, dynamic> json) {
    return QuerySupplyRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QuerySupplyRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySupplyRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySupplyRequest;
  @override
  QuerySupplyResponse onQueryResponse(List<int> bytes) {
    return QuerySupplyResponse.deserialize(bytes);
  }

  @override
  QuerySupplyResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySupplyResponse.fromJson(json);
  }
}

class QuerySupplyResponse extends CosmosProtoMessage {
  final BigInt? circulating;

  final LockedSupply? locked;

  final BigInt? total;

  const QuerySupplyResponse({this.circulating, this.locked, this.total});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.int64(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [circulating, locked, total];

  @override
  Map<String, dynamic> toJson() {
    return {
      'circulating': circulating?.toString(),
      'locked': locked?.toJson(),
      'total': total?.toString(),
    };
  }

  factory QuerySupplyResponse.fromJson(Map<String, dynamic> json) {
    return QuerySupplyResponse(
      circulating: json.valueAsBigInt<BigInt?>(
        'circulating',
        acceptCamelCase: true,
      ),
      locked: json.valueTo<LockedSupply?, Map<String, dynamic>>(
        key: 'locked',
        parse: (v) => LockedSupply.fromJson(v),
        acceptCamelCase: true,
      ),
      total: json.valueAsBigInt<BigInt?>('total', acceptCamelCase: true),
    );
  }

  factory QuerySupplyResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySupplyResponse(
      circulating: decode.getBigInt<BigInt?>(1),
      locked: decode.messageTo<LockedSupply?>(
        2,
        (b) => LockedSupply.deserialize(b),
      ),
      total: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySupplyResponse;
}
