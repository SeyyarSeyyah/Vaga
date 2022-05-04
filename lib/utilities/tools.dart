import 'dart:convert';

import 'package:flutter/services.dart';

class Tools {
  // client bilgilerini base64 formatına çeviren fonksiyon
  static cliendEncoder({cliendId, String cliendSecretId}) {
    var client_Creds = "$cliendId:$cliendSecretId";
    var clienByte = utf8.encode(client_Creds);

    var clientBase64 = base64.encode(clienByte);
    return clientBase64;
  }

// özel karakterleri istenilen formata getiren fonksiyon
  static String queryFormater(String q) {
    q.replaceAll("Ç", "%C3%87");
    q.replaceAll("ç", "%C3%A7");
    q.replaceAll("Ğ", "%C4%9E");
    q.replaceAll("ğ", "%C4%9F");
    q.replaceAll("İ", "%C4%B0");
    q.replaceAll("ı", "%C4%B1");
    q.replaceAll("Ö", "%C3%96");
    q.replaceAll("ö", "%C3%B6");
    q.replaceAll("Ş", "%C5%9E");
    q.replaceAll("ş", "%C5%9F");
    q.replaceAll("Ü", "%C3%9C");
    q.replaceAll("ü", "%C3%BC");

    return q;
  }
}
