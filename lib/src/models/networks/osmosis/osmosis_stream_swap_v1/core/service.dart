import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/services/msg_create_sale.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/services/msg_exit_sale.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/services/msg_finalize_sale.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/services/msg_subscribe.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/services/msg_withdraw.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisStreamSwapV1<T extends CosmosMessage>
    extends OsmosisService<T> {
  const OsmosisStreamSwapV1();

  static T? fromJson<T extends OsmosisStreamSwapV1>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = OsmosisStreamSwapV1Types.findService(typeUrl);
    final OsmosisStreamSwapV1? service =
        switch (type) {
              OsmosisStreamSwapV1Types.msgCreateSale =>
                OsmosisStreamSwapMsgCreateSale.fromJson(json),
              OsmosisStreamSwapV1Types.msgExitSale =>
                OsmosisStreamSwapMsgExitSale.fromJson(json),
              OsmosisStreamSwapV1Types.msgFinalizeSale =>
                OsmosisStreamSwapMsgFinalizeSale.fromJson(json),
              OsmosisStreamSwapV1Types.msgSubscribe =>
                OsmosisStreamSwapMsgSubscribe.fromJson(json),
              OsmosisStreamSwapV1Types.msgWithdraw =>
                OsmosisStreamSwapMsgWithdraw.fromJson(json),
              _ => null,
            }
            as OsmosisStreamSwapV1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid StreamSwapV1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends OsmosisStreamSwapV1>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = OsmosisStreamSwapV1Types.findService(typeUrl);
    final OsmosisStreamSwapV1? service =
        switch (type) {
              OsmosisStreamSwapV1Types.msgCreateSale =>
                OsmosisStreamSwapMsgCreateSale.deserialize(bytes),
              OsmosisStreamSwapV1Types.msgExitSale =>
                OsmosisStreamSwapMsgExitSale.deserialize(bytes),
              OsmosisStreamSwapV1Types.msgFinalizeSale =>
                OsmosisStreamSwapMsgFinalizeSale.deserialize(bytes),
              OsmosisStreamSwapV1Types.msgSubscribe =>
                OsmosisStreamSwapMsgSubscribe.deserialize(bytes),
              OsmosisStreamSwapV1Types.msgWithdraw =>
                OsmosisStreamSwapMsgWithdraw.deserialize(bytes),
              _ => null,
            }
            as OsmosisStreamSwapV1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid StreamSwapV1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
