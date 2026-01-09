// SPDX-License-Identifier: AGPL-3.0-only

/**
 *   DomainTypes.sol - SKALE Interchain Messaging Agent
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


type SchainHash is bytes32;

using {
    _schainHashEquals as ==,
    _schainHashNotEquals as !=
} for SchainHash global;

// Operators are used by the library users
// slither-disable-start dead-code

function _schainHashEquals(SchainHash left, SchainHash right) pure returns (bool result) {
    return SchainHash.unwrap(left) == SchainHash.unwrap(right);
}

function _schainHashNotEquals(SchainHash left, SchainHash right) pure returns (bool result) {
    return SchainHash.unwrap(left) != SchainHash.unwrap(right);
}

// slither-disable-end dead-code
