class TendermintRequestOrderingResponse {
  const TendermintRequestOrderingResponse._(this.name);
  final String name;
  static const TendermintRequestOrderingResponse asc =
      TendermintRequestOrderingResponse._("asc");
  static const TendermintRequestOrderingResponse desc =
      TendermintRequestOrderingResponse._("desc");
}
