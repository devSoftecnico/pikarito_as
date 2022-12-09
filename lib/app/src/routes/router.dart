import 'package:pikarito_as/app/exports.dart';

class RouterFluro {
  static FluroRouter fluroRouter = FluroRouter();

  static var MenuHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const MenuPage();
    },
  );

  static var MainHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const MainPage();
    },
  );

  static var HomeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const HomePage();
    },
  );

  static var PrimaryHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const PrimaryPage();
    },
  );

  static var SecondaryHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const SecondaryPage();
    },
  );

  static initRoutes() {
    fluroRouter.define('/', handler: MenuHandler);
    fluroRouter.define('main', handler: MainHandler);
    fluroRouter.define('home', handler: HomeHandler);
    fluroRouter.define('primary', handler: PrimaryHandler);
    fluroRouter.define('secondary', handler: SecondaryHandler);
  }
}
