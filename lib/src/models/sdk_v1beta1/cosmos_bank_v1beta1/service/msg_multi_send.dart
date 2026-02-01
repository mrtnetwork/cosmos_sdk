import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/core/service.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import '../messages/input.dart';
import '../messages/output.dart';

/// MsgMultiSend represents an arbitrary multi-in, multi-out send message.
class MsgMultiSend extends BankV1Beta1Service<EmptyServiceRequestResponse>
    with AminoMessage<EmptyServiceRequestResponse> {
  /// Inputs, despite being `repeated`, only allows one sender input. This is
  /// checked in MsgMultiSend's ValidateBasic.
  final List<Input> inputs;
  final List<Output> outputs;

  factory MsgMultiSend.fromJson(Map<String, dynamic> json) {
    return MsgMultiSend(
      outputs:
          json.asListOfMap("outputs")!.map((e) => Output.fromJson(e)).toList(),
      inputs:
          json.asListOfMap("inputs")!.map((e) => Input.fromJson(e)).toList(),
    );
  }

  MsgMultiSend({required List<Input> inputs, required List<Output> outputs})
    : inputs = inputs.immutable,
      outputs = outputs.immutable;
  factory MsgMultiSend.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgMultiSend(
      inputs:
          decode
              .getFields<List<int>>(1)
              .map((e) => Input.deserialize(e))
              .toList(),
      outputs:
          decode
              .getFields<List<int>>(2)
              .map((e) => Output.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "inputs": inputs.map((e) => e.toJson()).toList(),
      "outputs": outputs.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List get values => [inputs, outputs];

  @override
  @override
  TypeUrl get typeUrl => BankV1beta1Types.msgMultiSend;

  @override
  List<String?> get signers => inputs.map((e) => e.address.address).toList();
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(BankV1beta1Types.msgMultiSendResponse);
  }
}
