import 'package:cosmos_sdk/src/protobuf/message/any.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'package:cosmos_sdk/src/protobuf/codec/encoder.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:blockchain_utils/service/models/params.dart';
import 'package:cosmos_sdk/src/models/ethermint/types_v1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// Abstract class providing a common implementation for encoding cosmos messages using minimal protobuf encoding.
abstract class CosmosProtocolBuffer {
  const CosmosProtocolBuffer();

  /// List of dynamic values to be encoded.
  abstract final List<dynamic> values;

  /// List of field IDs corresponding to the values.
  abstract final List<int> fieldIds;

  /// Converts the data to a JSON representation.
  Map<String, dynamic> toJson();

  /// Converts the protocol buffer data to a byte buffer.
  List<int> toBuffer() {
    if (values.length != fieldIds.length) {
      throw DartCosmosSdkPluginException(
          "The values and field IDs must have the same length.",
          details: {
            "values": values,
            "fieldIds": fieldIds,
            "class": runtimeType.toString(),
          });
    }
    final bytes = DynamicByteTracker();
    for (int i = 0; i < values.length; i++) {
      final value = values[i];
      final tagNumber = fieldIds[i];
      List<int> encode;
      if (value == null) continue;
      encode = ProtocolBufferEncoder.encode(tagNumber, value);
      bytes.add(encode);
    }
    return bytes.toBytes();
  }

  /// Gets the hexadecimal representation of the protocol buffer data.
  String get toHex => BytesUtils.toHexString(
        toBuffer(),
      );

  static List<ProtocolBufferDecoderResult> decode(List<int> bytes) {
    return ProtocolBufferDecoder.decode(bytes);
  }

  @override
  String toString() {
    return "$runtimeType${toJson()}";
  }
}

abstract class TypeUrl {
  const TypeUrl(this.typeUrl,
      {this.rpc, this.query, this.method = RequestServiceType.get});
  final String typeUrl;
  final String? rpc;
  final String? query;
  final RequestServiceType method;

  String rpcUrl({List<dynamic> pathParameters = const []}) {
    if (rpc == null) {
      throw DartCosmosSdkPluginException("RPC not supported",
          details: {"type": typeUrl});
    }
    final paths = CosmosUtils.extractParams(rpc!);
    String params = rpc!;
    for (int i = 0; i < pathParameters.length; i++) {
      params = params.replaceFirst(paths[i], pathParameters[i].toString());
    }
    return params;
  }

  static TypeUrl fromValue(String? typeUrl) {
    if (typeUrl == null) {
      throw DartCosmosSdkPluginException("Invalid type url.",
          details: {"@type": typeUrl});
    }
    if (typeUrl.startsWith(EthermintTypesV1Types.basePath)) {
      return EthermintTypesV1Types.fromValue(typeUrl);
    }
    return AuthV1beta1Types.values.firstWhere(
      (e) => e.typeUrl == typeUrl,
      orElse: () => throw DartCosmosSdkPluginException(
          "No AuthV1beta1Types element found for the given value.",
          details: {"@type": typeUrl}),
    );
  }

  @override
  String toString() {
    return "@type: $typeUrl";
  }
}

class UnknownTypeUrl extends TypeUrl {
  const UnknownTypeUrl(super.typeUrl);
}

abstract class CosmosMessage extends CosmosProtocolBuffer {
  const CosmosMessage();
  abstract final TypeUrl typeUrl;
  Any toAny() => Any(value: toBuffer(), typeUrl: typeUrl.typeUrl);
}

mixin QueryMessage<Response> on CosmosMessage {
  // abstract final TypeUrl queryPath;
  Response onResponse(List<int> bytes);

  Response onJsonResponse(Map<String, dynamic> json);
  Map<String, String?> get queryParameters => {};
  List<String> get pathParameters => [];
  Map<String, dynamic> get body => {};
}
mixin ServiceMessage<Response> on CosmosMessage {
  abstract final TypeUrl service;
  abstract final List<String?> signers;
  Response onResponse(List<int> bytes);
}
