# AESCrypt - Simple AES encryption / decryption for Ruby

AESCrypt is a simple to use, opinionated AES encryption / decryption Ruby gem that just works.

AESCrypt uses the AES-128-CBC cipher and encodes the encrypted data with Base64.

## Installation

Add this line to your application's Gemfile:

    gem 'aes-128'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aes-128

## Usage

    message = "top secret message"
    password = "p4ssw0rd"

Encrypting

    encrypted_data = AES128.encrypt(message, password)

Decrypting

    message = AES128.decrypt(encrypted_data, password)

## Advanced usage

Encrypting

    encrypted_data = encrypt_data(data, key, iv, cipher_type)

Decrypting

    decrypted_data = decrypt_data(encrypted_data, key, iv, cipher_type)

## Acknowledgement

  I took reference from the repo https://github.com/Gurpartap/aescrypt. Thanks Gurpartap Singh for sharing idea.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
