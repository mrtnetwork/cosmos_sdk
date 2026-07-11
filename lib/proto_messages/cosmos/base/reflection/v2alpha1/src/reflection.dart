import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// TxDescriptor describes the accepted transaction type
class TxDescriptor extends CosmosProtoMessage {
  /// fullname is the protobuf fullname of the raw transaction type (for instance the tx.Tx type)
  /// it is not meant to support polymorphism of transaction types, it is supposed to be used by
  /// reflection clients to understand if they can handle a specific transaction type in an application.
  final String? fullname;

  /// msgs lists the accepted application messages (sdk.Msg)
  final List<MsgDescriptor> msgs;

  const TxDescriptor({this.fullname, this.msgs = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [fullname, msgs];

  @override
  Map<String, dynamic> toJson() {
    return {'fullname': fullname, 'msgs': msgs.map((e) => e.toJson()).toList()};
  }

  factory TxDescriptor.fromJson(Map<String, dynamic> json) {
    return TxDescriptor(
      fullname: json.valueAsString<String?>('fullname', acceptCamelCase: true),
      msgs:
          (json.valueEnsureAsList<dynamic>('msgs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<MsgDescriptor, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => MsgDescriptor.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory TxDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxDescriptor(
      fullname: decode.getString<String?>(1),
      msgs:
          decode
              .getListOfBytes(2)
              .map((b) => MsgDescriptor.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseReflectionV2alpha1TxDescriptor;
}

/// AuthnDescriptor provides information on how to sign transactions without relying
/// on the online RPCs GetTxMetadata and CombineUnsignedTxAndSignatures
class AuthnDescriptor extends CosmosProtoMessage {
  /// sign_modes defines the supported signature algorithm
  final List<SigningModeDescriptor> signModes;

  const AuthnDescriptor({this.signModes = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [signModes];

  @override
  Map<String, dynamic> toJson() {
    return {'sign_modes': signModes.map((e) => e.toJson()).toList()};
  }

  factory AuthnDescriptor.fromJson(Map<String, dynamic> json) {
    return AuthnDescriptor(
      signModes:
          (json.valueEnsureAsList<dynamic>('sign_modes', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  SigningModeDescriptor,
                  Map<String, dynamic>
                >(value: e, parse: (v) => SigningModeDescriptor.fromJson(v)),
              )
              .toList(),
    );
  }

  factory AuthnDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AuthnDescriptor(
      signModes:
          decode
              .getListOfBytes(1)
              .map((b) => SigningModeDescriptor.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseReflectionV2alpha1AuthnDescriptor;
}

/// SigningModeDescriptor provides information on a signing flow of the application
/// NOTE(fdymylja): here we could go as far as providing an entire flow on how
/// to sign a message given a SigningModeDescriptor, but it's better to think about
/// this another time
class SigningModeDescriptor extends CosmosProtoMessage {
  /// name defines the unique name of the signing mode
  final String? name;

  /// number is the unique int32 identifier for the sign_mode enum
  final int? number;

  /// authn_info_provider_method_fullname defines the fullname of the method to call to get
  /// the metadata required to authenticate using the provided sign_modes
  final String? authnInfoProviderMethodFullname;

  const SigningModeDescriptor({
    this.name,
    this.number,
    this.authnInfoProviderMethodFullname,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.int32(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    number,
    authnInfoProviderMethodFullname,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'number': number,
      'authn_info_provider_method_fullname': authnInfoProviderMethodFullname,
    };
  }

  factory SigningModeDescriptor.fromJson(Map<String, dynamic> json) {
    return SigningModeDescriptor(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      number: json.valueAsInt<int?>('number', acceptCamelCase: true),
      authnInfoProviderMethodFullname: json.valueAsString<String?>(
        'authn_info_provider_method_fullname',
        acceptCamelCase: true,
      ),
    );
  }

  factory SigningModeDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SigningModeDescriptor(
      name: decode.getString<String?>(1),
      number: decode.getInt<int?>(2),
      authnInfoProviderMethodFullname: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1SigningModeDescriptor;
}

/// ChainDescriptor describes chain information of the application
class ChainDescriptor extends CosmosProtoMessage {
  /// id is the chain id
  final String? id;

  const ChainDescriptor({this.id});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [id];

  @override
  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  factory ChainDescriptor.fromJson(Map<String, dynamic> json) {
    return ChainDescriptor(
      id: json.valueAsString<String?>('id', acceptCamelCase: true),
    );
  }

  factory ChainDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ChainDescriptor(id: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseReflectionV2alpha1ChainDescriptor;
}

/// CodecDescriptor describes the registered interfaces and provides metadata information on the types
class CodecDescriptor extends CosmosProtoMessage {
  /// interfaces is a list of the registered interfaces descriptors
  final List<InterfaceDescriptor> interfaces;

  const CodecDescriptor({this.interfaces = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [interfaces];

  @override
  Map<String, dynamic> toJson() {
    return {'interfaces': interfaces.map((e) => e.toJson()).toList()};
  }

  factory CodecDescriptor.fromJson(Map<String, dynamic> json) {
    return CodecDescriptor(
      interfaces:
          (json.valueEnsureAsList<dynamic>('interfaces', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  InterfaceDescriptor,
                  Map<String, dynamic>
                >(value: e, parse: (v) => InterfaceDescriptor.fromJson(v)),
              )
              .toList(),
    );
  }

  factory CodecDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CodecDescriptor(
      interfaces:
          decode
              .getListOfBytes(1)
              .map((b) => InterfaceDescriptor.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseReflectionV2alpha1CodecDescriptor;
}

/// InterfaceDescriptor describes the implementation of an interface
class InterfaceDescriptor extends CosmosProtoMessage {
  /// fullname is the name of the interface
  final String? fullname;

  /// interface_accepting_messages contains information regarding the proto messages which contain the interface as
  /// google.protobuf.Any field
  final List<InterfaceAcceptingMessageDescriptor> interfaceAcceptingMessages;

  /// interface_implementers is a list of the descriptors of the interface implementers
  final List<InterfaceImplementerDescriptor> interfaceImplementers;

  const InterfaceDescriptor({
    this.fullname,
    this.interfaceAcceptingMessages = const [],
    this.interfaceImplementers = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    fullname,
    interfaceAcceptingMessages,
    interfaceImplementers,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'interface_accepting_messages':
          interfaceAcceptingMessages.map((e) => e.toJson()).toList(),
      'interface_implementers':
          interfaceImplementers.map((e) => e.toJson()).toList(),
    };
  }

  factory InterfaceDescriptor.fromJson(Map<String, dynamic> json) {
    return InterfaceDescriptor(
      fullname: json.valueAsString<String?>('fullname', acceptCamelCase: true),
      interfaceAcceptingMessages:
          (json.valueEnsureAsList<dynamic>(
                'interface_accepting_messages',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  InterfaceAcceptingMessageDescriptor,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => InterfaceAcceptingMessageDescriptor.fromJson(v),
                ),
              )
              .toList(),
      interfaceImplementers:
          (json.valueEnsureAsList<dynamic>(
                'interface_implementers',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  InterfaceImplementerDescriptor,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => InterfaceImplementerDescriptor.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory InterfaceDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return InterfaceDescriptor(
      fullname: decode.getString<String?>(1),
      interfaceAcceptingMessages:
          decode
              .getListOfBytes(2)
              .map((b) => InterfaceAcceptingMessageDescriptor.deserialize(b))
              .toList(),
      interfaceImplementers:
          decode
              .getListOfBytes(3)
              .map((b) => InterfaceImplementerDescriptor.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseReflectionV2alpha1InterfaceDescriptor;
}

/// InterfaceImplementerDescriptor describes an interface implementer
class InterfaceImplementerDescriptor extends CosmosProtoMessage {
  /// fullname is the protobuf queryable name of the interface implementer
  final String? fullname;

  /// type_url defines the type URL used when marshalling the type as any
  /// this is required so we can provide type safe google.protobuf.Any marshalling and
  /// unmarshalling, making sure that we don't accept just 'any' type
  /// in our interface fields
  final String? typeUrl;

  const InterfaceImplementerDescriptor({this.fullname, this.typeUrl});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [fullname, typeUrl];

  @override
  Map<String, dynamic> toJson() {
    return {'fullname': fullname, 'type_url': typeUrl};
  }

  factory InterfaceImplementerDescriptor.fromJson(Map<String, dynamic> json) {
    return InterfaceImplementerDescriptor(
      fullname: json.valueAsString<String?>('fullname', acceptCamelCase: true),
      typeUrl: json.valueAsString<String?>('type_url', acceptCamelCase: true),
    );
  }

  factory InterfaceImplementerDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return InterfaceImplementerDescriptor(
      fullname: decode.getString<String?>(1),
      typeUrl: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1InterfaceImplementerDescriptor;
}

/// InterfaceAcceptingMessageDescriptor describes a protobuf message which contains
/// an interface represented as a google.protobuf.Any
class InterfaceAcceptingMessageDescriptor extends CosmosProtoMessage {
  /// fullname is the protobuf fullname of the type containing the interface
  final String? fullname;

  /// field_descriptor_names is a list of the protobuf name (not fullname) of the field
  /// which contains the interface as google.protobuf.Any (the interface is the same, but
  /// it can be in multiple fields of the same proto message)
  final List<String> fieldDescriptorNames;

  const InterfaceAcceptingMessageDescriptor({
    this.fullname,
    this.fieldDescriptorNames = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [fullname, fieldDescriptorNames];

  @override
  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'field_descriptor_names': fieldDescriptorNames.map((e) => e).toList(),
    };
  }

  factory InterfaceAcceptingMessageDescriptor.fromJson(
    Map<String, dynamic> json,
  ) {
    return InterfaceAcceptingMessageDescriptor(
      fullname: json.valueAsString<String?>('fullname', acceptCamelCase: true),
      fieldDescriptorNames:
          (json.valueEnsureAsList<dynamic>(
            'field_descriptor_names',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory InterfaceAcceptingMessageDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return InterfaceAcceptingMessageDescriptor(
      fullname: decode.getString<String?>(1),
      fieldDescriptorNames: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1InterfaceAcceptingMessageDescriptor;
}

/// ConfigurationDescriptor contains metadata information on the sdk.Config
class ConfigurationDescriptor extends CosmosProtoMessage {
  /// bech32_account_address_prefix is the account address prefix
  final String? bech32AccountAddressPrefix;

  const ConfigurationDescriptor({this.bech32AccountAddressPrefix});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [bech32AccountAddressPrefix];

  @override
  Map<String, dynamic> toJson() {
    return {'bech32_account_address_prefix': bech32AccountAddressPrefix};
  }

  factory ConfigurationDescriptor.fromJson(Map<String, dynamic> json) {
    return ConfigurationDescriptor(
      bech32AccountAddressPrefix: json.valueAsString<String?>(
        'bech32_account_address_prefix',
        acceptCamelCase: true,
      ),
    );
  }

  factory ConfigurationDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ConfigurationDescriptor(
      bech32AccountAddressPrefix: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1ConfigurationDescriptor;
}

/// MsgDescriptor describes a cosmos-sdk message that can be delivered with a transaction
class MsgDescriptor extends CosmosProtoMessage {
  /// msg_type_url contains the TypeURL of a sdk.Msg.
  final String? msgTypeUrl;

  const MsgDescriptor({this.msgTypeUrl});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [msgTypeUrl];

  @override
  Map<String, dynamic> toJson() {
    return {'msg_type_url': msgTypeUrl};
  }

  factory MsgDescriptor.fromJson(Map<String, dynamic> json) {
    return MsgDescriptor(
      msgTypeUrl: json.valueAsString<String?>(
        'msg_type_url',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDescriptor(msgTypeUrl: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseReflectionV2alpha1MsgDescriptor;
}

/// GetAuthnDescriptorRequest is the request used for the GetAuthnDescriptor RPC
class GetAuthnDescriptorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetAuthnDescriptorResponse> {
  const GetAuthnDescriptorRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/reflection/v1beta1/app_descriptor/authn",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory GetAuthnDescriptorRequest.fromJson(Map<String, dynamic> json) {
    return GetAuthnDescriptorRequest();
  }

  factory GetAuthnDescriptorRequest.deserialize(List<int> bytes) {
    return GetAuthnDescriptorRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1GetAuthnDescriptorRequest;
  @override
  GetAuthnDescriptorResponse onQueryResponse(List<int> bytes) {
    return GetAuthnDescriptorResponse.deserialize(bytes);
  }

  @override
  GetAuthnDescriptorResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetAuthnDescriptorResponse.fromJson(json);
  }
}

/// GetAuthnDescriptorResponse is the response returned by the GetAuthnDescriptor RPC
class GetAuthnDescriptorResponse extends CosmosProtoMessage {
  /// authn describes how to authenticate to the application when sending transactions
  final AuthnDescriptor? authn;

  const GetAuthnDescriptorResponse({this.authn});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [authn];

  @override
  Map<String, dynamic> toJson() {
    return {'authn': authn?.toJson()};
  }

  factory GetAuthnDescriptorResponse.fromJson(Map<String, dynamic> json) {
    return GetAuthnDescriptorResponse(
      authn: json.valueTo<AuthnDescriptor?, Map<String, dynamic>>(
        key: 'authn',
        parse: (v) => AuthnDescriptor.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory GetAuthnDescriptorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetAuthnDescriptorResponse(
      authn: decode.messageTo<AuthnDescriptor?>(
        1,
        (b) => AuthnDescriptor.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1GetAuthnDescriptorResponse;
}

/// GetChainDescriptorRequest is the request used for the GetChainDescriptor RPC
class GetChainDescriptorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetChainDescriptorResponse> {
  const GetChainDescriptorRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/reflection/v1beta1/app_descriptor/chain",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory GetChainDescriptorRequest.fromJson(Map<String, dynamic> json) {
    return GetChainDescriptorRequest();
  }

  factory GetChainDescriptorRequest.deserialize(List<int> bytes) {
    return GetChainDescriptorRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1GetChainDescriptorRequest;
  @override
  GetChainDescriptorResponse onQueryResponse(List<int> bytes) {
    return GetChainDescriptorResponse.deserialize(bytes);
  }

  @override
  GetChainDescriptorResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetChainDescriptorResponse.fromJson(json);
  }
}

/// GetChainDescriptorResponse is the response returned by the GetChainDescriptor RPC
class GetChainDescriptorResponse extends CosmosProtoMessage {
  /// chain describes application chain information
  final ChainDescriptor? chain;

  const GetChainDescriptorResponse({this.chain});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [chain];

  @override
  Map<String, dynamic> toJson() {
    return {'chain': chain?.toJson()};
  }

  factory GetChainDescriptorResponse.fromJson(Map<String, dynamic> json) {
    return GetChainDescriptorResponse(
      chain: json.valueTo<ChainDescriptor?, Map<String, dynamic>>(
        key: 'chain',
        parse: (v) => ChainDescriptor.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory GetChainDescriptorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetChainDescriptorResponse(
      chain: decode.messageTo<ChainDescriptor?>(
        1,
        (b) => ChainDescriptor.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1GetChainDescriptorResponse;
}

/// GetCodecDescriptorRequest is the request used for the GetCodecDescriptor RPC
class GetCodecDescriptorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetCodecDescriptorResponse> {
  const GetCodecDescriptorRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/reflection/v1beta1/app_descriptor/codec",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory GetCodecDescriptorRequest.fromJson(Map<String, dynamic> json) {
    return GetCodecDescriptorRequest();
  }

  factory GetCodecDescriptorRequest.deserialize(List<int> bytes) {
    return GetCodecDescriptorRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1GetCodecDescriptorRequest;
  @override
  GetCodecDescriptorResponse onQueryResponse(List<int> bytes) {
    return GetCodecDescriptorResponse.deserialize(bytes);
  }

  @override
  GetCodecDescriptorResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetCodecDescriptorResponse.fromJson(json);
  }
}

/// GetCodecDescriptorResponse is the response returned by the GetCodecDescriptor RPC
class GetCodecDescriptorResponse extends CosmosProtoMessage {
  /// codec describes the application codec such as registered interfaces and implementations
  final CodecDescriptor? codec;

  const GetCodecDescriptorResponse({this.codec});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [codec];

  @override
  Map<String, dynamic> toJson() {
    return {'codec': codec?.toJson()};
  }

  factory GetCodecDescriptorResponse.fromJson(Map<String, dynamic> json) {
    return GetCodecDescriptorResponse(
      codec: json.valueTo<CodecDescriptor?, Map<String, dynamic>>(
        key: 'codec',
        parse: (v) => CodecDescriptor.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory GetCodecDescriptorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetCodecDescriptorResponse(
      codec: decode.messageTo<CodecDescriptor?>(
        1,
        (b) => CodecDescriptor.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1GetCodecDescriptorResponse;
}

/// GetConfigurationDescriptorRequest is the request used for the GetConfigurationDescriptor RPC
class GetConfigurationDescriptorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetConfigurationDescriptorResponse> {
  const GetConfigurationDescriptorRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/reflection/v1beta1/app_descriptor/configuration",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory GetConfigurationDescriptorRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetConfigurationDescriptorRequest();
  }

  factory GetConfigurationDescriptorRequest.deserialize(List<int> bytes) {
    return GetConfigurationDescriptorRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1GetConfigurationDescriptorRequest;
  @override
  GetConfigurationDescriptorResponse onQueryResponse(List<int> bytes) {
    return GetConfigurationDescriptorResponse.deserialize(bytes);
  }

  @override
  GetConfigurationDescriptorResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return GetConfigurationDescriptorResponse.fromJson(json);
  }
}

/// GetConfigurationDescriptorResponse is the response returned by the GetConfigurationDescriptor RPC
class GetConfigurationDescriptorResponse extends CosmosProtoMessage {
  /// config describes the application's sdk.Config
  final ConfigurationDescriptor? config;

  const GetConfigurationDescriptorResponse({this.config});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [config];

  @override
  Map<String, dynamic> toJson() {
    return {'config': config?.toJson()};
  }

  factory GetConfigurationDescriptorResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetConfigurationDescriptorResponse(
      config: json.valueTo<ConfigurationDescriptor?, Map<String, dynamic>>(
        key: 'config',
        parse: (v) => ConfigurationDescriptor.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory GetConfigurationDescriptorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetConfigurationDescriptorResponse(
      config: decode.messageTo<ConfigurationDescriptor?>(
        1,
        (b) => ConfigurationDescriptor.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1GetConfigurationDescriptorResponse;
}

/// GetQueryServicesDescriptorRequest is the request used for the GetQueryServicesDescriptor RPC
class GetQueryServicesDescriptorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetQueryServicesDescriptorResponse> {
  const GetQueryServicesDescriptorRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/reflection/v1beta1/app_descriptor/query_services",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory GetQueryServicesDescriptorRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetQueryServicesDescriptorRequest();
  }

  factory GetQueryServicesDescriptorRequest.deserialize(List<int> bytes) {
    return GetQueryServicesDescriptorRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1GetQueryServicesDescriptorRequest;
  @override
  GetQueryServicesDescriptorResponse onQueryResponse(List<int> bytes) {
    return GetQueryServicesDescriptorResponse.deserialize(bytes);
  }

  @override
  GetQueryServicesDescriptorResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return GetQueryServicesDescriptorResponse.fromJson(json);
  }
}

/// GetQueryServicesDescriptorResponse is the response returned by the GetQueryServicesDescriptor RPC
class GetQueryServicesDescriptorResponse extends CosmosProtoMessage {
  /// queries provides information on the available queryable services
  final QueryServicesDescriptor? queries;

  const GetQueryServicesDescriptorResponse({this.queries});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [queries];

  @override
  Map<String, dynamic> toJson() {
    return {'queries': queries?.toJson()};
  }

  factory GetQueryServicesDescriptorResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetQueryServicesDescriptorResponse(
      queries: json.valueTo<QueryServicesDescriptor?, Map<String, dynamic>>(
        key: 'queries',
        parse: (v) => QueryServicesDescriptor.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory GetQueryServicesDescriptorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetQueryServicesDescriptorResponse(
      queries: decode.messageTo<QueryServicesDescriptor?>(
        1,
        (b) => QueryServicesDescriptor.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1GetQueryServicesDescriptorResponse;
}

/// GetTxDescriptorRequest is the request used for the GetTxDescriptor RPC
class GetTxDescriptorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<GetTxDescriptorResponse> {
  const GetTxDescriptorRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/base/reflection/v1beta1/app_descriptor/tx_descriptor",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory GetTxDescriptorRequest.fromJson(Map<String, dynamic> json) {
    return GetTxDescriptorRequest();
  }

  factory GetTxDescriptorRequest.deserialize(List<int> bytes) {
    return GetTxDescriptorRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1GetTxDescriptorRequest;
  @override
  GetTxDescriptorResponse onQueryResponse(List<int> bytes) {
    return GetTxDescriptorResponse.deserialize(bytes);
  }

  @override
  GetTxDescriptorResponse onQueryResponseJson(Map<String, dynamic> json) {
    return GetTxDescriptorResponse.fromJson(json);
  }
}

/// GetTxDescriptorResponse is the response returned by the GetTxDescriptor RPC
class GetTxDescriptorResponse extends CosmosProtoMessage {
  /// tx provides information on msgs that can be forwarded to the application
  /// alongside the accepted transaction protobuf type
  final TxDescriptor? tx;

  const GetTxDescriptorResponse({this.tx});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [tx];

  @override
  Map<String, dynamic> toJson() {
    return {'tx': tx?.toJson()};
  }

  factory GetTxDescriptorResponse.fromJson(Map<String, dynamic> json) {
    return GetTxDescriptorResponse(
      tx: json.valueTo<TxDescriptor?, Map<String, dynamic>>(
        key: 'tx',
        parse: (v) => TxDescriptor.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory GetTxDescriptorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GetTxDescriptorResponse(
      tx: decode.messageTo<TxDescriptor?>(
        1,
        (b) => TxDescriptor.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1GetTxDescriptorResponse;
}

/// QueryServicesDescriptor contains the list of cosmos-sdk queryable services
class QueryServicesDescriptor extends CosmosProtoMessage {
  /// query_services is a list of cosmos-sdk QueryServiceDescriptor
  final List<QueryServiceDescriptor> queryServices;

  const QueryServicesDescriptor({this.queryServices = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [queryServices];

  @override
  Map<String, dynamic> toJson() {
    return {'query_services': queryServices.map((e) => e.toJson()).toList()};
  }

  factory QueryServicesDescriptor.fromJson(Map<String, dynamic> json) {
    return QueryServicesDescriptor(
      queryServices:
          (json.valueEnsureAsList<dynamic>(
                'query_services',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  QueryServiceDescriptor,
                  Map<String, dynamic>
                >(value: e, parse: (v) => QueryServiceDescriptor.fromJson(v)),
              )
              .toList(),
    );
  }

  factory QueryServicesDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryServicesDescriptor(
      queryServices:
          decode
              .getListOfBytes(1)
              .map((b) => QueryServiceDescriptor.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1QueryServicesDescriptor;
}

/// QueryServiceDescriptor describes a cosmos-sdk queryable service
class QueryServiceDescriptor extends CosmosProtoMessage {
  /// fullname is the protobuf fullname of the service descriptor
  final String? fullname;

  /// is_module describes if this service is actually exposed by an application's module
  final bool? isModule;

  /// methods provides a list of query service methods
  final List<QueryMethodDescriptor> methods;

  const QueryServiceDescriptor({
    this.fullname,
    this.isModule,
    this.methods = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bool(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [fullname, isModule, methods];

  @override
  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'is_module': isModule,
      'methods': methods.map((e) => e.toJson()).toList(),
    };
  }

  factory QueryServiceDescriptor.fromJson(Map<String, dynamic> json) {
    return QueryServiceDescriptor(
      fullname: json.valueAsString<String?>('fullname', acceptCamelCase: true),
      isModule: json.valueAsBool<bool?>('is_module', acceptCamelCase: true),
      methods:
          (json.valueEnsureAsList<dynamic>('methods', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  QueryMethodDescriptor,
                  Map<String, dynamic>
                >(value: e, parse: (v) => QueryMethodDescriptor.fromJson(v)),
              )
              .toList(),
    );
  }

  factory QueryServiceDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryServiceDescriptor(
      fullname: decode.getString<String?>(1),
      isModule: decode.getBool<bool?>(2),
      methods:
          decode
              .getListOfBytes(3)
              .map((b) => QueryMethodDescriptor.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1QueryServiceDescriptor;
}

/// QueryMethodDescriptor describes a queryable method of a query service
/// no other info is provided beside method name and tendermint queryable path
/// because it would be redundant with the grpc reflection service
class QueryMethodDescriptor extends CosmosProtoMessage {
  /// name is the protobuf name (not fullname) of the method
  final String? name;

  /// full_query_path is the path that can be used to query
  /// this method via tendermint abci.Query
  final String? fullQueryPath;

  const QueryMethodDescriptor({this.name, this.fullQueryPath});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [name, fullQueryPath];

  @override
  Map<String, dynamic> toJson() {
    return {'name': name, 'full_query_path': fullQueryPath};
  }

  factory QueryMethodDescriptor.fromJson(Map<String, dynamic> json) {
    return QueryMethodDescriptor(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      fullQueryPath: json.valueAsString<String?>(
        'full_query_path',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryMethodDescriptor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMethodDescriptor(
      name: decode.getString<String?>(1),
      fullQueryPath: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosBaseReflectionV2alpha1QueryMethodDescriptor;
}
