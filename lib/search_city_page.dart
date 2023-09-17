import 'package:clima/home_page.dart';
import 'package:flutter/material.dart';

class SearchCityPage extends StatelessWidget {
  const SearchCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_city,
              size: 30.0,
            ),
            /*TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),*/
            TextButton(
              onPressed: () {
                /*Navigator.pop(context, MaterialPageRoute(builder: (context) {
                  return HomePage(weather: weather);
                }));*/
              },
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
