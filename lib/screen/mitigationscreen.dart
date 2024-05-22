import 'package:apptubes/models/weatermodel.dart';
import 'package:apptubes/services/weaterservice.dart';
import 'package:apptubes/util/disaster_card.dart';
import 'package:flutter/material.dart';

class MitigationScreen extends StatefulWidget {
  @override
  State<MitigationScreen> createState() => _MitigationScreenState();
}

class _MitigationScreenState extends State<MitigationScreen> {
  final _weatherService =weatherService('abe1b99a3ec5c3cb0c5d3ef43264d1ff');
  Weather? _weather;

  _fetchWeather() async {
    String cityname = await _weatherService.getCurrentlyCity();

    try{
      final weather = await _weatherService.getWeather(cityname);
      setState(() {
        _weather = weather;
      });
    }

    catch (e){
      print(e);
    }
  }

  final List DisasterList = [
    ['VOLCANO', 'lib/icons/42463volcano_99098.png'],
    ['FLOD', 'lib/icons/landslide.png'],
    ['TSUNAMI', 'lib/icons/tsunami_wavesw_ave_sea_natural_phenomenon_icon_194273.png'],
    ['EARTHQUAKE', 'lib/icons/earthquake_earth_ground_floor_planet_natural_phenomenon_icon_194292.png'],
    ['LANDSLIDE', 'lib/icons/landslide_land_rocks_stones_slope_icon_194275.png']
  ];

  @override
  void initState(){
    super.initState();

    _fetchWeather();
  }

  final List MitigationList = [
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Mitigation',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 35,
                    ),
                    SizedBox(width: 8.0),
                    Text(_weather?.cityname ?? "loading city.."),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${_weather?.temperature.round()}`C'),
                    SizedBox(width: 8.0),
                    Icon(
                      Icons.wb_sunny_outlined,
                      size: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Tsunami, Earthquake, etc.',
                        prefixIcon: Icon(Icons.search_sharp)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25),

          Container(
            width: 386,
            height: 525,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: ListView.builder(
              itemCount: DisasterList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index){
              return DisasterCard(
                disasterImagePath: DisasterList[index][1],
                disaster: DisasterList[index][0]
              );
            }),
          )
        ],
      ),
    );
  }
}