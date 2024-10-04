// SPDX-License-Identifier: AGPL-3.0-only

/**
 *   IMessageListener.sol - SKALE Interchain Messaging Agent
 *   Copyright (C) 2021-Present SKALE Labs
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

pragma solidity >=0.8.8 <0.9.0;

import {SchainHash} from "./DomainTypes.sol";


interface IMessageListener {
    /**
     * @dev Structure that describes message. Should contain sender of message,
     * destination contract on schain that will receiver message,
     * data that contains all needed info about token or ETH.
     */
    struct Message {
        address sender;
        address destinationContract;
        bytes data;
    }

    /**
     * @dev Structure that contains fields for bls signature.
     */
    struct Signature {
        uint256[2] blsSignature;
        uint256 hashA;
        uint256 hashB;
        uint256 counter;
    }

    function postIncomingMessages(
        string calldata fromSchainName,
        uint256 startingCounter,
        Message[] calldata messages,
        Signature calldata sign
    ) external;

    function postOutgoingMessage(
        SchainHash targetChainHash,
        address targetContract,
        bytes memory data
    ) external;
}
