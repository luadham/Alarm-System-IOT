import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alarmsystem/main.dart';
import 'package:alarmsystem/provider/theme_provider.dart';
import 'package:alarmsystem/widget/change_theme_button_widget.dart';

class HomePage extends StatelessWidget {
/*   @override
   Widget build(BuildContext context) => Scaffold(
         appBar: AppBar(
           iconTheme: Theme.of(context).iconTheme,
           backgroundColor: Colors.transparent,
           leading: Icon(Icons.menu),
           title: Text(MyApp.title),
           elevation: 0,
           actions: [
             ChangeThemeButtonWidget(),
           ],
         ),
         body: ProfileWidget(),
         extendBody: true,
         bottomNavigationBar: NavigationBarWidget(),
       );*/

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        title: const Text(MyApp.title,
            style: TextStyle(
            fontSize: 20,
            fontFamily: 'dogicapixel'
        )),
        actions: [
        const IconButton(
        icon: Icon(Icons.lightbulb_outline_sharp)),
          ChangeThemeButtonWidget(),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
          children: List.generate(1, (index) {
            return Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'Numpad Device\n\n\n',
                    style: Theme.of(context).textTheme.bodyText1),
                    TextSpan(text: ' Current password is\n\n\t\t\t\t\t 12345',
                    style: Theme.of(context).textTheme.bodyText1),
            ],
            ),
              )
            );
          }
          )
        )
    );
  }
}