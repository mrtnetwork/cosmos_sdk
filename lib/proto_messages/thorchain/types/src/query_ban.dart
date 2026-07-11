import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/type_ban_voter.dart"
    as types_type_ban_voter;

class QueryBanRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<types_type_ban_voter.BanVoter> {
  final String? address;

  final String? height;

  const QueryBanRequest({this.address, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/ban/{address}",
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

  factory QueryBanRequest.fromJson(Map<String, dynamic> json) {
    return QueryBanRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryBanRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBanRequest(
      address: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryBanRequest;
  @override
  types_type_ban_voter.BanVoter onQueryResponse(List<int> bytes) {
    return types_type_ban_voter.BanVoter.deserialize(bytes);
  }

  @override
  types_type_ban_voter.BanVoter onQueryResponseJson(Map<String, dynamic> json) {
    return types_type_ban_voter.BanVoter.fromJson(json);
  }
}
