import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/message/any.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'package:cosmos_sdk/src/protobuf/codec/encoder.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:blockchain_utils/service/models/params.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
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
        },
      );
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
  String get toHex => BytesUtils.toHexString(toBuffer());
  String get toBase64 =>
      StringUtils.decode(toBuffer(), type: StringEncoding.base64);
  static List<ProtocolBufferDecoderResult> decode(List<int> bytes) {
    return ProtocolBufferDecoder.decode(bytes);
  }

  @override
  String toString() {
    return "$runtimeType${toJson()}";
  }
}

abstract class TypeUrl {
  const TypeUrl(
    this.typeUrl, {
    this.aminoType,
    this.rpc,
    this.query,
    this.method = RequestServiceType.get,
  });
  final String typeUrl;
  final String? rpc;
  final String? query;
  final String? aminoType;
  final RequestServiceType method;

  String rpcUrl({List<dynamic> pathParameters = const []}) {
    if (rpc == null) {
      throw DartCosmosSdkPluginException(
        "RPC not supported",
        details: {"type": typeUrl},
      );
    }
    final paths = CosmosUtils.extractParams(rpc!);
    String params = rpc!;
    for (int i = 0; i < pathParameters.length; i++) {
      params = params.replaceFirst(paths[i], pathParameters[i].toString());
    }
    return params;
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
  Response onResponse(List<int> bytes);
  Response onJsonResponse(Map<String, dynamic> json);
  Map<String, String?> get queryParameters => {};
  List<String> get pathParameters => [];
  Map<String, dynamic> get body => {};
}

enum AminoTypes {
  msgTransfer("cosmos-sdk/MsgTransfer"),
  msgSend("cosmos-sdk/MsgSend"),
  msgMultiSend("cosmos-sdk/MsgMultiSend"),
  msgVerifyInvariant("cosmos-sdk/MsgVerifyInvariant"),
  msgModifyWithdrawAddress("cosmos-sdk/MsgModifyWithdrawAddress"),
  msgWithdrawDelegationReward("cosmos-sdk/MsgWithdrawDelegationReward"),
  msgWithdrawValidatorCommission("cosmos-sdk/MsgWithdrawValidatorCommission"),
  msgFundCommunityPool("cosmos-sdk/MsgFundCommunityPool"),
  msgVote("cosmos-sdk/MsgVote"),
  msgDeposit("cosmos-sdk/MsgDeposit"),
  msgUnjail("cosmos-sdk/MsgUnjail"),
  msgBeginRedelegate("cosmos-sdk/MsgBeginRedelegate"),
  msgCreateValidator("cosmos-sdk/MsgCreateValidator"),
  msgDelegate("cosmos-sdk/MsgDelegate"),
  msgEditValidator("cosmos-sdk/MsgEditValidator"),
  msgUndelegate("cosmos-sdk/MsgUndelegate"),
  msgCreateVestingAccount("cosmos-sdk/MsgCreateVestingAccount"),
  cctp("cctp"),
  evmos("evmos"),
  ethermint("ethermint"),
  // initia("/initia"),
  ophost("ophost");

