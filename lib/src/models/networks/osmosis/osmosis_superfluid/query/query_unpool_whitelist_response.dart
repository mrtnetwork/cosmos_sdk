import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisSuperfluidQueryUnpoolWhitelistResponse extends CosmosMessage {
  final List<BigInt>? poolIds;
  OsmosisSuperfluidQueryUnpoolWhitelistResponse({List<BigInt>? poolIds})
      : poolIds = poolIds?.emptyAsNull?.immutable;
  factory OsmosisSuperfluidQueryUnpoolWhitelistResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidQueryUnpoolWhitelistResponse(
        poolIds: decode
                .getResult<ProtocolBufferDecoderResult?>(1)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[]);
  }
  factory OsmosisSuperfluidQueryUnpoolWhitelistResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidQueryUnpoolWhitelistResponse(
        poolIds: (json["pool_ids"] as List?)
                ?.map((e) => BigintUtils.parse(e))
                .toList() ??
            <BigInt>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pool_ids": poolIds?.map((e) => e.toString()).toList()};
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.queryUnpoolWhitelistResponse;

  @override
  List get values => [poolIds];
}
