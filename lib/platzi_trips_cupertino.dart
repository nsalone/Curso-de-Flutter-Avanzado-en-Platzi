import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/ui/screens/home_trips.dart';
import 'package:platzi_trips_app/Place/ui/screens/search_trips.dart';
import 'package:platzi_trips_app/User/ui/screens/profile_trips.dart';

import 'User/bloc/bloc_user.dart';

class PlatziTripsCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.home, color: Colors.indigo),
              icon: Icon(Icons.home, color: Colors.white70),
              title: Text("")),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.search, color: Colors.indigo),
              icon: Icon(Icons.search, color: Colors.white70),
              title: Text("")),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.person, color: Colors.indigo),
              icon: Icon(Icons.person, color: Colors.white70),
              title: Text("")),
        ]),

        // ignore: missing_return
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchTrips(),
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return BlocProvider<UserBloc>(
                    bloc: UserBloc(),
                    child: ProfileTrips(),
                  );
                },
              );
              break;
          }
        },
      ),
    );
  }
}
