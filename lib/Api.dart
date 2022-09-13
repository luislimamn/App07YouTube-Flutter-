import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:youtube/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyAK6AZ-G-DoUNjIM6vTDT2rOuoYH4P5-rs";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";

class Api {
  //Uri _urlBase = Uri.parse(URL_BASE);
  //Uri _urlPesquisa = Uri.parse(URL_BASE+"search");
  Future<List<Video>>? pesquisar(String pesquisa) async {
    try {
      List<Video>? listsVideos = [];
      listsVideos = await fetchMatches(pesquisa);
      return listsVideos!;
    } catch (Exc) {
      List<Video>? listsVideos = [];
      return listsVideos!;
      print(Exc);
    }
  }
  Future<List<Video>>? fetchMatches(String pesquisa) async {
    List<Video>? videos = [];
    Uri _urlPesquisa = Uri.parse(
        URL_BASE+"search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"
    );
    http.Response response = await http.get(_urlPesquisa);

    if(response.statusCode == 200){
      Map<String, dynamic> dadosJson = json.decode(response.body);
      videos = dadosJson["items"].map<Video>(
              (map){
            //return Video.converterJson(map);
            return Video.fromJason(map);
          }
      ).toList();

      return videos!;
      /*for(var video in videos){
        print("Resultado: " + video.titulo.toString());
      }*/
      //print("Resultado: " + response.body);
      //print("Resultado: " + dadosJson["pageInfo"].toString());
      //print("Resultado: " + dadosJson["items"][0]["id"]["videoId"].toString());
      //print("Resultado: " + dadosJson["items"][0]["snippet"]["title"].toString());
    }else{
      return videos!;
    }
  }
}