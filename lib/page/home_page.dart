import 'package:alarmsystem/assets/UIStrings.dart';
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
              style: TextStyle(fontSize: 20, fontFamily: 'dogicapixel')),
          actions: [
            const IconButton(icon: Icon(Icons.lightbulb_outline_sharp)),
            ChangeThemeButtonWidget(),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(UIStrings.projectName,
                  style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(
                // ! if you want to add space in flutter use Sized Box :)
                height: 20,
              ),
              Text(
                'Password: 123456',
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
        ));
  }
}
