class ThorChainContractResponse {
  final String chain;
  final String router;

  const ThorChainContractResponse({required this.chain, required this.router});

  factory ThorChainContractResponse.fromJson(Map<String, dynamic> json) {
    return ThorChainContractResponse(
      chain: json['chain'],
      router: json['router'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'chain': chain, 'router': router};
  }
}
