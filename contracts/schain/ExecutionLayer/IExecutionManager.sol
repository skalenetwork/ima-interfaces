// SPDX-License-Identifier: AGPL-3.0-only

/**
 *   IExecutionManager - SKALE Interchain Messaging Agent
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

pragma solidity >=0.8.19 <0.9.0;

import {IMessageReceiver} from "../../IMessageReceiver.sol";
import {ITokenManagerERC20} from "../TokenManagers/ITokenManagerERC20.sol";
import {SchainHash} from "../../DomainTypes.sol";
import {ProtocolTypes, MetaActionId} from "./ProtocolTypes.sol";
import {ExecutorId, IExecutor} from "./IExecutor.sol";
import {ITokenLocker} from "./ITokenLocker.sol";


interface IExecutionManager is IMessageReceiver {

    event MetaActionCreated(MetaActionId id);
    event MetaActionFailed(MetaActionId indexed id, string reason);
    event MetaActionConfirmationFailed(MetaActionId indexed id, string reason);

    function initialize(ITokenManagerERC20 erc20TokenManagerAddress, ITokenLocker locker) external;

    // Execute
    function execute(
        ProtocolTypes.MetaAction calldata metaAction,
        ProtocolTypes.TokenInfo[] calldata tokens,
        ProtocolTypes.Action[] memory postActions
    ) external;

    // Setters
    function setRemoteExecutionManager(
        SchainHash schainHash,
        address executionManagerAddress
    ) external;
    function setExecutor(
        ExecutorId id,
        IExecutor executorAddress
    ) external;

    // View
    function getMetaActionStatus(MetaActionId id) external view returns (ProtocolTypes.MetaActionStatus status);
    function getExecutor(ExecutorId id) external view returns (IExecutor executor);
    function getMetaActionsWithLockedTokens() external view returns (MetaActionId[] memory ids);

    // Pure
    function createSimpleMetaAction(
        SchainHash targetChain,
        ProtocolTypes.Action[] memory actions
    ) external pure returns (ProtocolTypes.MetaAction memory metaAction);

    function createChainedMetaAction(
        SchainHash targetChain,
        ProtocolTypes.Action[] memory actions,
        ProtocolTypes.MetaAction memory nextMetaAction,
        ProtocolTypes.Action[] memory postActions
    ) external pure returns (ProtocolTypes.MetaAction memory metaAction);

    function getTokenAddress(ProtocolTypes.TokenInfo memory tokenInfo) external pure returns (address token);
}
