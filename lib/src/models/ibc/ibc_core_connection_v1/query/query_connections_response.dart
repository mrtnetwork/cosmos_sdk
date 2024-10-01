import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/identified_connection.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class IbcCOnnectionQueryConnectionsResponse extends CosmosMessage {
  final List<IbcConnectionIdentifiedConnection>? connections;
  final PageResponse? pagination;
  final IbcClientHeight height;
  IbcCOnnectionQueryConnectionsResponse(
      {List<IbcConnectionIdentifiedConnection>? connections,
      this.pagination,
      required this.height})
      : connections = connections?.emptyAsNull?.immutable;
  factory IbcCOnnectionQueryConnectionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcCOnnectionQueryConnectionsResponse(
      connections: decode
          .getFields(1)
          .map((e) => IbcConnectionIdentifiedConnection.deserialize(e))
          .toList(),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
      height: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "connections": connections?.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson(),
      "height": height.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.ibcConnectionQueryConnectionsResponse.typeUrl;

  @override
  List get values => [connections, pagination, height];
}
