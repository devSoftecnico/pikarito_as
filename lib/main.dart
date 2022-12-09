import 'package:pikarito_as/app/exports.dart';
import 'package:pikarito_as/app/src/routes/router.dart';

void main() => runApp(const CanvasPainting());

class CanvasPainting extends StatefulWidget {
  const CanvasPainting({super.key});

  @override
  State<CanvasPainting> createState() => _CanvasPaintingState();
}

class _CanvasPaintingState extends State<CanvasPainting> {
  @override
  void initState() {
    super.initState();
    RouterFluro.initRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Pikarito´as',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouterFluro.fluroRouter.generator,
    );
  }
}
