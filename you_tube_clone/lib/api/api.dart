// lib/api/api.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:you_tube_clone/models/video.dart';
import 'package:you_tube_clone/models/canal.dart';

const String API_KEY = '';
const String CHANNEL_ID = 'UCplT2lzN6MHlVHHLt6so39A';
const String BASE_URL = 'https://www.googleapis.com/youtube/v3/';

class API {
  Future<List<Video>> searchVideos(String search) async {
    // Construção da URL para a API
    // Uri.parse("${BASE_URL}search"): cria a URL base
    // .replace(queryParameters: {...}): adiciona os parâmetros da URL, ou seja, tudo depois do ? por &
    Uri uri = Uri.parse("${BASE_URL}search").replace(
      queryParameters: {
        "part": "snippet",
        "type": "video",
        "maxResults": "20",
        "order": "date",
        "key": API_KEY,
        // "channelId": CHANNEL_ID,
        "q": search,
      },
    );

    try {
      //  Enviando a requisição HTTP
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        // Transformando o texto JSON em um Objeto Map
        Map<String, dynamic> dataJson = json.decode(response.body);
        // Convertendo os vídeos para objetos Video
        List items = dataJson["items"];
        List<Video> videoList =
            items.map<Video>((map) => Video.fromJson(map)).toList();

        // Retornando a lista
        return videoList;
      } else {
        print("Erro: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro de requisição $e");
    }

    return [];
  }

  Future<Canal?> getCanal() async {
    Uri uri = Uri.parse("${BASE_URL}channels").replace(
      queryParameters: {
        "part": "snippet,statistics",
        "id": CHANNEL_ID,
        "key": API_KEY,
      },
    );

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> dataJson = json.decode(response.body);
        List items = dataJson["items"];

        if (items.isNotEmpty) {
          return Canal.fromJson(items[0]);
        }
      } else {
        print("Erro ao buscar canal: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro de requisição ao buscar canal: $e");
    }

    return null;
  }
}
