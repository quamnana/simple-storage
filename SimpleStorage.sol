// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage {
    uint256 favouriteNumber;
    struct People {
        uint256 favouriteNumber;
        string name;
    }
    People[] public people;
    mapping(string => uint256) public nameToFavouriteNumber;


    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    function retrieve() view public returns(uint256) {
        return favouriteNumber;
    }

    function addPerson(uint256 _favouriteNumber, string memory _name) external {
        people.push(People(_favouriteNumber, _name));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}