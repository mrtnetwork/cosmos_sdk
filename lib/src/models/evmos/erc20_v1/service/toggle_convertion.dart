import 'package:cosmos_sdk/src/models/evmos/core/service.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgToggleConversion is the Msg/MsgToggleConversion request type for toggling
/// an Erc20 contract conversion capability.
class EvmosErc20V1MsgToggleConversion
    extends EvmosService<EmptyServiceRequestResponse> with AminoMessage {
  /// authority is the address of the governance account
  final String? authority;

  /// token identifier can be either the hex contract address of the ERC20 or the
  /// Cosmos base denomination
  final String? token;

  const EvmosErc20V1MsgToggleConversion(
      {required this.authority, required this.token});

  factory EvmosErc20V1MsgToggleConversion.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosErc20V1MsgToggleConversion(
        authority: decode.getField(1), token: decode.getField(2));
  }
  factory EvmosErc20V1MsgToggleConversion.fromJson(Map<String, dynamic> json) {
    return EvmosErc20V1MsgToggleConversion(
        authority: json.as("authority"), token: json.as("token"));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"authority": authority, "token": token};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.msgToggleConversion;

  @override
  List get values => [authority, token];
  @override
  List<String?> get signers => [authority];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        EvmosErc20V1Types.msgToggleConversionResponse);
  }
}
