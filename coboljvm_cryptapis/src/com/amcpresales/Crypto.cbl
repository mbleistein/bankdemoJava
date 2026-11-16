      $set ilusing"javax.crypto"
      $set ilusing"javax.crypto.spec"
      $set ilusing"java.util"
      $set ilusing"javax.xml.bind"
      $set ilusing"java.security"
      $set ilusing"java.lang.reflect"
      $set ilusing"java.nio.charset".

       class-id com.amcpresales.Crypto public.

       working-storage section.
       01 byteIV type IvParameterSpec.
       01 skeySpec type SecretKeySpec.
       01 keyBytes type byte occurs any.
       01 IVBytes  type byte occurs any.
       01 encrypted Type byte occurs any.
       01 decrypted type byte occurs any.
       01 SaltStr string value "demosalt".
       
       *> Plain String interface
       method-id Encrypt (plainText as String, passwrdStr as String)
                                     returning cipherText as String public.
       01 cipher Type Cipher.


           set keyBytes to (SaltStr & passwrdStr)::getBytes("UTF-8")
           set keyBytes to type Arrays::copyOf(keyBytes, 16)
           set IVBytes to ReverseArray(keyBytes)
           try
               set byteIV to new IvParameterSpec(IVBytes)
               set skeySpec to new SecretKeySpec(keyBytes, "AES")
               set cipher to type Cipher::getInstance("AES/CBC/PKCS5Padding")
               invoke cipher::init(type Cipher::ENCRYPT_MODE, skeyspec, byteIV)
               set encrypted to cipher::doFinal(plainText::getBytes())
               set ciphertext =  type Base64::getEncoder()::encodeToString(encrypted)  
                                           
           catch e AS TYPE Exception
              invoke type System::out::println(e::getMessage())
           finally
               set cipher to null
           end-try
           
           goback.
       end method.
       
       *> Byte Array interface
       method-id Encrypt (plainTextBytes as type byte occurs any, passwrdStr as String)
                                     returning cipherText as String public.
       01 cipher Type Cipher.
       
           set keyBytes to (SaltStr & passwrdStr)::getBytes("UTF-8")
           set keyBytes to type Arrays::copyOf(keyBytes, 16)
           set IVBytes to ReverseArray(keyBytes)
           TRY
               set byteIV to new IvParameterSpec(IVBytes)
               set skeySpec to new SecretKeySpec(keyBytes, "AES")
               set cipher to type Cipher::getInstance("AES/CBC/PKCS5Padding")
               invoke cipher::init(type Cipher::ENCRYPT_MODE, skeyspec, byteIV)
               set encrypted to cipher::doFinal(plainTextBytes)
               set ciphertext =  type Base64::getEncoder()::encodeToString(encrypted)             
               
           CATCH e AS TYPE Exception
               invoke type System::out::println(e::getMessage())
           finally
               set cipher to null
           END-TRY
           
           goback.
       end method.
       
       
       
       method-id Decrypt (cipherText as String, passwrdStr as String)
                                     returning dcInfo as type DecryptInfo public.
       01 cipher Type Cipher.
       01 baCT  type byte occurs any.
       
           set keyBytes to (SaltStr & passwrdStr)::getBytes("UTF-8")
           set keyBytes to type Arrays::copyOf(keyBytes, 16)
           set IVBytes to ReverseArray(keyBytes)
           set dcInfo to new DecryptInfo
       
           try
               set byteIV to new IvParameterSpec(IVBytes)
               set skeySpec to new SecretKeySpec(keyBytes, "AES")               
               set cipher to type Cipher::getInstance("AES/CBC/PKCS5Padding")

               invoke cipher::init(type Cipher::DECRYPT_MODE, skeyspec, byteIV)
               set baCT to type Base64::getDecoder()::decode(ciphertext)
               set decrypted to cipher::doFinal(baCT)
               
               set dcInfo::ResultMessage to new String(decrypted)
               set dcInfo::Result to true
               
           catch
               set dcInfo::ResultMessage to exception-object::getMessage()
               set dcInfo::Result to false
           finally
               set cipher to null        
           end-try
           
           goback.
      
       end method.
       
       method-id ReverseArray (by value inArray as type byte occurs any) 
               returning outArray as type byte occurs any private.

       declare j as binary-long = type Array::getLength(inArray) - 1
       declare tmp as type byte
       set outArray to type Arrays::copyOf(inArray, 16)
       
       perform varying i as binary-long from 0 by 1 until i > j
           set tmp to outArray[j]
           set outArray[j] to outArray[i]
           set outArray[i] to tmp
           set j = j - 1
       end-perform
       goback

       end method.
       
       class-id DecryptInfo sharing parent.
       01 Result condition-value property.
       01 ResultMessage String property.
       01 ResultBytes type byte occurs any property.
       end class.
       
       end class.       


       
       
