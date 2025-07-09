//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// 1. Deploy mocks when we are on anvil chain
// 2. Keep track of contract address in different chains
// For example: sepolia usd/eth address, mainnet usd/eth address, etc

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/mocks/MockV3Aggregator.sol";

contract HelperConfig is Script {
    // If we are on a local Anvil, we deploy mocks
    // Otherwise, grab the existing address from the live network

    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeed; // Eth/Usd price feed address
    }

    constructor() {
        if (block.chainid == 11155111) {
            // Sepolia
            activeNetworkConfig = getSepoliaEthconfig();
        } else if (block.chainid == 1) {
            // Mainnet
            activeNetworkConfig = getMainnetEthconfig();
        } else {
            activeNetworkConfig = getOrCreateAnvilEthconfig();
        }
    }

    uint8 public constant DECIMALS = 8;
    int256 public constant INITIAL_ANSWER = 2000e8;

    function getSepoliaEthconfig() public pure returns (NetworkConfig memory) {
        // Sepolia ETH / USD Address
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sepoliaConfig;
    }

    function getMainnetEthconfig() public pure returns (NetworkConfig memory) {
        // Mainnet ETH / USD Address
        NetworkConfig memory ethConfig = NetworkConfig({
            priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        });
        return ethConfig;
    }

    function getOrCreateAnvilEthconfig() public returns (NetworkConfig memory) {
        if (activeNetworkConfig.priceFeed != address(0)) {
            return activeNetworkConfig;
        }
        // Price feed address for Anvil needs

        // 1. deploy the mock
        // 2. return the mock address

        vm.startBroadcast();
        MockV3Aggregator mockPriceFeed = new MockV3Aggregator(
            DECIMALS,
            INITIAL_ANSWER
        );
        vm.stopBroadcast();

        NetworkConfig memory anvilConfig = NetworkConfig({
            priceFeed: address(mockPriceFeed)
        });
        return anvilConfig;
    }
}
