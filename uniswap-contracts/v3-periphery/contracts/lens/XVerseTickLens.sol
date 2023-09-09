// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.5.0;
pragma abicoder v2;

import '@xverseprojects/v3-core/contracts/interfaces/IXVerseV3Pool.sol';

import '../interfaces/IXVerseTickLens.sol';

/// @title Tick Lens contract
contract XVerseTickLens is IXVerseTickLens {
    /// @inheritdoc IXVerseTickLens
    function getPopulatedTicksInWord(
        address pool,
        int16 tickBitmapIndex
    ) public view override returns (PopulatedTick[] memory populatedTicks) {
        // fetch bitmap
        uint256 bitmap = IXVerseV3Pool(pool).tickBitmap(tickBitmapIndex);

        // calculate the number of populated ticks
        uint256 numberOfPopulatedTicks;
        for (uint256 i = 0; i < 256; i++) {
            if (bitmap & (1 << i) > 0) numberOfPopulatedTicks++;
        }

        // fetch populated tick data
        int24 tickSpacing = IXVerseV3Pool(pool).tickSpacing();
        populatedTicks = new PopulatedTick[](numberOfPopulatedTicks);
        for (uint256 i = 0; i < 256; i++) {
            if (bitmap & (1 << i) > 0) {
                int24 populatedTick = ((int24(tickBitmapIndex) << 8) + int24(i)) * tickSpacing;
                (uint128 liquidityGross, int128 liquidityNet, , , , , , ) = IXVerseV3Pool(pool).ticks(populatedTick);
                populatedTicks[--numberOfPopulatedTicks] = PopulatedTick({
                    tick: populatedTick,
                    liquidityNet: liquidityNet,
                    liquidityGross: liquidityGross
                });
            }
        }
    }
}
