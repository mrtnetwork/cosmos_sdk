import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/models/evmos/core/service.dart';

/// MsgConvertERC20 defines a Msg to convert a ERC20 token to a native Cosmos
/// coin.
class EvmosErc20V1MsgConvertERC20
    extends EvmosService<EmptyServiceRequestResponse>
    with AminoMessage {
  /// contract_address of an ERC20 token contract, that is registered in a token pair
  final String? contractAddress;

  /// amount of ERC20 tokens to convert
  final String? amount;

  /// receiver is the bech32 address to receive native Cosmos coins
  final String? receiver;

  /// sender is the hex address from the owner of the given ERC20 tokens
  final String? sender;

  const EvmosErc20V1MsgConvertERC20({
    required this.contractAddress,
    required this.amount,
    required this.receiver,
    required this.sender,
  });

  factory EvmosErc20V1MsgConvertERC20.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosErc20V1MsgConvertERC20(
      contractAddress: decode.getField(1),
      amount: decode.getField(2),
      receiver: decode.getField(3),
      sender: decode.getField(4),
    );
  }
  factory EvmosErc20V1MsgConvertERC20.fromJson(Map<String, dynamic> json) {
    return EvmosErc20V1MsgConvertERC20(
      contractAddress: json.as("contract_address"),
      amount: json.as("amount"),
      receiver: json.as("receiver"),
      sender: json.as("sender"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "contract_address": contractAddress,
      "amount": amount,
      "receiver": receiver,
      "sender": sender,
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.msgConvertERC20;

  @override
  List get values => [contractAddress, amount, receiver, sender];
  @override
  List<String?> get signers => [sender];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      EvmosErc20V1Types.msgConvertERC20Response,
    );
  }
}
