import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/commit.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/header.dart';

class SignedHeader extends CosmosMessage {
  final Header? header;
  final Commit? commit;
  const SignedHeader({this.header, this.commit});
  factory SignedHeader.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SignedHeader(
        header: decode
            .getResult(1)
            ?.to<Header, List<int>>((e) => Header.deserialize(e)),
        commit: decode
            .getResult(2)
            ?.to<Commit, List<int>>((e) => Commit.deserialize(e)));
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"header": header?.toJson(), "commit": commit?.toJson()};
  }

  @override
  String get typeUrl => TendermintTypes.tendermintSignedHeader.typeUrl;

  @override
  List get values => [header, commit];
}
