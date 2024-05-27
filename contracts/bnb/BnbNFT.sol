// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.13;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";


contract BnbNFT is ERC721EnumerableUpgradeable, OwnableUpgradeable, UUPSUpgradeable {
    bool public isMintingEnabled;
    string private _baseTokenURI;
    uint256 private _tokenIdCounter;
    mapping(address => bool) public isWhiteListed;
    mapping(address => bool) public isMinted;

    modifier onlyIfMintingEnabled() {
        require(isMintingEnabled, "Minting is disabled.");
        _;
    }

    function initialize(string memory name, string memory symbol, string memory baseTokenURI) public initializer {
        __ERC721_init(name, symbol);
        __Ownable_init();
        __UUPSUpgradeable_init();
        _baseTokenURI = baseTokenURI;
        _tokenIdCounter = 0;
        isMintingEnabled = true;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function mint() public onlyIfMintingEnabled {
        require(isWhiteListed[msg.sender] || !isMinted[msg.sender], "Address has already minted.");
        isMinted[msg.sender] = true;
        _safeMint(msg.sender, _tokenIdCounter);
        _tokenIdCounter++;
    }

    function whitelistAddresses(address[] memory addresses) public onlyOwner {
        for (uint256 i = 0; i < addresses.length; i++) {
            isWhiteListed[addresses[i]] = true;
        }
    }

    function removeFromWhitelist(address[] memory addresses) public onlyOwner {
        for (uint256 i = 0; i < addresses.length; i++) {
            delete isWhiteListed[addresses[i]];
        }
    }

    function toggleMinting() public onlyOwner {
        isMintingEnabled = !isMintingEnabled;
    }

    function _authorizeUpgrade(address newImplementation) internal view override onlyOwner {}
}