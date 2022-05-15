// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./SimpleStorage.sol";

contract StorageFactory is SimpleStorage {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorage() public {
        // deploy or create a new smart contract from another smart contract
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    // interacting with a different smart contract
    function sfStore(uint simpleStorageIndex, uint simpleStorageNumber) public {
       SimpleStorage(address(simpleStorageArray[simpleStorageIndex])).store(simpleStorageNumber);
    }

    function sfGet(uint simpleStorageIndex) public view returns(uint) {
       return SimpleStorage(address(simpleStorageArray[simpleStorageIndex])).retrieve();
    } 
}