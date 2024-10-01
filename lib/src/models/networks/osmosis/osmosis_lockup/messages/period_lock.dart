import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';

/// PeriodLock is a single lock unit by period defined by the x/lockup module.
/// It's a record of a locked coin at a specific time. It stores owner, duration,
/// unlock time and the number of coins locked. A state of a period lock is created
/// upon lock creation, and deleted once the lock has been matured after the duration
/// has passed since unbonding started.
class OsmosisLockupPeriodLock extends CosmosMessage {
  /// ID is the unique id of the lock.
  /// The ID of the lock is decided upon lock creation, incrementing by 1 for
  /// every lock.
  final BigInt? id;

  /// Owner is the account address of the lock owner.
  /// Only the owner can modify the state of the lock.
  final String? owner;

  /// Duration is the time needed for a lock to mature after unlocking has
  /// started.
  final ProtobufDuration duration;

  /// EndTime refers to the time at which the lock would mature and get deleted.
  /// This value is first initialized when an unlock has started for the lock,
  /// end time being block time + duration.
  final ProtobufTimestamp endTime;

  /// Coins are the tokens locked within the lock, kept in the module account.
  final List<Coin> coins;
  OsmosisLockupPeriodLock(
      {this.id,
      this.owner,
      required this.duration,
      required this.endTime,
      required List<Coin> coins})
      : coins = coins.immutable;

  factory OsmosisLockupPeriodLock.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupPeriodLock(
      id: decode.getField(1),
      owner: decode.getField(2),
      duration: ProtobufDuration.deserialize(decode.getField(3)),
      endTime: ProtobufTimestamp.deserialize(decode.getField(4)),
      coins: decode.getFields(5).map((e) => Coin.deserialize(e)).toList(),
    );
  }
  factory OsmosisLockupPeriodLock.fromRpc(Map<String, dynamic> json) {
    return OsmosisLockupPeriodLock(
      id: BigintUtils.tryParse(json["ID"]),
      owner: json["owner"],
      duration: ProtobufDuration.fromString(json["duration"]),
      endTime: ProtobufTimestamp.fromString(json["end_time"]),
      coins:
          (json["coins"] as List?)?.map((e) => Coin.deserialize(e)).toList() ??
              <Coin>[],
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "ID": id?.toString(),
      "owner": owner,
      "duration": duration.toJson(),
      "end_time": endTime.toJson(),
      "coins": coins.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisLockupTypes.periodLock.typeUrl;

  @override
  List get values => [id, owner, duration, endTime, coins];
}
