//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC404} from "./ERC404.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

contract MyERC404 is ERC404 {
    using Strings for uint256;

    string public dataURI;
    string public baseTokenURI;

    constructor(address _owner) ERC404("Autism404", "TISM", 18, 10000, _owner) {
        balanceOf[_owner] = 10000 * 10 ** 18;
    }

    function setDataURI(string memory _dataURI) public onlyOwner {
        dataURI = _dataURI;
    }

    function setTokenURI(string memory _tokenURI) public onlyOwner {
        baseTokenURI = _tokenURI;
    }

    function setNameSymbol(
        string memory _name,
        string memory _symbol
    ) public onlyOwner {
        _setNameSymbol(_name, _symbol);
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        if (bytes(baseTokenURI).length > 0) {
            return string.concat(baseTokenURI, Strings.toString(id));
        } else {
            uint8 seed = uint8(bytes1(keccak256(abi.encodePacked(id))));
            string memory image;
            string memory tism;

            if (seed <= 12) {
                image = "1.png";
                tism = "Purple";
            } else if (seed <= 25) {
                image = "2.png";
                tism = "Red";
            } else if (seed <= 37) {
                image = "3.png";
                tism = "Green";
            } else if (seed <= 50) {
                image = "4.png";
                tism = "Blue";
            } else if (seed <= 63) {
                image = "5.png";
                tism = "Orange";
            } else if (seed <= 74) {
                image = "6.png";
                tism = "Lavender";
            } else if (seed <= 86) {
                image = "7.png";
                tism = "Black";
            } else if (seed <= 100) {
                image = "8.png";
                tism = "Pink";
            } else if (seed <= 113) {
                image = "9.png";
                tism = "Emerald";
            } else if (seed <= 125) {
                image = "10.png";
                tism = "Brown";
            } else if (seed <= 140) {
                image = "11.png";
                tism = "Clear";
            } else if (seed <= 155) {
                image = "12.png";
                tism = "Yellow";
            } else if (seed <= 167) {
                image = "13.png";
                tism = "Maroon";
            } else if (seed <= 180) {
                image = "14.png";
                tism = "Violet";
            } else if (seed <= 191) {
                image = "15.png";
                tism = "Grey";
            } else if (seed <= 204) {
                image = "16.png";
                tism = "Aqua";
            } else if (seed <= 216) {
                image = "17.png";
                tism = "Fawn";
            } else if (seed <= 230) {
                image = "18.png";
                tism = "Gold";
            } else if (seed <= 242) {
                image = "19.png";
                tism = "Silver";
            } else if (seed <= 253) {
                image = "20.png";
                tism = "Bronze";
            } else if (seed <= 265) {
                image = "21.png";
                tism = "Platinum";
            } else if (seed <= 277) {
                image = "22.png";
                tism = "Tan";
            } else if (seed <= 289) {
                image = "23.png";
                tism = "Torqouise";
            } else if (seed <= 300) {
                image = "24.png";
                tism = "White";
            }
            

            string memory jsonPreImage = string.concat(
                string.concat(
                    string.concat(
                        '{"name": "My Autism404 #',
                        Strings.toString(id)
                    ),
                    '","description":"A collection of Autism404 enabled by ERC404, an experimental token standard.","external_url":"","image":"'
                ),
                string.concat(dataURI, image)
            );
            string memory jsonPostImage = string.concat(
                '","attributes":[{"trait_type":"TISM","value":"',
                tism
            );
            string memory jsonPostTraits = '"}]}';

            return
                string.concat(
                    "data:application/json;utf8,",
                    string.concat(
                        string.concat(jsonPreImage, jsonPostImage),
                        jsonPostTraits
                    )
                );
        }
    }
}
