import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class ThorchainV1Service<T extends CosmosMessage>
    extends ServiceMessage<T> {
  const ThorchainV1Service();
}
