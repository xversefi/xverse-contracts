// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./IXVerseV3Pool.sol";
import "./ILMPool.sol";

interface ILMPoolDeployer {
    function deploy(IXVerseV3Pool pool) external returns (ILMPool lmPool);
}
