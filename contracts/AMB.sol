// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Validator.sol";

contract AMB is Ownable {
    Validator public validatorContract;
    mapping(bytes32 => bool) public processedMessages;

    event MessageSent(address indexed from, bytes32 indexed messageId, string message);
    event MessageReceived(address indexed from, bytes32 indexed messageId, string message);
    event MessageCancelled(bytes32 indexed messageId);

    constructor(address _validatorContract) {
        validatorContract = Validator(_validatorContract);
    }

    function sendMessage(bytes32 _messageId, string calldata _message) external {
        require(!processedMessages[_messageId], "Message already processed");
        processedMessages[_messageId] = true;
        emit MessageSent(msg.sender, _messageId, _message);
    }

    function cancelMessage(bytes32 _messageId) external {
        require(processedMessages[_messageId], "Message not sent");
        processedMessages[_messageId] = false;
        emit MessageCancelled(_messageId);
    }

    function receiveMessage(address _from, bytes32 _messageId, string calldata _message) external {
        require(validatorContract.isValidator(msg.sender), "Not a validator");
        require(processedMessages[_messageId], "Message not sent");
        emit MessageReceived(_from, _messageId, _message);
    }
}

// Top DeFi Protocols by Total Value Locked (TVL)
// 1. Lido
//    - Category: Liquid staking
//    - Key Features: Ethereum staking without needing to lock tokens.
//    - TVL: ~$14B
// 2. Uniswap
//    - Category: Decentralized exchange (DEX)
//    - Key Features: Automated market maker (AMM) with ERC-20 token trading.
// 3. Curve Finance
//    - Category: Stablecoin DEX
//    - Key Features: Optimized for low-slippage stablecoin swaps.
// 4. Aave
//    - Category: Lending and borrowing
//    - Key Features: Interest-bearing deposits and flash loans.
// 5. Compound
//    - Category: Lending and borrowing
//    - Key Features: Algorithmic money markets.
// 6. MakerDAO
//    - Category: Stablecoin protocol
//    - Key Features: Collateral-backed stablecoin (DAI) issuance.
// 7. PancakeSwap
//    - Category: DEX
//    - Key Features: Binance Smart Chain (BSC)-based token swaps.
// 8. Balancer
//    - Category: DEX and portfolio manager
//    - Key Features: Customizable liquidity pools for token swaps.
// 9. Yearn Finance
//    - Category: Yield aggregator
//    - Key Features: Optimizes DeFi strategies for maximum returns.
// 10. Synthetix
//    - Category: Synthetic assets
//    - Key Features: Creation and trading of synthetic assets like sUSD, sETH.
// 11. GMX
//    - Category: Perpetual futures
//    - Key Features: Leveraged trading for perpetual contracts.
// 12. dYdX
//    - Category: Decentralized derivatives
//    - Key Features: Advanced trading tools with perpetual markets.
// 13. Frax Finance
//    - Category: Stablecoin protocol
//    - Key Features: Fractional-algorithmic stablecoin (FRAX).
// 14. Convex Finance
//    - Category: Yield optimizer
//    - Key Features: Boosted returns for Curve liquidity providers.
// 15. Rocket Pool
//    - Category: Liquid staking
//    - Key Features: Decentralized staking for Ethereum 2.0.

// Top Cryptocurrency Market Indices
// 1. S&P Cryptocurrency Top 10 Equal Weight Index
//    - Tracks the performance of the top 10 cryptocurrencies.
// 2. CoinMarketCap 100 Index
//    - Reflects the performance of the top 100 cryptocurrencies by market cap.
// 3. Crypto Fear and Greed Index
//    - Measures sentiment in the crypto market on a scale from 0 (extreme fear) to 100 (extreme greed).
// 4. Bitwise 10 Crypto Index Fund
//    - A market-cap-weighted index of the top 10 cryptocurrencies.
// 5. CIX100
//    - AI-driven index tracking the top 100 performing cryptocurrencies.
// 6. FTSE Digital Assets Index Series
//    - Tracks the performance of major cryptocurrencies and digital assets.
// 7. NASDAQ Crypto Index (NCI)
//    - Monitors the performance of leading cryptocurrencies.
// 8. MVIS CryptoCompare Digital Assets 100 Index
//    - Captures the performance of the 100 largest cryptocurrencies by market capitalization.

// Top Foreign Exchange (FX) Market Indices
// 1. U.S. Dollar Index (DXY)
//    - Measures the USD against six major currencies: EUR, JPY, GBP, CAD, SEK, CHF.
// 2. Euro Currency Index (EXY)
//    - Tracks the euro’s performance against a basket of major world currencies.
// 3. British Pound Index (BXY)
//    - Measures GBP’s value relative to key currencies.
// 4. Japanese Yen Index (JXY)
//    - Evaluates the yen against major global currencies.
// 5. Swiss Franc Index (SXY)
//    - Tracks the value of CHF against a basket of global currencies.
// 6. Trade-Weighted U.S. Dollar Index
//    - Measures USD strength weighted by trade volumes with other countries.
// 7. Emerging Markets FX Index
//    - Tracks currency performance in emerging markets, including BRL, MXN, ZAR, TRY.
// 8. JP Morgan Emerging Market Currency Index (EMCI)
//    - Tracks a basket of emerging market currencies.
// 9. Bloomberg Dollar Spot Index (BBDXY)
//    - Measures the value of the USD against 10 global currencies, weighted by liquidity.
// 10. Chinese Yuan Index (CNYX)
//    - Monitors the performance of the yuan in the global FX market.
// 11. Asian Dollar Index (ADXY)
//    - Tracks the performance of Asian currencies against the USD.
// 12. ICE Currency Indices
//    - Includes global currency indices like the USDX, EURX, and JPYX.
