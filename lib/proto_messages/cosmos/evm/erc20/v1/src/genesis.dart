import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Params defines the erc20 module params
class Params extends CosmosProtoMessage {
  /// enable_erc20 is the parameter to enable the conversion of Cosmos coins <-->
  /// ERC20 tokens.
  final bool? enableErc20;

  /// enable_evm_hook is now depecrated
  /// permissionless_registration is the parameter that allows ERC20s to be
  /// permissionlessly registered to be converted to bank tokens and vice versa
  final bool? permissionlessRegistration;

  const Params({this.enableErc20, this.permissionlessRegistration});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1), ProtoFieldConfig.bool(5)],
    );
  }

  @override
  List<Object?> get protoValues => [enableErc20, permissionlessRegistration];

  @override
  Map<String, dynamic> toJson() {
    return {
      'enable_erc20': enableErc20,
      'permissionless_registration': permissionlessRegistration,
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      enableErc20: json.valueAsBool<bool?>(
        'enable_erc20',
        acceptCamelCase: true,
      ),
      permissionlessRegistration: json.valueAsBool<bool?>(
        'permissionless_registration',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      enableErc20: decode.getBool<bool?>(1),
      permissionlessRegistration: decode.getBool<bool?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEvmErc20V1Params;
}
