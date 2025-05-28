// SPDX-License-Identifier: AGPL-3.0-only

/**
 *   IExecutor - SKALE Interchain Messaging Agent
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

// cspell::words func-name-mixedcase

pragma solidity >=0.8.19 <0.9.0;

import {ProtocolTypes} from "./ProtocolTypes.sol";

type ExecutorId is bytes32;

interface IExecutor {

    function execute(
        ProtocolTypes.TokenInfo[] memory inputTokens,
        bytes memory arguments
    )
        external
        returns (ProtocolTypes.TokenInfo[] memory outputTokens);

    // ID will be public constant variable but not function
    // slither-disable-start naming-convention
    // solhint-disable-next-line func-name-mixedcase
    function ID() external pure returns (ExecutorId executorId);
    // slither-disable-end naming-convention

}
