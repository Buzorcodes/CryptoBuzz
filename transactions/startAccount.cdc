import CryptoBuzz from "../contracts/CryptoBuzz.cdc";
transaction() {
  prepare(signer: AuthAccount) {
    // Store a `CryptoBuzz.Collection` in our account storage.
    signer.save(<- CryptoBuzz.createEmptyCollection(), to: /storage/CryptoBuzz)

    // Link it to the public.
    signer.link<&CryptoBuzz.Collection>(/public/CryptoBuzz, target: /storage/CryptoBuzz)
  }
}
