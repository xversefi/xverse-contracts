// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.5.0;

import './pool/IXVerseV3PoolImmutables.sol';
import './pool/IXVerseV3PoolState.sol';
import './pool/IXVerseV3PoolDerivedState.sol';
import './pool/IXVerseV3PoolActions.sol';
import './pool/IXVerseV3PoolOwnerActions.sol';
import './pool/IXVerseV3PoolEvents.sol';

/// @title The interface for a XVerseSwap V3 Pool
/// @notice A XVerseSwap pool facilitates swapping and automated market making between any two assets that strictly conform
/// to the ERC20 specification
/// @dev The pool interface is broken up into many smaller pieces
interface IXVerseV3Pool is
    IXVerseV3PoolImmutables,
    IXVerseV3PoolState,
    IXVerseV3PoolDerivedState,
    IXVerseV3PoolActions,
    IXVerseV3PoolOwnerActions,
    IXVerseV3PoolEvents
{

}
