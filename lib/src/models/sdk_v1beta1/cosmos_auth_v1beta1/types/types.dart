import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class AuthV1beta1Types extends TypeUrl {
  const AuthV1beta1Types._(super.typeUrl, {super.query, super.rpc});
  static const String root = "/cosmos.auth.v1beta1";

  /// messages
  static const AuthV1beta1Types baseAccount =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.BaseAccount");
  static const AuthV1beta1Types queryAccountRequest = AuthV1beta1Types._(
      "/cosmos.auth.v1beta1.QueryAccountRequest",
      query: "/cosmos.auth.v1beta1.Query/Account",
      rpc: "/cosmos/auth/v1beta1/accounts/:address");
  static const AuthV1beta1Types queryAccountResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.QueryAccountResponse");
  static const AuthV1beta1Types addressBytesToStringRequest =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.AddressBytesToStringRequest",
          query: "/cosmos.auth.v1beta1.Query/AddressBytesToString",
          rpc: "/cosmos/auth/v1beta1/bech32/:address_bytes");
  static const AuthV1beta1Types addressBytesToStringResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.AddressBytesToStringResponse");
  static const AuthV1beta1Types addressStringToBytesRequest =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.AddressStringToBytesRequest",
          query: "/cosmos.auth.v1beta1.Query/AddressStringToBytes",
          rpc: "/cosmos/auth/v1beta1/bech32/:address_string");
  static const AuthV1beta1Types addressStringToBytesResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.AddressStringToBytesResponse");
  static const AuthV1beta1Types accountInfoRequest = AuthV1beta1Types._(
      "/cosmos.auth.v1beta1.QueryAccountInfoRequest",
      query: "/cosmos.auth.v1beta1.Query/AccountInfo",
      rpc: "/cosmos/auth/v1beta1/account_info/:address");
  static const AuthV1beta1Types accountInfoResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.QueryAccountInfoResponse");
  static const AuthV1beta1Types bech32PrefixRequest = AuthV1beta1Types._(
      "/cosmos.auth.v1beta1.Bech32PrefixRequest",
      query: "/cosmos.auth.v1beta1.Query/Bech32Prefix",
      rpc: "/cosmos/auth/v1beta1/bech32");
  static const AuthV1beta1Types bech32PrefixResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Bech32PrefixResponse");
  static const AuthV1beta1Types moduleAccountByNameResponse =
      AuthV1beta1Types._(
          "/cosmos.auth.v1beta1.QueryModuleAccountByNameResponse");
  static const AuthV1beta1Types moduleAccountByNameRequest = AuthV1beta1Types._(
      "/cosmos.auth.v1beta1.QueryModuleAccountByNameRequest",
      query: "/cosmos.auth.v1beta1.Query/ModuleAccountByName",
      rpc: "/cosmos/auth/v1beta1/module_accounts/:name");
  static const AuthV1beta1Types moduleAccountsRequest = AuthV1beta1Types._(
      "/cosmos.auth.v1beta1.QueryModuleAccountsRequest",
      query: "/cosmos.auth.v1beta1.Query/ModuleAccounts",
      rpc: "/cosmos/auth/v1beta1/module_accounts");
  static const AuthV1beta1Types moduleAccountsResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.QueryModuleAccountsResponse");
  static const AuthV1beta1Types authParamsRequest = AuthV1beta1Types._(
      "/cosmos.auth.v1beta1.QueryParamsRequest",
      query: "/cosmos.auth.v1beta1.Query/Params",
      rpc: "/cosmos/auth/v1beta1/params");
  static const AuthV1beta1Types authParamsResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.QueryParamsResponse");
  static const AuthV1beta1Types authParams =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Params");
  static const AuthV1beta1Types accountAddressByIDRequest = AuthV1beta1Types._(
      "/cosmos.auth.v1beta1.QueryAccountAddressByIDRequest",
      query: "/cosmos.auth.v1beta1.Query/AccountAddressByID",
      rpc: "/cosmos/auth/v1beta1/address_by_id/:id");
  static const AuthV1beta1Types accountAddressByIDResponse = AuthV1beta1Types._(
      "/cosmos.auth.v1beta1.QueryAccountAddressByIDResponse");
  static const AuthV1beta1Types accountsRequest = AuthV1beta1Types._(
      "/cosmos.auth.v1beta1.QueryAccountsRequest",
      query: "/cosmos.auth.v1beta1.Query/Accounts",
      rpc: "/cosmos/auth/v1beta1/accounts");
  static const AuthV1beta1Types accountsResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.QueryAccountsResponse");
  static const AuthV1beta1Types moduleAccount =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.ModuleAccount");
  static const AuthV1beta1Types moduleCredential =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.ModuleCredential");
  static const AuthV1beta1Types msgUpdateAuthParams =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.MsgUpdateParams");
  static const AuthV1beta1Types msgUpdateParamsResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.MsgUpdateParamsResponse");
  static const AuthV1beta1Types authGenesisState =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.GenesisState");

  static const List<AuthV1beta1Types> values = [
    baseAccount,
    queryAccountRequest,
    queryAccountResponse,
    addressBytesToStringRequest,
    addressBytesToStringResponse,
    addressStringToBytesRequest,
    addressStringToBytesResponse,
    accountInfoRequest,
    accountInfoResponse,
    bech32PrefixRequest,
    bech32PrefixResponse,
    moduleAccountByNameResponse,
    moduleAccountByNameRequest,
    moduleAccountsRequest,
    moduleAccountsResponse,
    authParamsRequest,
    authParamsResponse,
    authParams,
    accountAddressByIDRequest,
    accountAddressByIDResponse,
    accountsRequest,
    accountsResponse,
    moduleAccount,
    moduleCredential,
    msgUpdateAuthParams,
    msgUpdateParamsResponse,
    authGenesisState,
  ];

  static const List<TypeUrl> services = [msgUpdateAuthParams];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }

  static AuthV1beta1Types? findType(String? typeUrl) {
    return values.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
