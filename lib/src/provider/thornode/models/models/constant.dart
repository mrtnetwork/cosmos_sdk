class ThorNodeNetworkConstants {
  final int? allowWideBlame;
  final int? asgardSize;
  final int? badValidatorRedline;
  final int? blocksPerYear;
  final int? churnInterval;
  final int? churnMigrateRounds;
  final int? churnOutForLowVersionBlocks;
  final int? churnRetryInterval;
  final int? cloutLimit;
  final int? cloutReset;
  final int? derivedDepthBasisPts;
  final int? derivedMinDepth;
  final int? desiredValidatorSet;
  final int? doubleSignMaxAge;
  final int? dynamicMaxAnchorCalcInterval;
  final int? dynamicMaxAnchorSlipBlocks;
  final int? dynamicMaxAnchorTarget;
  final int? emissionCurve;
  final int? enableDerivedAssets;
  final int? enableOrderBooks;
  final int? enableUSDFees;
  final int? failKeygenSlashPoints;
  final int? failKeysignSlashPoints;
  final int? feeUSDRoundSignificantDigits;
  final int? fullImpLossProtectionBlocks;
  final int? fundMigrationInterval;
  final int? iLPCutoff;
  final int? incentiveCurve;
  final int? jailTimeKeygen;
  final int? jailTimeKeysign;
  final int? keygenRetryInterval;
  final int? killSwitchDuration;
  final int? killSwitchStart;
  final int? lackOfObservationPenalty;
  final int? lendingLever;
  final int? liquidityLockUpBlocks;
  final int? loanRepaymentMaturity;
  final int? loanStreamingSwapsInterval;
  final int? maxAffiliateFeeBasisPoints;
  final int? maxAnchorBlocks;
  final int? maxAnchorSlip;
  final int? maxAvailablePools;
  final int? maxBondProviders;
  final int? maxCR;
  final int? maxNodeToChurnOutForLowVersion;
  final int? maxOutboundAttempts;
  final int? maxOutboundFeeMultiplierBasisPoints;
  final int? maxRuneSupply;
  final int? maxSwapsPerBlock;
  final int? maxSynthPerAssetDepth;
  final int? maxSynthPerPoolDepth;
  final int? maxSynthsForSaversYield;
  final int? maxTxOutOffset;
  final int? migrationVaultSecurityBps;
  final int? minCR;
  final int? minOutboundFeeMultiplierBasisPoints;
  final int? minRunePoolDepth;
  final int? minSlashPointsForBadValidator;
  final int? minSwapsPerBlock;
  final int? minTxOutVolumeThreshold;
  final int? minimumBondInRune;
  final int? minimumL1OutboundFeeUSD;
  final int? minimumNodesForBFT;
  final int? minimumNodesForYggdrasil;
  final int? minimumPoolLiquidityFee;
  final int? missBlockSignSlashPoints;
  final int? nativeOutboundFeeUSD;
  final int nativeTransactionFee;
  final int? nativeTransactionFeeUSD;
  final int? nodeOperatorFee;
  final int? nodePauseChainBlocks;
  final int? observationDelayFlexibility;
  final int? observeSlashPoints;
  final int? outboundTransactionFee;
  final int? polBuffer;
  final int? polMaxNetworkDeposit;
  final int? polMaxPoolMovement;
  final int? polSynthUtilization;
  final int? polTargetSynthPerPoolDepth;
  final int? pauseBond;
  final int? pauseLoans;
  final int? pauseOnSlashThreshold;
  final int? pauseUnbond;
  final int? pendingLiquidityAgeLimit;
  final int? permittedSolvencyGap;
  final int? poolCycle;
  final int? poolDepthForYggFundingMin;
  final int? preferredAssetOutboundFeeMultiplier;
  final int? ragnarokProcessNumOfLPPerIteration;
  final int? rescheduleCoalesceBlocks;
  final int? saversStreamingSwapsInterval;
  final int? signingTransactionPeriod;
  final int? slashPenalty;
  final int? stagedPoolCost;
  final int? streamingSwapMaxLength;
  final int? streamingSwapMaxLengthNative;
  final int? streamingSwapMinBPFee;
  final int? streamingSwapPause;
  final int? synthYieldBasisPoints;
  final int? synthYieldCycle;
  final int? tNSFeeOnSale;
  final int? tNSFeePerBlock;
  final int? tNSFeePerBlockUSD;
  final int? tNSRegisterFee;
  final int? tNSRegisterFeeUSD;
  final int? targetOutboundFeeSurplusRune;
  final int? tradeAccountsEnabled;
  final int? txOutDelayMax;
  final int? txOutDelayRate;
  final int? validatorMaxRewardRatio;
  final int? virtualMultSynths;
  final int? virtualMultSynthsBasisPoints;
  final int? yggFundLimit;
  final int? yggFundRetry;

  const ThorNodeNetworkConstants({
    this.allowWideBlame,
    this.asgardSize,
    this.badValidatorRedline,
    this.blocksPerYear,
    this.churnInterval,
    this.churnMigrateRounds,
    this.churnOutForLowVersionBlocks,
    this.churnRetryInterval,
    this.cloutLimit,
    this.cloutReset,
    this.derivedDepthBasisPts,
    this.derivedMinDepth,
    this.desiredValidatorSet,
    this.doubleSignMaxAge,
    this.dynamicMaxAnchorCalcInterval,
    this.dynamicMaxAnchorSlipBlocks,
    this.dynamicMaxAnchorTarget,
    this.emissionCurve,
    this.enableDerivedAssets,
    this.enableOrderBooks,
    this.enableUSDFees,
    this.failKeygenSlashPoints,
    this.failKeysignSlashPoints,
    this.feeUSDRoundSignificantDigits,
    this.fullImpLossProtectionBlocks,
    this.fundMigrationInterval,
    this.iLPCutoff,
    this.incentiveCurve,
    this.jailTimeKeygen,
    this.jailTimeKeysign,
    this.keygenRetryInterval,
    this.killSwitchDuration,
    this.killSwitchStart,
    this.lackOfObservationPenalty,
    this.lendingLever,
    this.liquidityLockUpBlocks,
    this.loanRepaymentMaturity,
    this.loanStreamingSwapsInterval,
    this.maxAffiliateFeeBasisPoints,
    this.maxAnchorBlocks,
    this.maxAnchorSlip,
    this.maxAvailablePools,
    this.maxBondProviders,
    this.maxCR,
    this.maxNodeToChurnOutForLowVersion,
    this.maxOutboundAttempts,
    this.maxOutboundFeeMultiplierBasisPoints,
    this.maxRuneSupply,
    this.maxSwapsPerBlock,
    this.maxSynthPerAssetDepth,
    this.maxSynthPerPoolDepth,
    this.maxSynthsForSaversYield,
    this.maxTxOutOffset,
    this.migrationVaultSecurityBps,
    this.minCR,
    this.minOutboundFeeMultiplierBasisPoints,
    this.minRunePoolDepth,
    this.minSlashPointsForBadValidator,
    this.minSwapsPerBlock,
    this.minTxOutVolumeThreshold,
    this.minimumBondInRune,
    this.minimumL1OutboundFeeUSD,
    this.minimumNodesForBFT,
    this.minimumNodesForYggdrasil,
    this.minimumPoolLiquidityFee,
    this.missBlockSignSlashPoints,
    this.nativeOutboundFeeUSD,
    required this.nativeTransactionFee,
    this.nativeTransactionFeeUSD,
    this.nodeOperatorFee,
    this.nodePauseChainBlocks,
    this.observationDelayFlexibility,
    this.observeSlashPoints,
    this.outboundTransactionFee,
    this.polBuffer,
    this.polMaxNetworkDeposit,
    this.polMaxPoolMovement,
    this.polSynthUtilization,
    this.polTargetSynthPerPoolDepth,
    this.pauseBond,
    this.pauseLoans,
    this.pauseOnSlashThreshold,
    this.pauseUnbond,
    this.pendingLiquidityAgeLimit,
    this.permittedSolvencyGap,
    this.poolCycle,
    this.poolDepthForYggFundingMin,
    this.preferredAssetOutboundFeeMultiplier,
    this.ragnarokProcessNumOfLPPerIteration,
    this.rescheduleCoalesceBlocks,
    this.saversStreamingSwapsInterval,
    this.signingTransactionPeriod,
    this.slashPenalty,
    this.stagedPoolCost,
    this.streamingSwapMaxLength,
    this.streamingSwapMaxLengthNative,
    this.streamingSwapMinBPFee,
    this.streamingSwapPause,
    this.synthYieldBasisPoints,
    this.synthYieldCycle,
    this.tNSFeeOnSale,
    this.tNSFeePerBlock,
    this.tNSFeePerBlockUSD,
    this.tNSRegisterFee,
    this.tNSRegisterFeeUSD,
    this.targetOutboundFeeSurplusRune,
    this.tradeAccountsEnabled,
    this.txOutDelayMax,
    this.txOutDelayRate,
    this.validatorMaxRewardRatio,
    this.virtualMultSynths,
    this.virtualMultSynthsBasisPoints,
    this.yggFundLimit,
    this.yggFundRetry,
  });

  factory ThorNodeNetworkConstants.fromJson(Map<String, dynamic> json) {
    return ThorNodeNetworkConstants(
      allowWideBlame: json['AllowWideBlame'],
      asgardSize: json['AsgardSize'],
      badValidatorRedline: json['BadValidatorRedline'],
      blocksPerYear: json['BlocksPerYear'],
      churnInterval: json['ChurnInterval'],
      churnMigrateRounds: json['ChurnMigrateRounds'],
      churnOutForLowVersionBlocks: json['ChurnOutForLowVersionBlocks'],
      churnRetryInterval: json['ChurnRetryInterval'],
      cloutLimit: json['CloutLimit'],
      cloutReset: json['CloutReset'],
      derivedDepthBasisPts: json['DerivedDepthBasisPts'],
      derivedMinDepth: json['DerivedMinDepth'],
      desiredValidatorSet: json['DesiredValidatorSet'],
      doubleSignMaxAge: json['DoubleSignMaxAge'],
      dynamicMaxAnchorCalcInterval: json['DynamicMaxAnchorCalcInterval'],
      dynamicMaxAnchorSlipBlocks: json['DynamicMaxAnchorSlipBlocks'],
      dynamicMaxAnchorTarget: json['DynamicMaxAnchorTarget'],
      emissionCurve: json['EmissionCurve'],
      enableDerivedAssets: json['EnableDerivedAssets'],
      enableOrderBooks: json['EnableOrderBooks'],
      enableUSDFees: json['EnableUSDFees'],
      failKeygenSlashPoints: json['FailKeygenSlashPoints'],
      failKeysignSlashPoints: json['FailKeysignSlashPoints'],
      feeUSDRoundSignificantDigits: json['FeeUSDRoundSignificantDigits'],
      fullImpLossProtectionBlocks: json['FullImpLossProtectionBlocks'],
      fundMigrationInterval: json['FundMigrationInterval'],
      iLPCutoff: json['ILPCutoff'],
      incentiveCurve: json['IncentiveCurve'],
      jailTimeKeygen: json['JailTimeKeygen'],
      jailTimeKeysign: json['JailTimeKeysign'],
      keygenRetryInterval: json['KeygenRetryInterval'],
      killSwitchDuration: json['KillSwitchDuration'],
      killSwitchStart: json['KillSwitchStart'],
      lackOfObservationPenalty: json['LackOfObservationPenalty'],
      lendingLever: json['LendingLever'],
      liquidityLockUpBlocks: json['LiquidityLockUpBlocks'],
      loanRepaymentMaturity: json['LoanRepaymentMaturity'],
      loanStreamingSwapsInterval: json['LoanStreamingSwapsInterval'],
      maxAffiliateFeeBasisPoints: json['MaxAffiliateFeeBasisPoints'],
      maxAnchorBlocks: json['MaxAnchorBlocks'],
      maxAnchorSlip: json['MaxAnchorSlip'],
      maxAvailablePools: json['MaxAvailablePools'],
      maxBondProviders: json['MaxBondProviders'],
      maxCR: json['MaxCR'],
      maxNodeToChurnOutForLowVersion: json['MaxNodeToChurnOutForLowVersion'],
      maxOutboundAttempts: json['MaxOutboundAttempts'],
      maxOutboundFeeMultiplierBasisPoints:
          json['MaxOutboundFeeMultiplierBasisPoints'],
      maxRuneSupply: json['MaxRuneSupply'],
      maxSwapsPerBlock: json['MaxSwapsPerBlock'],
      maxSynthPerAssetDepth: json['MaxSynthPerAssetDepth'],
      maxSynthPerPoolDepth: json['MaxSynthPerPoolDepth'],
      maxSynthsForSaversYield: json['MaxSynthsForSaversYield'],
      maxTxOutOffset: json['MaxTxOutOffset'],
      migrationVaultSecurityBps: json['MigrationVaultSecurityBps'],
      minCR: json['MinCR'],
      minOutboundFeeMultiplierBasisPoints:
          json['MinOutboundFeeMultiplierBasisPoints'],
      minRunePoolDepth: json['MinRunePoolDepth'],
      minSlashPointsForBadValidator: json['MinSlashPointsForBadValidator'],
      minSwapsPerBlock: json['MinSwapsPerBlock'],
      minTxOutVolumeThreshold: json['MinTxOutVolumeThreshold'],
      minimumBondInRune: json['MinimumBondInRune'],
      minimumL1OutboundFeeUSD: json['MinimumL1OutboundFeeUSD'],
      minimumNodesForBFT: json['MinimumNodesForBFT'],
      minimumNodesForYggdrasil: json['MinimumNodesForYggdrasil'],
      minimumPoolLiquidityFee: json['MinimumPoolLiquidityFee'],
      missBlockSignSlashPoints: json['MissBlockSignSlashPoints'],
      nativeOutboundFeeUSD: json['NativeOutboundFeeUSD'],
      nativeTransactionFee: json['NativeTransactionFee'],
      nativeTransactionFeeUSD: json['NativeTransactionFeeUSD'],
      nodeOperatorFee: json['NodeOperatorFee'],
      nodePauseChainBlocks: json['NodePauseChainBlocks'],
      observationDelayFlexibility: json['ObservationDelayFlexibility'],
      observeSlashPoints: json['ObserveSlashPoints'],
      outboundTransactionFee: json['OutboundTransactionFee'],
      polBuffer: json['POLBuffer'],
      polMaxNetworkDeposit: json['POLMaxNetworkDeposit'],
      polMaxPoolMovement: json['POLMaxPoolMovement'],
      polSynthUtilization: json['POLSynthUtilization'],
      polTargetSynthPerPoolDepth: json['POLTargetSynthPerPoolDepth'],
      pauseBond: json['PauseBond'],
      pauseLoans: json['PauseLoans'],
      pauseOnSlashThreshold: json['PauseOnSlashThreshold'],
      pauseUnbond: json['PauseUnbond'],
      pendingLiquidityAgeLimit: json['PendingLiquidityAgeLimit'],
      permittedSolvencyGap: json['PermittedSolvencyGap'],
      poolCycle: json['PoolCycle'],
      poolDepthForYggFundingMin: json['PoolDepthForYggFundingMin'],
      preferredAssetOutboundFeeMultiplier:
          json['PreferredAssetOutboundFeeMultiplier'],
      ragnarokProcessNumOfLPPerIteration:
          json['RagnarokProcessNumOfLPPerIteration'],
      rescheduleCoalesceBlocks: json['RescheduleCoalesceBlocks'],
      saversStreamingSwapsInterval: json['SaversStreamingSwapsInterval'],
      signingTransactionPeriod: json['SigningTransactionPeriod'],
      slashPenalty: json['SlashPenalty'],
      stagedPoolCost: json['StagedPoolCost'],
      streamingSwapMaxLength: json['StreamingSwapMaxLength'],
      streamingSwapMaxLengthNative: json['StreamingSwapMaxLengthNative'],
      streamingSwapMinBPFee: json['StreamingSwapMinBPFee'],
      streamingSwapPause: json['StreamingSwapPause'],
      synthYieldBasisPoints: json['SynthYieldBasisPoints'],
      synthYieldCycle: json['SynthYieldCycle'],
      tNSFeeOnSale: json['TNSFeeOnSale'],
      tNSFeePerBlock: json['TNSFeePerBlock'],
      tNSFeePerBlockUSD: json['TNSFeePerBlockUSD'],
      tNSRegisterFee: json['TNSRegisterFee'],
      tNSRegisterFeeUSD: json['TNSRegisterFeeUSD'],
      targetOutboundFeeSurplusRune: json['TargetOutboundFeeSurplusRune'],
      tradeAccountsEnabled: json['TradeAccountsEnabled'],
      txOutDelayMax: json['TxOutDelayMax'],
      txOutDelayRate: json['TxOutDelayRate'],
      validatorMaxRewardRatio: json['ValidatorMaxRewardRatio'],
      virtualMultSynths: json['VirtualMultSynths'],
      virtualMultSynthsBasisPoints: json['VirtualMultSynthsBasisPoints'],
      yggFundLimit: json['YggFundLimit'],
      yggFundRetry: json['YggFundRetry'],
    );
  }
}
