import CryptoBuzz from 0x05
import NonFungibleToken from 0x05

pub fun main(address: Address): [UInt64] {
  let publicCollection = getAccount(address).getCapability(/public/CryptoBuzz)
              .borrow<&CryptoBuzz.Collection>()
              ?? panic("This address does not have a any previous Collection.")


 let counts = publicCollection.getIDs()
log(counts)
 return counts


}
