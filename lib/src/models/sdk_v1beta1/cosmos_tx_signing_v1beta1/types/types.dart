class TxSigningV1beta1Types {
  final String typeUrl;
  const TxSigningV1beta1Types._(this.typeUrl);

  static const TxSigningV1beta1Types single = TxSigningV1beta1Types._(
      "/cosmos.tx.signing.v1beta1.SignatureDescriptor.Data.Single");
  static const TxSigningV1beta1Types multi = TxSigningV1beta1Types._(
      "cosmos.tx.signing.v1beta1.SignatureDescriptor.Data.Multi");
  static const TxSigningV1beta1Types data = TxSigningV1beta1Types._(
      "cosmos.tx.signing.v1beta1.SignatureDescriptor.Data");
  static const TxSigningV1beta1Types signatureDescriptor =
      TxSigningV1beta1Types._("cosmos.tx.signing.v1beta1.SignatureDescriptor");
  static const TxSigningV1beta1Types signatureDescriptors =
      TxSigningV1beta1Types._("cosmos.tx.signing.v1beta1.SignatureDescriptors");
}
