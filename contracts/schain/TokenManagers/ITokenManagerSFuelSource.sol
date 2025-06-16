// SPDX-License-Identifier: AGPL-3.0-only

/**
 *   ITokenManagerSFuelSource - SKALE Interchain Messaging Agent
 *   Copyright (C) 2025-Present SKALE Labs
 *   @author Vadim Yavorsky
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

import {SchainHash} from "../../DomainTypes.sol";


interface ITokenManagerSFuelSource {
    event SFuelSentToHub(address indexed sender, uint256 amount);
    event SFuelReceivedFromHub(address indexed receiver, uint256 amount);

    receive() external payable;

    function setEuropaChainName(string memory europaChainName) external;

    function sendSFuelToEuropa(address to, uint256 amount) external payable;

    function postMessage(
        SchainHash fromChainHash,
        address sender,
        bytes calldata data
    ) external;

}
