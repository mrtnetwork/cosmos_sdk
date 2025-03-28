import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/initia/core/service.dart';
import 'package:cosmos_sdk/src/models/initia/move_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

// MsgExecute is the message to execute the given module function
class InitiaMoveV1MsgExecute
    extends InitiaService<EmptyServiceRequestResponse> {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// ModuleAddr is the address of the module deployer
  final String? moduleAddress;

  /// ModuleName is the name of module to execute
  final String? moduleName;

  /// FunctionName is the name of a function to execute
  final String? functionName;

  /// TypeArgs is the type arguments of a function to execute
  /// ex) "0x1::BasicCoin::Initia", "bool", "u8", "u64"
  final List<String>? typeArgs;

  /// Args is the arguments of a function to execute
  /// - number: little endian
  /// - string: base64 bytes
  final List<List<int>>? args;

  InitiaMoveV1MsgExecute(
      {this.sender,
      this.moduleAddress,
      this.moduleName,
      this.functionName,
      List<String>? typeArgs,
      List<List<int>>? args})
      : typeArgs = typeArgs?.immutable,
        args = args?.map((e) => e.asImmutableBytes).toImutableList;

  factory InitiaMoveV1MsgExecute.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InitiaMoveV1MsgExecute(
        sender: decode.getField(1),
        moduleAddress: decode.getField(2),
        moduleName: decode.getField(3),
        functionName: decode.getField(4),
        typeArgs: decode.getFields<String>(5),
        args: decode.getFields<List<int>>(6));
  }
  factory InitiaMoveV1MsgExecute.fromJson(Map<String, dynamic> json) {
    return InitiaMoveV1MsgExecute(
        sender: json.as("sender"),
        moduleAddress: json.as("module_address"),
        moduleName: json.as("module_name"),
        functionName: json.as("function_name"),
        typeArgs: json.asListOfString("type_args", throwOnNull: false),
        args: json
            .asListOfString("args", throwOnNull: false)!
            .map((e) => CosmosUtils.toBytes(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "module_name": moduleName,
      "module_address": moduleAddress,
      "function_name": functionName,
      "type_args": typeArgs?.emptyAsNull ?? [],
      "args": args?.emptyAsNull?.map(CosmosUtils.toBase64).toList()
    };
  }

  @override
  TypeUrl get typeUrl => InitiaMoveV1Types.msgExecute;

  @override
  List get values =>
      [sender, moduleAddress, moduleName, functionName, typeArgs, args];
  @override
  List<String?> get signers => [sender];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(InitiaMoveV1Types.msgExecuteResponse);
  }
}
