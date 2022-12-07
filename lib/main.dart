import 'package:pikarito_as/app/exports.dart';

void main() => runApp(const CanvasPainting());

class CanvasPainting extends StatelessWidget {
  const CanvasPainting({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pikarito´as',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
