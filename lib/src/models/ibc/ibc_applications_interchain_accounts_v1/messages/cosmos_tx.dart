import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'package:blockchain_utils/helper/helper.dart';

/// CosmosTx contains a list of sdk.Msg's. It should be used
/// when sending transactions to an SDK host chain.
class CosmosTx extends CosmosMessage {
  final List<Any>? messages;
  CosmosTx({List<Any>? messages}) : messages = messages?.emptyAsNull?.immutable;
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"messages": messages?.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl => IbcTypes.cosmosTx.typeUrl;

  @override
  List get values => [messages];
}
