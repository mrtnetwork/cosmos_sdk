import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import '../messages/input.dart';
import '../messages/output.dart';

/// MsgMultiSend represents an arbitrary multi-in, multi-out send message.
class MsgMultiSend extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// Inputs, despite being `repeated`, only allows one sender input. This is
  /// checked in MsgMultiSend's ValidateBasic.
  final List<Input> inputs;
  final List<Output> outputs;

  const MsgMultiSend({
    required this.inputs,
    required this.outputs,
  });
  factory MsgMultiSend.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgMultiSend(
        inputs: decode
            .getFileds<List<int>>(1)
            .map((e) => Input.deserialize(e))
            .toList(),
        outputs: decode
            .getFileds<List<int>>(2)
            .map((e) => Output.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "inputs": inputs.map((e) => e.toJson()).toList(),
      "outputs": outputs.map((e) => e.toJson()).toList()
    };
  }

  @override
  List get values => [inputs, outputs];

  @override
  @override
  String get typeUrl => BankV1beta1Types.msgMultiSend.typeUrl;

  @override
  String get service => BankV1beta1Types.multiSend.typeUrl;

  @override
  List<String?> get signers => inputs.map((e) => e.address.address).toList();
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        BankV1beta1Types.msgMultiSendResponse.typeUrl);
  }
}