  const AminoTypes(this.type);
  final String type;
  static AminoTypes? fromType(String? type) {
    if (type == null) return null;
    return values.firstWhereNullable((e) => e.type.startsWith(type));
  }
}

mixin AminoMessage<Response extends CosmosMessage> on ServiceMessage<Response> {
  static AminoMessage fromJson(Map<String, dynamic> json) {
    final typeStr = json.as<String>(
      "type",
      onError: (notfound) {
        if (notfound) {
          return AminoJsonParserException(
            "Invalid amino message: 'type' field is missing.",
          );
        }
        return AminoJsonParserException(
          "Invalid amino message: 'type' field must be a valid string.",
        );
      },
    );
    final Map<String, dynamic> value = json.asMap(
      "value",
      onError: (notfound) {
        if (notfound) {
          return AminoJsonParserException(
            "Invalid amino message: 'value' field is missing.",
          );
        }
        return AminoJsonParserException(
          "Invalid amino message: 'value' field must be a valid object.",
        );
      },
    );

    final type = AminoTypes.fromType(typeStr);
    if (type == null) {
      return UnknownAminoService(value: value, aminoType: typeStr);
    }
    return switch (type) {
          AminoTypes.msgTransfer => MsgTransfer.fromJson(value),
          AminoTypes.msgSend => MsgSend.fromJson(value),
          AminoTypes.msgMultiSend => MsgMultiSend.fromJson(json),
          AminoTypes.msgVerifyInvariant => MsgVerifyInvariant.fromJson(json),
          AminoTypes.msgModifyWithdrawAddress =>
            DistributionMsgSetWithdrawAddress.fromJson(json),
          AminoTypes.msgWithdrawDelegationReward =>
            DistributionMsgWithdrawDelegatorReward.fromJson(json),
          AminoTypes.msgWithdrawValidatorCommission =>
            DistributionMsgWithdrawValidatorCommission.fromJson(json),
          AminoTypes.msgFundCommunityPool =>
            DistributionMsgFundCommunityPool.fromJson(json),
          AminoTypes.msgVote => GovMsgVote.fromJson(json),
          AminoTypes.msgDeposit => GovMsgDeposit.fromJson(json),
          AminoTypes.msgUnjail => SlashingMsgUnjail.fromJson(json),
          AminoTypes.msgBeginRedelegate => MsgBeginRedelegate.fromJson(json),
          AminoTypes.msgCreateValidator => MsgCreateValidator.fromJson(json),
          AminoTypes.msgDelegate => MsgDelegate.fromJson(json),
          AminoTypes.msgEditValidator => MsgEditValidator.fromJson(json),
          AminoTypes.msgUndelegate => MsgUndelegate.fromJson(json),
          AminoTypes.msgCreateVestingAccount =>
            MsgCreateVestingAccount.fromJson(json),
          AminoTypes.cctp => CCTPV1Service.fromJson(
            typeUrl: typeStr,
            json: json,
            amino: true,
          ),
          AminoTypes.evmos || AminoTypes.ethermint => EvmosService.fromJson(
            typeUrl: typeStr,
            json: json,
            amino: true,
          ),
          AminoTypes.ophost => OpInitService.fromJson(
            typeUrl: typeStr,
            json: json,
            amino: true,
          ),
        }
        as AminoMessage;
  }

  String get aminoType => typeUrl.aminoType!;
  Map<String, dynamic> toAminoJson() {
    return {
      "type": aminoType,
      "value": toJson()..removeWhere((k, v) => v == null),
    };
  }
}

abstract class ServiceMessage<Response extends CosmosMessage>
    extends CosmosMessage {
  const ServiceMessage();
  abstract final List<String?> signers;
  Response onResponse(List<int> bytes);
  static T? fromJson<T extends ServiceMessage>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final String root = typeUrl.substring(0, typeUrl.indexOf('.'));
    return switch (root) {
      CosmWasm1Beta1Service.root => CosmWasm1Beta1Service.fromJson(
        typeUrl: typeUrl,
        json: json,
      ),
      IbcService.root => IbcService.fromJson(typeUrl: typeUrl, json: json),
      EvmosService.evmosRoot || EvmosService.ethermintRoot =>
        EvmosService.fromJson(typeUrl: typeUrl, json: json),
      CosmosSDKService.root => CosmosSDKService.fromJson(
        typeUrl: typeUrl,
        json: json,
      ),
      OsmosisService.root => OsmosisService.fromJson(
        typeUrl: typeUrl,
        json: json,
      ),
      InitiaService.root => InitiaService.fromJson(
        typeUrl: typeUrl,
        json: json,
      ),
      CCTPV1Service.root => CCTPV1Service.fromJson<T>(
        typeUrl: typeUrl,
        json: json,
      ),
      OpInitService.root => OpInitService.fromJson(
        typeUrl: typeUrl,
        json: json,
      ),
      _ => null,
    };
  }

  static T? deserialize<T extends ServiceMessage>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final String root = typeUrl.substring(0, typeUrl.indexOf('.'));
    return switch (root) {
      CosmWasm1Beta1Service.root => CosmWasm1Beta1Service.deserialize<T>(
        typeUrl: typeUrl,
        bytes: bytes,
      ),
      IbcService.root => IbcService.deserialize<T>(
        typeUrl: typeUrl,
        bytes: bytes,
      ),
      EvmosService.evmosRoot || EvmosService.ethermintRoot =>
        EvmosService.deserialize(typeUrl: typeUrl, bytes: bytes),
      CosmosSDKService.root => CosmosSDKService.deserialize<T>(
        typeUrl: typeUrl,
        bytes: bytes,
      ),
      OsmosisService.root => OsmosisService.deserialize<T>(
        typeUrl: typeUrl,
        bytes: bytes,
      ),
      CCTPV1Service.root => CCTPV1Service.deserialize(
        typeUrl: typeUrl,
        bytes: bytes,
      ),
      InitiaService.root => InitiaService.deserialize(
        typeUrl: typeUrl,
        bytes: bytes,
      ),
      OpInitService.root => OpInitService.deserialize(
        typeUrl: typeUrl,
        bytes: bytes,
      ),
      _ => null,
    };
  }
}
