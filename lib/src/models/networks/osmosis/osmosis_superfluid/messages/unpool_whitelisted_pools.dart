import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisSuperfluidUnpoolWhitelistedPools extends CosmosMessage {
  final List<BigInt> ids;
  const OsmosisSuperfluidUnpoolWhitelistedPools({required this.ids});
  factory OsmosisSuperfluidUnpoolWhitelistedPools.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidUnpoolWhitelistedPools(
        ids: decode
                .getResult<ProtocolBufferDecoderResult?>(1)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"ids": ids.map((e) => e.toString()).toList()};
  }

  @override
  String get typeUrl => OsmosisSuperfluidTypes.unpoolWhitelistedPools.typeUrl;

  @override
  List get values => [ids];
}
