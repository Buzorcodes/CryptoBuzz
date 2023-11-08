import CryptoBuzz from "../contracts/CryptoBuzz.cdc";
import NonFungibleToken from "../contracts/NonFungibleToken.cdc"


transaction(account: Address) {

  prepare(owner: AuthAccount) {

    let minter = owner.borrow<&CryptoBuzz.Minter>(from: /storage/Minter)
                    ?? panic("This owner did not deploy this contract.")


    let accountsCollection = getAccount(account).getCapability(/public/CryptoBuzz)
              .borrow<&CryptoBuzz.Collection{NonFungibleToken.CollectionPublic}>()
              ?? panic("This address does not have any Collection.")



    let nft <- minter.createNFT(name:"CryptoBuzz", favouriteFood: "PIZZA", luckyNumber: 28)

    accountsCollection.deposit(token: <- nft)
  }

}
