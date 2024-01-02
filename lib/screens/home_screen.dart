// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:async';

import 'package:bus_route_app/screens/qrcode.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';


import 'package:bus_route_app/utils/news_api.dart';
import 'package:bus_route_app/widgets/clock_widget.dart';
import 'package:bus_route_app/widgets/calender_widget.dart';
import 'package:bus_route_app/widgets/weather_widget.dart';

import 'package:bus_route_app/utils/env.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // * TIME
  String formattedTime = DateFormat('kk:mm').format(DateTime.now());
  String formattedDate = DateFormat('dd MMM').format(DateTime.now());
  Duration updateTimeTimer = const Duration(seconds: 1);
  void update_time(Timer timer) {
    if(mounted){
      setState(() {
        formattedTime = DateFormat('kk:mm').format(DateTime.now());
      });
    }   
  }

  // * WEATHER
  String weatherDescripton = '';
  final WeatherFactory _weatherFactory = WeatherFactory("bb9b6dc2f49ef997088963b20889a2f4"); // TODO: add to settings
  String weatherCityName = "Kathmandu"; // TODO: add to settings
  void fetch_weather(){
    Future _weatherData = _weatherFactory.currentWeatherByCityName(weatherCityName);
    _weatherData.then((value) {
      Weather wdat = value; weatherDescripton = wdat.weatherDescription ?? "N/A";
    });
  }

  // * NEWS
  final NewsApi _news_api = NewsApi(news().country, news().token);
  var articles;
  void fetch_news(){
    Future _newsData = _news_api.get_news_top();
    _newsData.then((value) {
      var res = value;
      if(res.statusCode == 200){
        setState(() {
          articles = Future.value(res);
        });
      }
    });
  }
  Widget news_list_view(snapshot){
    if(snapshot.hasData){
      var _articles = jsonDecode(snapshot.data.body);
      _articles = _articles["articles"];
      return RefreshIndicator(child: 
        ListView.separated(
          itemBuilder: (context, index) {
            var _article = _articles[index];
            return ListTile(
              leading: const Icon(Icons.newspaper),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRScreen(link: _article['url'], article: _article['title'],)
                  )
                );
              },
              title: Text(_article["title"]),
              subtitle: Text(_article['description'] == null? " ":_article["description"]),
              trailing: const Icon(Icons.exit_to_app_outlined)
            );
          },
          separatorBuilder: (context, index){
            return const Divider();
          },
          itemCount: _articles.length,
          shrinkWrap: true,
        ),
        onRefresh: () async{
          fetch_news();
        },
        );
      }
      else if (snapshot.hasError){
        return Text(snapshot.error.toString());
      }
    return const Center(child: CircularProgressIndicator(),);
  }

  @override
  void initState(){
    super.initState();
    fetch_weather();
    fetch_news();
    Timer.periodic(updateTimeTimer, update_time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
            const Divider(),
            Align(
              alignment: Alignment.topLeft, 
              child: Text("Time, Weather and Date",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.grey.shade700),
              ),
            ),
            const Divider(),
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClockWidget(widgetTextData: formattedTime), // TODO OPTIMIZED IMAGE
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: WeatherWidget(widgetTextData: weatherDescripton),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CalenderWidget(widgetTextData: formattedDate),
              )
            ],
          ),
          const Divider(),
          Align(
              alignment: Alignment.topLeft, 
              child: Text("Todays News",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.grey.shade700),
              ),
          ),
          const Divider(),
          Expanded(
            child: FutureBuilder(future: articles, builder: 
              (context, AsyncSnapshot snapshot) {
                return news_list_view(snapshot);
              }
            )
          ),
        ]
      )
    );
  }
}