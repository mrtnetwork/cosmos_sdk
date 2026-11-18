import 'utils.dart';
import 'backend_identity_test.dart' as f7;
import 'address_test.dart' as f0;
import 'encoding_request_params_test.dart' as f1;
import 'exception_test.dart' as f2;
import 'multisig_address_test.dart' as f3;
import 'serialization_test.dart' as f4;
import 'serrialization_object_test.dart' as f5;
import 'ccr_chain/ccr_test.dart' as f6;

Future<void> runOneShotSuite() async {
  CosmosTestApi.runTest(() {
    f7.backendIdentityTest();
    f0.addressTest();
    f1.encodingRequestParamsTest();
    f2.exceptionTest();
    f3.multisigAddressTest();
    f4.serializationTest();
    f5.serializationObjectTest();
    f6.ccrTest();
  }, 'Cosmos One Shot');
}
