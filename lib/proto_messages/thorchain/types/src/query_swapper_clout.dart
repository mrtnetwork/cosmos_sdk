import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/type_clout.dart"
    as types_type_clout;

class QuerySwapperCloutRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<types_type_clout.SwapperClout> {
  final String? address;

  final String? height;

  const QuerySwapperCloutRequest({this.address, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/clout/swap/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, height];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'height': height};
  }

  factory QuerySwapperCloutRequest.fromJson(Map<String, dynamic> json) {
    return QuerySwapperCloutRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QuerySwapperCloutRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySwapperCloutRequest(
      address: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySwapperCloutRequest;
  @override
  types_type_clout.SwapperClout onQueryResponse(List<int> bytes) {
    return types_type_clout.SwapperClout.deserialize(bytes);
  }

  @override
  types_type_clout.SwapperClout onQueryResponseJson(Map<String, dynamic> json) {
    return types_type_clout.SwapperClout.fromJson(json);
  }
}
