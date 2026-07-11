import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the parameters for the sds module.
class Params extends CosmosProtoMessage {
  final String? bondDenom;

  const Params({this.bondDenom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "stratos/x/sds/Params"),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [bondDenom];

  @override
  Map<String, dynamic> toJson() {
    return {'bond_denom': bondDenom};
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      bondDenom: json.valueAsString<String?>(
        'bond_denom',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(bondDenom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1Params;
}

class FileInfo extends CosmosProtoMessage {
  final String? height;

  final List<int>? reporters;

  final String? uploader;

  const FileInfo({this.height, this.reporters, this.uploader});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [height, reporters, uploader];

  @override
  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'reporters': switch (reporters) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'uploader': uploader,
    };
  }

  factory FileInfo.fromJson(Map<String, dynamic> json) {
    return FileInfo(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
      reporters: json.valueAsBytes<List<int>?>(
        'reporters',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      uploader: json.valueAsString<String?>('uploader', acceptCamelCase: true),
    );
  }

  factory FileInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FileInfo(
      height: decode.getString<String?>(1),
      reporters: decode.getBytes<List<int>?>(2),
      uploader: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosSdsV1FileInfo;
}
