import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgAddCodeUploadParamsAddresses is the MsgAddCodeUploadParamsAddresses request type.
class CosmWasmV1AddCodeUploadParamsAddresses
    extends CosmWasm1Beta1Service<EmptyServiceRequestResponse> {
  /// Authority is the address of the governance account.
  final String? authority;
  final List<String>? addresses;

  CosmWasmV1AddCodeUploadParamsAddresses({
    required this.authority,
    required List<String>? addresses,
  }) : addresses = addresses?.immutable;
  factory CosmWasmV1AddCodeUploadParamsAddresses.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1AddCodeUploadParamsAddresses(
      authority: decode.getField(1),
      addresses: decode.getFields<String>(2),
    );
  }
  factory CosmWasmV1AddCodeUploadParamsAddresses.fromJson(
    Map<String, dynamic> json,
  ) {
    return CosmWasmV1AddCodeUploadParamsAddresses(
      authority: json.as("authority"),
      addresses: json.asListOfString("addresses"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"authority": authority, "addresses": addresses};
  }

  @override
  List get values => [authority, addresses];

  @override
  CosmWasmV1Types get typeUrl =>
      CosmWasmV1Types.msgAddCodeUploadParamsAddresses;

  @override
  List<String?> get signers => [authority];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      CosmWasmV1Types.msgAddCodeUploadParamsAddressesResponse,
    );
  }
}
