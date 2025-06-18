// SPDX-License-Identifier: AGPL-3.0-only

/**
 *   ITokenManagerSFuelHub - SKALE Interchain Messaging Agent
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

import "../tokens/IEthErc20.sol";
import {SchainHash} from "../../DomainTypes.sol";
import "../ICommunityLocker.sol";
import "../IMessageProxyForSchain.sol";
import "../ITokenManager.sol";
import "../ITokenManagerLinker.sol";


interface ITokenManagerSFuelHub {
    event SFuelTokenRegistered(SchainHash indexed sourceChainHash, address indexed tokenAddress);
    event SFuelReceived(SchainHash indexed fromChain, address indexed receiver, uint256 amount);
    event SFuelSentBack(SchainHash indexed toChain, address indexed sender, uint256 amount);

    function registerSFuelToken(
        string memory sourceChainName,
        IEthErc20 sFuelTokenAddress
    ) external;

    function sendSFuelBackToSource(
        IEthErc20 sFuelTokenAddress,
        address to,
        uint256 amount
    ) external;

    function getSFuelToken(string memory sourceChainName) external view returns (address);
    function initialize(
        string memory newChainName,
        IMessageProxyForSchain newMessageProxy,
        ITokenManagerLinker newIMALinker,
        ICommunityLocker newCommunityLocker
    ) external;
}
