/// Curated multisig matrix, like [keyAlgs].
///
/// Key: `"${chainId}_${chainName}"`, with fallback to the bare chain name
/// so chain-id upgrades don't invalidate entries.
///
/// The chain-registry does not publish multisig support, so this file is
/// the source of truth. Entries are verified manually (documented
/// `tx multisig` / multisig tooling for the chain). Chains missing here
/// resolve to `unknown` — never guessed.
///
/// Re-assess monthly:
///   dart run chain_registery/builder.dart --detect-multisig --resume
/// then review `build_cache/multisig_detected.json` and promote verified
/// entries here.
const Map<String, List<String>> multisigSupports = {
  "cosmoshub-4_cosmoshub": ["legacyAminoThreshold"],
  "cosmoshub": ["legacyAminoThreshold"],
  "osmosis-1_osmosis": ["legacyAminoThreshold"],
  "osmosis": ["legacyAminoThreshold"],
  "juno-1_juno": ["legacyAminoThreshold"],
  "juno": ["legacyAminoThreshold"],
  "theta-testnet-001_cosmoshubtestnet": ["legacyAminoThreshold"],
  "cosmoshubtestnet": ["legacyAminoThreshold"],
  "osmo-test-5_osmosistestnet": ["legacyAminoThreshold"],
  "osmosistestnet": ["legacyAminoThreshold"],
};
