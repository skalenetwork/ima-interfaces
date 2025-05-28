// SPDX-License-Identifier: AGPL-3.0-only

/**
 *   ProtocolTypes.sol - SKALE Interchain Messaging Agent
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

import {SchainHash} from "../../DomainTypes.sol";
import {ExecutorId} from "./IExecutor.sol";

type MetaActionId is bytes32;

library ProtocolTypes {

    struct TokenInfo {
        uint256 value;
        address token;
    }

    struct Action {
        ExecutorId executor;
        bytes arguments;
    }

    enum MetaActionStatus {
        SUCCEED,
        EXECUTING,
        FAILED
    }

    struct MetaAction {
        SchainHash targetChainHash;
        bytes actions;
        bytes nextMetaAction;
        bytes postActions;
    }

    enum MessageType {
        CONFIRMATION,
        META_ACTION,
        FAILURE
    }

    struct Message {
        uint96 version;
        MessageType messageType;
        MetaActionId metaActionId;
        uint256 seqNumber;
        address tokensOwner;
        bytes payload;
    }
}
