# -*- encoding: utf-8 -*-

# The encrypt_data and decrypt_data methods are Copyright (c) 2007 Brent Sowers
# and have been included with prior permission.
#
# I am creating this for my personal use and I did refer https://github.com/Gurpartap/aescrypt for licensing
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'openssl'
require 'base64'

module AES128
  def self.encrypt(message, password)
    Base64.encode64(self.encrypt_data(message.to_s.strip, self.key_digest(password), nil, "AES-128-CBC"))
  end

  def self.decrypt(message, password)
    base64_decoded = Base64.decode64(message.to_s.strip)
    self.decrypt_data(base64_decoded, self.key_digest(password), nil, "AES-128-CBC")
  end

  def self.key_digest(password)
    OpenSSL::Digest::SHA256.new(password).digest
  end

  # Decrypts a block of data (encrypted_data) given an encryption key
  # and an initialization vector (iv).  Keys, iv's, and the data 
  # returned are all binary strings.  Cipher_type should be
  # "AES-128-CBC", "AES-128-ECB", or any of the cipher types
  # supported by OpenSSL.  Pass nil for the iv if the encryption type
  # doesn't use iv's (like ECB).
  #:return: => String
  #:arg: encrypted_data => String 
  #:arg: key => String
  #:arg: iv => String
  #:arg: cipher_type => String
  def self.decrypt_data(encrypted_data, key, iv, cipher_type)
    aes = OpenSSL::Cipher::Cipher.new(cipher_type)
    aes.decrypt
    aes.key = key
    aes.iv = iv if iv != nil
    aes.update(encrypted_data) + aes.final  
  end

  # Encrypts a block of data given an encryption key and an 
  # initialization vector (iv).  Keys, iv's, and the data returned 
  # are all binary strings.  Cipher_type should be "AES-128-CBC",
  # "AES-128-ECB", or any of the cipher types supported by OpenSSL.  
  # Pass nil for the iv if the encryption type doesn't use iv's (like
  # ECB).
  #:return: => String
  #:arg: data => String 
  #:arg: key => String
  #:arg: iv => String
  #:arg: cipher_type => String  
  def self.encrypt_data(data, key, iv, cipher_type)
    aes = OpenSSL::Cipher::Cipher.new(cipher_type)
    aes.encrypt
    aes.key = key
    aes.iv = iv if iv != nil
    aes.update(data) + aes.final      
  end
end
