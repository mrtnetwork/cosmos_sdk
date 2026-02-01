import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/messages/class.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'entry.dart';

/// GenesisState defines the nft module's genesis state.
class NFTGenesisState extends CosmosMessage {
  /// class defines the class of the nft type.
  final List<NFTClass> classes;

  /// entry defines all nft owned by a person.
  final List<Entry> entries;

  NFTGenesisState({
    required List<NFTClass> classes,
    required List<Entry> entries,
  }) : classes = classes.immutable,
       entries = entries.immutable;
  factory NFTGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return NFTGenesisState(
      classes:
          decode
              .getFields<List<int>>(1)
              .map((e) => NFTClass.deserialize(e))
              .toList(),
      entries:
          decode
              .getFields<List<int>>(2)
              .map((e) => Entry.deserialize(e))
              .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'classes': classes.map((c) => c.toJson()).toList(),
      'entries': entries.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.nFTGenesisState;

  @override
  List get values => [classes, entries];
}
