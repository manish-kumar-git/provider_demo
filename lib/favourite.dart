import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/myFavourite.dart';
import 'package:provider_demo/provider/foundation.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}
bool switchh =false;
class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    print('BUILD');
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Favourites'),
            IconButton(
              icon: Icon(Icons.favorite_sharp),
              color: Colors.blueGrey.shade100,
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const MyFavourites()));
              },
            )
          ],
        ),
        actions: [],
      ),
      body: Column(
        children: [
          Consumer<DarkThemeProvider>(builder: (context,val,child){
            return
            CupertinoSwitch(
            value: val.isDark,
            onChanged: (value) {
              val.changeTheme(value);
              // setState(() {
              //   switchValue = value;
              // });
            },
          );
          }),
          
          Consumer<FavouriteProvider>(builder: (context, value, child) {
            return Expanded(
              child: ListView.builder(itemBuilder: ((context, index) {
                return ListTile(
                  onTap: (() {
                    if (value.favItem.contains(index)) {
                      value.removeItem(index);
                    } else {
                      value.addSelected(index);
                    }
                  }),
                  title: Text(
                    'Item $index',
                    style: TextStyle(
                         fontSize: 15),
                  ),
                  trailing: Icon(value.favItem.contains(index)
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
