import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/wasmx/v1/src/wasmx.dart"
    as injective_wasmx_v1_wasmx;

class RegisteredContractWithAddress extends CosmosProtoMessage {
  final String? address;

  final injective_wasmx_v1_wasmx.RegisteredContract? registeredContract;

  const RegisteredContractWithAddress({this.address, this.registeredContract});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, registeredContract];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'registered_contract': registeredContract?.toJson(),
    };
  }

  factory RegisteredContractWithAddress.fromJson(Map<String, dynamic> json) {
    return RegisteredContractWithAddress(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      registeredContract: json.valueTo<
        injective_wasmx_v1_wasmx.RegisteredContract?,
        Map<String, dynamic>
      >(
        key: 'registered_contract',
        parse: (v) => injective_wasmx_v1_wasmx.RegisteredContract.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory RegisteredContractWithAddress.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RegisteredContractWithAddress(
      address: decode.getString<String?>(1),
      registeredContract: decode
          .messageTo<injective_wasmx_v1_wasmx.RegisteredContract?>(
            2,
            (b) => injective_wasmx_v1_wasmx.RegisteredContract.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1RegisteredContractWithAddress;
}

/// GenesisState defines the wasmx module's genesis state.
class GenesisState extends CosmosProtoMessage {
  /// params defines all the parameters of related to wasmx.
  final injective_wasmx_v1_wasmx.Params? params;

  /// registered_contracts is an array containing the genesis registered
  /// contracts
  final List<RegisteredContractWithAddress> registeredContracts;

  const GenesisState({this.params, this.registeredContracts = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [params, registeredContracts];

  @override
  Map<String, dynamic> toJson() {
    return {
      'params': params?.toJson(),
      'registered_contracts':
          registeredContracts.map((e) => e.toJson()).toList(),
    };
  }

  factory GenesisState.fromJson(Map<String, dynamic> json) {
    return GenesisState(
      params: json
          .valueTo<injective_wasmx_v1_wasmx.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => injective_wasmx_v1_wasmx.Params.fromJson(v),
            acceptCamelCase: true,
          ),
      registeredContracts:
          (json.valueEnsureAsList<dynamic>(
                'registered_contracts',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  RegisteredContractWithAddress,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => RegisteredContractWithAddress.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory GenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GenesisState(
      params: decode.messageTo<injective_wasmx_v1_wasmx.Params?>(
        1,
        (b) => injective_wasmx_v1_wasmx.Params.deserialize(b),
      ),
      registeredContracts:
          decode
              .getListOfBytes(2)
              .map((b) => RegisteredContractWithAddress.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1GenesisState;
}
