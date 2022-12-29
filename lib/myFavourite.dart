import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/foundation.dart';

class MyFavourites extends StatefulWidget {
  const MyFavourites({super.key});

  @override
  State<MyFavourites> createState() => _MyFavouritesState();
}

class _MyFavouritesState extends State<MyFavourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(child: Text('My Favourites !',style: TextStyle(color: Colors.blueGrey.shade600,fontWeight: FontWeight.w700,fontSize: 25),)),
          ),
          Consumer<FavouriteProvider>(builder: (context, value, child) {
            return Expanded(
              child: ListView.builder(itemCount: value.selected.length,itemBuilder: ((context, index) {
                return ListTile(
                  onTap: (() {
                    if (value.favItem.contains(index)) {
                      value.removeItem(index);
                    } else {
                      value.addSelected(index);
                    }
                  }),
                  title: Text(
                    'Item ${index+1}',
                    style: TextStyle(
                        color: Colors.blueGrey.shade900, fontSize: 15),
                  ),
                  trailing: Icon(value.favItem.contains(index+1)
                      ? Icons.favorite
                      : Icons.favorite_border_outlined),
                );
              })),
            );
          }),
        ],
      ),
    );
  }
}