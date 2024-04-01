class AuthV1beta1Types {
  final String typeUrl;
  const AuthV1beta1Types._(this.typeUrl);

  /// messages
  static const AuthV1beta1Types baseAccount =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.BaseAccount");
  static const AuthV1beta1Types queryAccountRequest =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.QueryAccountRequest");
  static const AuthV1beta1Types queryAccountResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.QueryAccountResponse");
  static const AuthV1beta1Types addressBytesToStringRequest =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.AddressBytesToStringRequest");
  static const AuthV1beta1Types addressBytesToStringResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.AddressBytesToStringResponse");
  static const AuthV1beta1Types addressStringToBytesRequest =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.AddressStringToBytesRequest");
  static const AuthV1beta1Types addressStringToBytesResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.AddressStringToBytesResponse");
  static const AuthV1beta1Types accountInfoRequest =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.QueryAccountInfoRequest");
  static const AuthV1beta1Types accountInfoResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.QueryAccountInfoResponse");
  static const AuthV1beta1Types bech32PrefixRequest =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Bech32PrefixRequest");
  static const AuthV1beta1Types bech32PrefixResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Bech32PrefixResponse");
  static const AuthV1beta1Types moduleAccountByNameResponse =
      AuthV1beta1Types._(
          "/cosmos.auth.v1beta1.QueryModuleAccountByNameResponse");
  static const AuthV1beta1Types moduleAccountByNameRequest = AuthV1beta1Types._(
      "/cosmos.auth.v1beta1.QueryModuleAccountByNameRequest");
  static const AuthV1beta1Types moduleAccountsRequest =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.QueryModuleAccountsRequest");
  static const AuthV1beta1Types moduleAccountsResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.QueryModuleAccountsResponse");
  static const AuthV1beta1Types authParamsRequest =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.QueryParamsRequest");
  static const AuthV1beta1Types authParamsResponse =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.QueryParamsResponse");
  static const AuthV1beta1Types authParams =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Params");
  static const AuthV1beta1Types accountAddressByIDRequest =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.QueryAccountAddressByIDRequest");
  static const AuthV1beta1Types accountAddressByIDResponse = AuthV1beta1Types._(
      "/cosmos.auth.v1beta1.QueryAccountAddressByIDResponse");
  static const AuthV1beta1Types accountsRequest =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.QueryAccountsRequest");
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

  /// query
  static const AuthV1beta1Types account =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Query/Account");
  static const AuthV1beta1Types accounts =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Query/Accounts");
  static const AuthV1beta1Types addressBytesToString =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Query/AddressBytesToString");
  static const AuthV1beta1Types addressStringToBytes =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Query/AddressStringToBytes");
  static const AuthV1beta1Types accountInfo =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Query/AccountInfo");
  static const AuthV1beta1Types bech32Prefix =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Query/Bech32Prefix");
  static const AuthV1beta1Types moduleAccountByName =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Query/ModuleAccountByName");
  static const AuthV1beta1Types moduleAccounts =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Query/ModuleAccounts");
  static const AuthV1beta1Types authQueryParams =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Query/Params");
  static const AuthV1beta1Types accountAddressByID =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Query/AccountAddressByID");

  /// msg
  static const AuthV1beta1Types updateParams =
      AuthV1beta1Types._("/cosmos.auth.v1beta1.Msg/UpdateParams");
}
