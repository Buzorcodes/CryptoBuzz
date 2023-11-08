
# CryptoBuzz NFT

## Overview

The `CryptoBuzz` Cadence contract is a non-fungible token (NFT) collection contract implemented in Cadence. It allows users to create, own, and manage NFTs within their collections. This README provides an overview of the contract structure and its functionalities.

## Contract Structure

The `CryptoBuzz` contract consists of the following components:

### `CryptoBuzz` Contract

-   Inherits from the `NonFungibleToken` contract.
-   Maintains the `totalSupply` of NFTs.
-   Emits the `ContractInitialized`, `Withdraw`, and `Deposit` events.
-   Defines a resource called `NFT` with properties like `id`, `name`, `favouriteFood`, and `luckyNumber`.
-   Defines a resource called `Collection`, which implements the `NonFungibleToken.Provider`, `NonFungibleToken.Receiver`, and `NonFungibleToken.CollectionPublic` interfaces.
-   `Collection` includes functions for withdrawing, depositing, getting NFT IDs, borrowing NFT references, and initializing/destroying collections.
-   Provides functions to create an empty collection and a minter.

### `Minter` Resource

-   Defines a resource called `Minter` with functions for creating NFTs and minters.

## Transactions

The contract provides two transaction scripts:

1.  **`createNFT` Transaction**:
    
    -   This transaction allows the contract owner to create an NFT and deposit it into their collection.
    -   It retrieves the `Minter` reference and calls `createNFT` to create a new NFT.
    -   It then deposits the NFT into the owner's collection.
2.  **`setupCollection` Transaction**:
    
    -   This transaction sets up a user's NFT collection.
    -   It creates an empty collection using the `createEmptyCollection` function and links it to the user's public account.

## Scripts

The contract provides two Cadence scripts:

1.  **`getNFTCount` Script**:
    
    -   This script takes an address as an argument and retrieves the user's collection using their account's capability.
    -   It then calls `getIDs` on the collection to get the count of owned NFTs and returns it.
2.  **`getNFTDetails` Script**:
    
    -   This script takes an address and an NFT ID as arguments.
    -   It retrieves the user's collection using their account's capability and borrows an NFT reference.
    -   It logs the NFT's name, favorite food, and lucky number and returns the NFT reference.
