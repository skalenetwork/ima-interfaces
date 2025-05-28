// SPDX-License-Identifier: AGPL-3.0-only

/**
 *   ITokenLocker.sol - SKALE Interchain Messaging Agent
 *   Copyright (C) 2024-Present SKALE Labs
 *   @author Dmytro Stebaiev
 *
 *   SKALE IMA is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU Affero General Public License as published
 *   by the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   SKALE IMA is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Affero General Public License for more details.
 *
 *   You should have received a copy of the GNU Affero General Public License
 *   along with SKALE IMA.  If not, see <https://www.gnu.org/licenses/>.
 */

pragma solidity 0.8.27;

import {MetaActionId, ProtocolTypes} from "./ProtocolTypes.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
interface ITokenLocker {

    struct Lock {
        ProtocolTypes.TokenInfo[] tokens;
        uint256 timestamp;
        MetaActionId  metaActionId;
        address tokensOwner;
        // Add mappings for different tokens
        mapping(IERC20 token => uint256 amount) balances;
    }

    event TokensUnlocked(MetaActionId indexed metaAction, address unlockCaller, ProtocolTypes.TokenInfo[] tokens);
    event TokensLocked(MetaActionId indexed metaAction, address locker, ProtocolTypes.TokenInfo[] tokens);

    function initialize() external;

    function getMetaActionsWithLockedTokens() external view returns (MetaActionId[] memory metaActions);

    function lock(
        ProtocolTypes.TokenInfo[] calldata tokens,
        MetaActionId metaAction,
        address owner
    ) external;

    function unlock(
        MetaActionId metaAction
    ) external;
}
