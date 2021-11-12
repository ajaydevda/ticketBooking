import 'package:encrypt/encrypt.dart';

class AesEncryption{

  final key=Key.fromUtf8("2019SCS@FT9876MOB9098762");
  final iv=IV.fromUtf8("drowssapdrowssap");
  var encryption;

  AesEncryption()
  {
    encryption= Encrypter(AES(key,mode: AESMode.cbc,padding:"PKCS7"));
  }

  encryptData({input})
  {
   var encrypted = encryption.encrypt(input, iv: iv);
    print(encrypted.base64);
   return encrypted;
  }

  decryptData({encrypted})
  {
    var deCrypted= encryption.decrypt(encrypted, iv: iv);
    return  deCrypted;

  }

}