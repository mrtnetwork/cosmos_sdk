import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class ContractInfo extends CosmosProtoMessage {
  final String? address;

  final String? contract;

  final String? version;

  const ContractInfo({this.address, this.contract, this.version});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, contract, version];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'contract': contract, 'version': version};
  }

  factory ContractInfo.fromJson(Map<String, dynamic> json) {
    return ContractInfo(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      contract: json.valueAsString<String?>('contract', acceptCamelCase: true),
      version: json.valueAsString<String?>('version', acceptCamelCase: true),
    );
  }

  factory ContractInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ContractInfo(
      address: decode.getString<String?>(1),
      contract: decode.getString<String?>(2),
      version: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesContractInfo;
}
