import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/sdk/serialization/buffer/any.dart';
import 'package:cosmos_sdk/sdk/amino/src/utils.dart';
import 'package:cosmos_sdk/sdk/types/bech32_config.dart';

enum CosmosToJsonEncoding { amino, native }

abstract class CosmosProtoMessage
    extends IProtoMessage<CosmosProtoJsonConfing> {
  const CosmosProtoMessage();

  static ProtoBufferDecoderResult decode(
    List<int> bytes,
    ProtoMessageConfig config,
  ) {
    final result = ProtoBufferDecoder.decode(
      bytes: bytes,
      messageConfig: config,
    );
    return result;
  }

  @override
  String toString() {
    return "$runtimeType${toJson()}";
  }

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  });

  CosmosProtoTypeUrl get declarationId;

  Map<String, dynamic> toJsonObject(
    CosmosToJsonEncoding encoding, {
    CosmosBech32Config? config,
  }) {
    final toJson = this.toJson();
    if (encoding == CosmosToJsonEncoding.native) return toJson;
    config ??= CosmosDefaultBech32Configs.cosmosHub;
    // Keys define the field names + order (per class contract).
    final keys = toJson.keys.toList();
    final values = protoValues;

    if (keys.length != values.length) {
      throw BuError(
        DefaultErrorType.invalidArgument,
        "$runtimeType: toJson() and protoValues must have the same length and order.",
        details: {
          "toJsonLength": keys.length.toString(),
          "protoValuesLength": values.length.toString(),
        },
      );
    }

    final protoConfig = this.protoConfig();
    final json = <String, dynamic>{};
    final optionsMap = <String, List<ProtoOption>>{};

    for (var i = 0; i < keys.length; i++) {
      final key = keys[i];
      final fieldConfig = protoConfig.fields.elementAtOrNull(i)?.options;
      if (fieldConfig == null) {
        throw BuError(
          DefaultErrorType.invalidArgument,
          "Missing field options for proto field.",
          details: {"field": key, "message": "$runtimeType"},
        );
      }

      optionsMap[key] = fieldConfig;
      json[key] = _encodeValue(values[i], encoding, config);
    }

    return CosmosAminoUtils.toAminoJson(
      json: json,
      options: optionsMap,
      config: config,
    );
  }

  /// Recursively resolves raw proto values (as returned by [protoValues])
  /// into their amino/native JSON representation, so nested messages get
  /// their own [ProtoOption]s applied instead of being pre-flattened.
  static dynamic _encodeValue(
    Object? value,
    CosmosToJsonEncoding encoding,
    CosmosBech32Config config,
  ) {
    if (value == null) return null;
    if (value is CosmosProtoMessage) return value.toJsonObject(encoding);
    if (value is Iterable) {
      return value.map((e) => _encodeValue(e, encoding, config)).toList();
    }
    if (value is Map) {
      return value.map(
        (k, v) => MapEntry(k, _encodeValue(v, encoding, config)),
      );
    }
    // primitives (String, int, double, bool, enums already converted, etc.)
    return value;
  }

  Any toAny() => AnyBinary(value: toBuffer(), typeUrl: declarationId.typeUrl);

  String toBase64() {
    return StringUtils.decode(toBuffer(), encoding: StringEncoding.base64);
  }
}

mixin ICosmosProtoQueryMessage<RESPONSE extends CosmosProtoMessage>
    on CosmosProtoMessage {
  RESPONSE onQueryResponse(List<int> bytes);
  RESPONSE onQueryResponseJson(Map<String, dynamic> json);

  HttpRequestSpec requestSpec() {
    final config = protoConfig();
    final http = config.options.whereType<ProtoOptionHttp>().firstOrNull;
    if (http == null) {
      throw BuError(
        DefaultErrorType.invalidArgument,
        "Missing ProtoOptionHttp annotation for query request.",
        details: {"typeUrl": declarationId.typeUrl},
      );
    }
    final httpRule = HttpRule.parse(
      http.path,
      http.method,
      body: http.bodyField,
    );
    return GrpcHttpEndpoint(httpRule: httpRule).buildRequest(toJson());
  }
}

mixin ICosmosProtoServiceMessage<RESPONSE extends CosmosProtoMessage>
    on CosmosProtoMessage {
  RESPONSE onServiceResponse(List<int> bytes);
  RESPONSE onServiceResponseJson(Map<String, dynamic> json);
}

mixin ICosmosProtoAminoMessage on CosmosProtoMessage {
  Map<String, dynamic> toAminoJson({CosmosBech32Config? config}) {
    return {
      "type": declarationId.getAminoType(),
      "value": toJsonObject(CosmosToJsonEncoding.amino, config: config),
    };
  }
}

abstract class CosmosProtoTypeUrl {
  abstract final String typeUrl;
  abstract final String? aminoType;
  abstract final String? serviceUrl;
  String getServiceUrl();

  String getAminoType();
}

class UnknownAminoProtoTypeUrl implements CosmosProtoTypeUrl {
  @override
  String get typeUrl {
    throw BuError(
      DefaultErrorType.invalidArgument,
      "Missing type url.",
      details: {"amino_type": aminoType},
    );
  }

  @override
  final String aminoType;
  @override
  final String? serviceUrl;
  const UnknownAminoProtoTypeUrl({required this.aminoType, this.serviceUrl});

  @override
  String getServiceUrl() {
    final serviceUrl = this.serviceUrl;
    if (serviceUrl == null) {
      throw BuError(
        DefaultErrorType.invalidArgument,
        "Missing service url.",
        details: {"amino_type": aminoType, "service_url": "$serviceUrl"},
      );
    }
    return serviceUrl;
  }

  @override
  String getAminoType() {
    return aminoType;
  }
}

class CosmosProtoJsonConfing extends DefaultProtoJsonConfig {
  const CosmosProtoJsonConfing();
  static const CosmosProtoJsonConfing defaultConfig = CosmosProtoJsonConfing();
}
