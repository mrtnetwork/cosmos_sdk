final chainjs = {
  "#schema": "../chain.schema.json",
  "chain_name": "osmosis",
  "status": "live",
  "network_type": "mainnet",
  "website": "https://osmosis.zone/",
  "pretty_name": "Osmosis",
  "chain_type": "cosmos",
  "chain_id": "osmosis-1",
  "bech32_prefix": "osmo",
  "daemon_name": "osmosisd",
  "node_home": "#HOME/.osmosisd",
  "key_algos": ["secp256k1"],
  "slip44": 118,
  "fees": {
    "fee_tokens": [
      {
        "denom": "uosmo",
        "fixed_min_gas_price": 0.0025,
        "low_gas_price": 0.0025,
        "average_gas_price": 0.025,
        "high_gas_price": 0.04
      }
    ]
  },
  "staking": {
    "staking_tokens": [
      {"denom": "uosmo"}
    ],
    "lock_duration": {"time": "1209600s"}
  },
  "codebase": {
    "git_repo": "https://github.com/osmosis-labs/osmosis",
    "genesis": {
      "name": "v3",
      "genesis_url":
          "https://github.com/osmosis-labs/networks/raw/main/osmosis-1/genesis.json"
    },
    "recommended_version": "v25.0.0",
    "compatible_versions": ["v25.0.0"],
    "consensus": {
      "type": "cometbft",
      "version": "v0.37.4",
      "repo": "https://github.com/osmosis-labs/cometbft",
      "tag": "v25-osmo-2"
    },
    "binaries": {
      "linux/amd64":
          "https://github.com/osmosis-labs/osmosis/releases/download/v25.0.0/osmosisd-25.0.0-linux-amd64",
      "linux/arm64":
          "https://github.com/osmosis-labs/osmosis/releases/download/v25.0.0/osmosisd-25.0.0-linux-arm64"
    },
    "language": {"type": "go", "version": "1.21.4"},
    "sdk": {
      "type": "cosmos",
      "repo": "https://github.com/osmosis-labs/cosmos-sdk",
      "version": "v0.47.5",
      "tag": "v0.47.5-v25-osmo-1"
    },
    "ibc": {
      "type": "go",
      "version": "v7.4.0",
      "ics_enabled": ["ics20-1"]
    },
    "cosmwasm": {
      "version": "v0.45.0",
      "repo": "https://github.com/osmosis-labs/wasmd",
      "tag": "v0.45.0-osmo",
      "enabled": true
    }
  },
  "images": [
    {
      "image_sync": {"chain_name": "osmosis", "base_denom": "uosmo"},
      "svg":
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/osmosis/images/osmo.svg",
      "png":
          "https://raw.githubusercontent.com/cosmos/chain-registry/master/osmosis/images/osmo.png",
      "theme": {"primary_color_hex": "#760dbb"}
    }
  ],
  "logo_URIs": {
    "png":
        "https://raw.githubusercontent.com/cosmos/chain-registry/master/osmosis/images/osmo.png",
    "svg":
        "https://raw.githubusercontent.com/cosmos/chain-registry/master/osmosis/images/osmo.svg"
  },
  "description":
      "Osmosis (OSMO) is the premier DEX and cross-chain DeFi hub within the Cosmos ecosystem, a network of over 50 sovereign, interoperable blockchains seamlessly connected through the Inter-Blockchain Communication Protocol (IBC). Pioneering in its approach, Osmosis offers a dynamic trading and liquidity provision experience, integrating non-IBC assets from other ecosystems, including Ethereum, Solana, Avalanche, and Polkadot. Initially adopting Balancer-style pools, Osmosis now also features a concentrated liquidity model that is orders of magnitude more capital efficient, meaning that significantly less liquidity is required to handle the same amount of trading volume with minimal slippage.\n\nAs a true appchain, Osmosis has greater control over the full blockchain stack than traditional smart contract DEXs, which must follow the code of the parent chain that it is built on. This fine-grained control has enabled, for example, the development of Superfluid Staking, an extension of Proof of Stake that allows assets at the application layer to be staked to secure the chain. The customizability of appchains also allows implementing features like the Protocol Revenue module, which enables Osmosis to conduct on-chain arbitrage on behalf of OSMO stakers, balancing prices across pools while generating real yield revenue from this volume. Additionally, as a sovereign appchain, Osmosis governance can vote on upgrades to the protocol. One example of this was the introduction of a Taker Fee, which switched on the collection of exchange fees to generate diverse yield from Osmosis volume and distribute it to OSMO stakers.\n\nOsmosis is bringing the full centralized exchange experience to the decentralized world by building a cross-chain native DEX and trading suite that connects all chains over IBC, including Ethereum and Bitcoin. To reach this goal, Osmosis hosts an ever-expanding suite of DeFi applications aimed at providing a one-stop experience that includes lending, credit, margin, DeFi strategy vaults, power perps, fiat on-ramps, NFTs, stablecoins, and more — all of the functionalities that centralized exchange offer and more, in the trust-minimized environment of decentralized finance.",
  "peers": {
    "seeds": [
      {
        "id": "f515a8599b40f0e84dfad935ba414674ab11a668",
        "address": "osmosis.blockpane.com:26656",
        "provider": "blockpane"
      },
      {
        "id": "ade4d8bc8cbe014af6ebdf3cb7b1e9ad36f412c0",
        "address": "seeds.polkachu.com:12556",
        "provider": "Polkachu"
      },
      {
        "id": "20e1000e88125698264454a884812746c2eb4807",
        "address": "seeds.lavenderfive.com:12556",
        "provider": "Lavender.Five Nodes 🐝"
      },
      {
        "id": "ebc272824924ea1a27ea3183dd0b9ba713494f83",
        "address": "osmosis-mainnet-seed.autostake.com:26716",
        "provider": "AutoStake 🛡️ Slash Protected"
      },
      {
        "id": "3cc024d1c760c9cd96e6413abaf3b36a8bdca58e",
        "address": "seeds.goldenratiostaking.net:1630",
        "provider": "Golden Ratio Staking"
      },
      {
        "id": "e891d42c31064fb7e0d99839536164473c4905c2",
        "address": "seed-osmosis.freshstaking.com:31656",
        "provider": "FreshSTAKING"
      },
      {
        "id": "c28827cb96c14c905b127b92065a3fb4cd77d7f6",
        "address": "seeds.whispernode.com:12556",
        "provider": "WhisperNode 🤐"
      },
      {
        "id": "38ab18cb2ea1dfeb6232b429e1508f56b6ae5031",
        "address": "seed-osmosis-01.stakeflow.io:65535",
        "provider": "Stakeflow"
      },
      {
        "id": "954ab3a0551b592b654b1554af8fc8746ed7b362",
        "address": "seed-node.mms.team:31656",
        "provider": "MMS"
      },
      {
        "id": "8542cd7e6bf9d260fef543bc49e59be5a3fa9074",
        "address": "seed.publicnode.com:26656",
        "provider": "Allnodes ⚡️ Nodes & Staking"
      },
      {
        "id": "2cb8dd6195c65458e3c18505bb70ce2ff624f85c",
        "address": "seed.osmosis.validatus.com:2000",
        "provider": "Validatus"
      },
      {
        "id": "b85358e035343a3b15e77e1102857dcdaf70053b",
        "address": "seeds.bluestake.net:24856",
        "provider": "BlueStake 🚀"
      }
    ],
    "persistent_peers": [
      {
        "id": "4d9ac3510d9f5cfc975a28eb2a7b8da866f7bc47",
        "address": "37.187.38.191:26656",
        "provider": "stakelab"
      },
      {
        "id": "2f9c16151400d8516b0f58c030b3595be20b804c",
        "address": "37.120.245.167:26656",
        "provider": "syncnode"
      },
      {
        "id": "ebc272824924ea1a27ea3183dd0b9ba713494f83",
        "address": "osmosis-mainnet-peer.autostake.com:26716",
        "provider": "AutoStake 🛡️ Slash Protected"
      },
      {
        "id": "e891d42c31064fb7e0d99839536164473c4905c2",
        "address": "seed-osmosis.freshstaking.com:31656",
        "provider": "FreshSTAKING"
      },
      {
        "id": "38ab18cb2ea1dfeb6232b429e1508f56b6ae5031",
        "address": "peer-osmosis-01.stakeflow.io:65535",
        "provider": "Stakeflow"
      },
      {
        "id": "6f1d92857e39a6f26a3a914f807064824c255939",
        "address": "65.21.91.99:16956",
        "provider": "Staketab"
      },
      {
        "id": "50d0865decf5657eaf8e50e51bd9d8ce5f927f6c",
        "address": "peer-osmosis.mms.team:56102",
        "provider": "MMS"
      },
      {
        "id": "b95edbc3337a6fdd672cd6af2790c0e9ade2c4dd",
        "address": "65.108.195.213:41656",
        "provider": "StakeTown"
      },
      {
        "id": "10539f7c0e3ab233cf0deec9930aa8b660aeeabf",
        "address": "osmosis-mainnet.peers.l0vd.com:12656",
        "provider": "L0vd.com ❤️"
      }
    ]
  },
  "apis": {
    "rpc": [
      {
        "address": "https://rpc.osmosis.zone/",
        "provider": "Osmosis Foundation"
      },
      {
        "address": "https://rpc-osmosis.blockapsis.com",
        "provider": "chainapsis"
      },
      {
        "address": "https://osmosis-rpc.onivalidator.com",
        "provider": "Oni Validator ⛩️"
      },
      {
        "address": "https://osmosis-rpc.quickapi.com:443",
        "provider": "Chainlayer"
      },
      {
        "address": "https://rpc-osmosis.whispernode.com:443",
        "provider": "WhisperNode 🤐"
      },
      {
        "address": "https://rpc.lavenderfive.com:443/osmosis",
        "provider": "Lavender.Five Nodes 🐝"
      },
      {"address": "https://rpc-osmosis.ecostake.com", "provider": "ecostake"},
      {
        "address": "https://rpc-osmosis.cosmos-spaces.cloud",
        "provider": "Cosmos Spaces"
      },
      {"address": "https://osmosis-rpc.polkachu.com", "provider": "Polkachu"},
      {
        "address": "https://rpc-osmosis-ia.cosmosia.notional.ventures",
        "provider": "Notional"
      },
      {"address": "https://osmosis.rpc.stakin-nodes.com", "provider": "Stakin"},
      {
        "address": "https://osmosis-mainnet-rpc.autostake.com:443",
        "provider": "AutoStake 🛡️ Slash Protected"
      },
      {
        "address": "https://osmosis.api.onfinality.io/public",
        "provider": "OnFinality"
      },
      {
        "address": "https://rpc-osmosis-01.stakeflow.io",
        "provider": "Stakeflow"
      },
      {"address": "https://osmosis-rpc.w3coins.io", "provider": "w3coins"},
      {
        "address": "https://osmosis-rpc.publicnode.com:443",
        "provider": "Allnodes ⚡️ Nodes & Staking"
      },
      {
        "address": "https://community.nuxian-node.ch:6797/osmosis/trpc",
        "provider": "PRO Delegators"
      },
      {
        "address": "http://rpc-osmosis.freshstaking.com:31657",
        "provider": "FreshSTAKING"
      },
      {
        "address": "https://osmosis-rpc.stake-town.com",
        "provider": "StakeTown"
      },
      {
        "address": "https://osmosis-mainnet.rpc.l0vd.com:443",
        "provider": "L0vd.com ❤️"
      },
      {"address": "https://osmosis-rpc.reece.sh", "provider": "Reecepbcups"},
      {"address": "https://rpc.osmosis.validatus.com", "provider": "Validatus"},
      {
        "address": "https://rpc.osmosis.bronbro.io:443",
        "provider": "Bro_n_Bro"
      },
      {
        "address": "https://osmosis.interstellar-lounge.org",
        "provider": "Interstellar Lounge 🍸"
      },
      {
        "address": "https://public.stakewolle.com/cosmos/osmosis/rpc",
        "provider": "Stakewolle"
      },
      {"address": "https://rpc.cros-nest.com/osmosis", "provider": "Crosnest"},
      {"address": "https://rpc-osmo.kewrnode.com", "provider": "Kewr Node"},
      {
        "address": "https://rpc.osmosis.goldenratiostaking.net",
        "provider": "Golden Ratio Staking"
      },
      {
        "address": "https://osmosis-rpc.noders.services",
        "provider": "[NODERS]TEAM"
      },
      {"address": "https://osmosis.drpc.org", "provider": "dRPC"},
      {"address": "https://osmosis-rpc.chainroot.io", "provider": "Chainroot"}
    ],
    "rest": [
      {
        "address": "https://lcd.osmosis.zone/",
        "provider": "Osmosis Foundation"
      },
      {
        "address": "https://rest.osmosis.goldenratiostaking.net",
        "provider": "Golden Ratio Staking"
      },
      {
        "address": "https://osmosis-lcd.quickapi.com:443",
        "provider": "Chainlayer"
      },
      {
        "address": "https://lcd-osmosis.blockapsis.com",
        "provider": "chainapsis"
      },
      {
        "address": "https://rest.lavenderfive.com:443/osmosis",
        "provider": "Lavender.Five Nodes 🐝"
      },
      {"address": "https://rest-osmosis.ecostake.com", "provider": "ecostake"},
      {
        "address": "https://api-osmosis-ia.cosmosia.notional.ventures",
        "provider": "Notional"
      },
      {
        "address": "https://api-osmosis.cosmos-spaces.cloud",
        "provider": "Cosmos Spaces"
      },
      {"address": "https://osmosis-api.polkachu.com", "provider": "Polkachu"},
      {
        "address": "https://osmosis.rest.stakin-nodes.com",
        "provider": "Stakin"
      },
      {
        "address": "https://osmosis-mainnet-lcd.autostake.com:443",
        "provider": "AutoStake 🛡️ Slash Protected"
      },
      {
        "address": "https://api-osmosis-01.stakeflow.io",
        "provider": "Stakeflow"
      },
      {"address": "https://osmosis-api.w3coins.io", "provider": "w3coins"},
      {
        "address": "https://lcd-osmosis.whispernode.com:443",
        "provider": "WhisperNode 🤐"
      },
      {
        "address": "https://osmosis-rest.publicnode.com",
        "provider": "Allnodes ⚡️ Nodes & Staking"
      },
      {
        "address": "https://community.nuxian-node.ch:6797/osmosis/crpc",
        "provider": "PRO Delegators"
      },
      {
        "address": "https://osmosis-api.stake-town.com",
        "provider": "StakeTown"
      },
      {"address": "https://osmosis-api.reece.sh", "provider": "Reecepbcups"},
      {
        "address": "https://api.osmosis.validatus.com:443",
        "provider": "Validatus"
      },
      {
        "address": "https://lcd.osmosis.bronbro.io:443",
        "provider": "Bro_n_Bro"
      },
      {
        "address": "https://osmosis-rest.interstellar-lounge.org",
        "provider": "Interstellar Lounge 🍸"
      },
      {
        "address": "https://public.stakewolle.com/cosmos/osmosis/rest",
        "provider": "Stakewolle"
      },
      {"address": "https://rest.cros-nest.com/osmosis", "provider": "Crosnest"},
      {"address": "https://rest-osmo.kewrnode.com", "provider": "Kewr Node"},
      {
        "address": "https://osmosis-api.noders.services",
        "provider": "[NODERS]TEAM"
      },
      {"address": "https://osmosis-api.chainroot.io", "provider": "Chainroot"}
    ],
    "grpc": [
      {
        "address": "osmosis.lavenderfive.com:443",
        "provider": "Lavender.Five Nodes 🐝"
      },
      {
        "address": "grpc-osmosis-ia.cosmosia.notional.ventures:443",
        "provider": "Notional"
      },
      {"address": "osmosis.grpc.stakin-nodes.com:443", "provider": "Stakin"},
      {
        "address": "osmosis-mainnet-grpc.autostake.com:443",
        "provider": "AutoStake 🛡️ Slash Protected"
      },
      {
        "address": "grpc-osmosis.cosmos-spaces.cloud:1130",
        "provider": "Cosmos Spaces"
      },
      {"address": "grpc-osmosis-01.stakeflow.io:6754", "provider": "Stakeflow"},
      {"address": "services.staketab.com:9010", "provider": "Staketab"},
      {"address": "osmosis-grpc.w3coins.io:12590", "provider": "w3coins"},
      {"address": "grpc-osmosis.mms.team:443", "provider": "MMS"},
      {
        "address": "osmosis-grpc.publicnode.com:443",
        "provider": "Allnodes ⚡️ Nodes & Staking"
      },
      {"address": "osmosis-grpc.stake-town.com:443", "provider": "StakeTown"},
      {"address": "https://grpc-osmosis.nodeist.net", "provider": "Nodeist"},
      {
        "address": "osmosis-mainnet.grpc.l0vd.com:80",
        "provider": "L0vd.com ❤️"
      },
      {
        "address": "grpc-osmosis.whispernode.com:443",
        "provider": "WhisperNode 🤐"
      },
      {"address": "grpc.osmosis.validatus.com:443", "provider": "Validatus"},
      {
        "address": "https://grpc.osmosis.bronbro.io:443",
        "provider": "Bro_n_Bro"
      },
      {
        "address": "osmosis-grpc.noders.services:10090",
        "provider": "[NODERS]TEAM"
      },
      {"address": "osmosis-grpc.chainroot.io:443", "provider": "Chainroot"}
    ]
  },
  "explorers": [
    {
      "kind": "ezstaking",
      "url": "https://ezstaking.app/osmosis",
      "tx_page": "https://ezstaking.app/osmosis/txs/#{txHash}",
      "account_page": "https://ezstaking.app/osmosis/account/#{accountAddress}"
    },
    {
      "kind": "mintscan",
      "url": "https://www.mintscan.io/osmosis",
      "tx_page": "https://www.mintscan.io/osmosis/transactions/#{txHash}",
      "account_page":
          "https://www.mintscan.io/osmosis/accounts/#{accountAddress}"
    },
    {
      "kind": "ping.pub",
      "url": "https://ping.pub/osmosis",
      "tx_page": "https://ping.pub/osmosis/tx/#{txHash}"
    },
    {
      "kind": "explorers.guru",
      "url": "https://osmosis.explorers.guru",
      "tx_page": "https://osmosis.explorers.guru/transaction/#{txHash}",
      "account_page": "https://osmosis.explorers.guru/account/#{accountAddress}"
    },
    {
      "kind": "atomscan",
      "url": "https://atomscan.com/osmosis",
      "tx_page": "https://atomscan.com/osmosis/transactions/#{txHash}",
      "account_page": "https://atomscan.com/osmosis/accounts/#{accountAddress}"
    },
    {
      "kind": "TC Network",
      "url": "https://explorer.tcnetwork.io/osmosis",
      "tx_page": "https://explorer.tcnetwork.io/osmosis/transaction/#{txHash}",
      "account_page":
          "https://explorer.tcnetwork.io/osmosis/account/#{accountAddress}"
    },
    {
      "kind": "staking-explorer.com",
      "url": "https://staking-explorer.com/explorer/osmosis",
      "tx_page":
          "https://staking-explorer.com/transaction.php?chain=osmosis&tx=#{txHash}",
      "account_page":
          "https://staking-explorer.com/account.php?chain=osmosis&addr=#{accountAddress}"
    },
    {
      "kind": "Stakeflow",
      "url": "https://stakeflow.io/osmosis",
      "account_page": "https://stakeflow.io/osmosis/accounts/#{accountAddress}"
    },
    {
      "kind": "Nodeist Explorer",
      "url": "https://exp.nodeist.net/osmosis",
      "tx_page": "https://exp.nodeist.net/osmosis/tx/#{txHash}"
    },
    {
      "kind": "L0vd.com ❤️",
      "url": "https://explorers.l0vd.com/osmosis-mainnet",
      "tx_page": "https://explorers.l0vd.com/osmosis-mainnet/tx/#{txHash}"
    },
    {
      "kind": "Chainscope",
      "url": "https://chainsco.pe/osmosis",
      "tx_page": "https://chainsco.pe/osmosis/tx/#{txHash}"
    },
    {
      "kind": "WhisperNode 🤐",
      "url": "https://mainnet.whispernode.com/osmosis",
      "tx_page": "https://mainnet.whispernode.com/osmosis/tx/#{txHash}",
      "account_page":
          "https://mainnet.whispernode.com/osmosis/account/#{accountAddress}"
    },
    {
      "kind": "Chainroot",
      "url": "https://explorer.chainroot.io/osmosis",
      "tx_page": "https://explorer.chainroot.io/osmosis/transactions/#{txHash}",
      "account_page":
          "https://explorer.chainroot.io/osmosis/accounts/#{accountAddress}"
    }
  ],
  "keywords": ["dex"]
};
