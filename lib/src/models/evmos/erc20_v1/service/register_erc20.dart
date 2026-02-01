import 'package:cosmos_sdk/src/models/evmos/core/service.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgRegisterERC20 is the Msg/RegisterERC20 request type for registering
/// an Erc20 contract token pair.
class EvmosErc20V1MsgRegisterERC20
    extends EvmosService<EmptyServiceRequestResponse>
    with AminoMessage {
  /// authority is the address of the governance account
  final String? authority;

  /// erc20addresses is a slice of ERC20 token contract hex addresses
  final List<String>? erc20addresses;

  const EvmosErc20V1MsgRegisterERC20({
    required this.authority,
    required this.erc20addresses,
  });

  factory EvmosErc20V1MsgRegisterERC20.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosErc20V1MsgRegisterERC20(
      authority: decode.getField(1),
      erc20addresses: decode.getFields<String>(2),
    );
  }
  factory EvmosErc20V1MsgRegisterERC20.fromJson(Map<String, dynamic> json) {
    return EvmosErc20V1MsgRegisterERC20(
      authority: json.as("authority"),
      erc20addresses: json.asListOfString("erc20addresses", throwOnNull: false),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"authority": authority, "erc20addresses": erc20addresses};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.msgRegisterERC20;

  @override
  List get values => [authority, erc20addresses];
  @override
  List<String?> get signers => [authority];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      EvmosErc20V1Types.msgRegisterERC20Response,
    );
  }
}
