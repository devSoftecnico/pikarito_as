import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pikarito_as/app/exports.dart';

class CustomFab extends StatefulWidget {
  const CustomFab({super.key});

  @override
  State<CustomFab> createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab> {
  List<TouchPoints> points = [];
  double opacity = 1.0;
  StrokeCap strokeType = StrokeCap.round;
  double strokeWidth = 3.0;
  Color selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    List<SpeedDialChild> childButtons = [];

    childButtons.add(
      SpeedDialChild(
        backgroundColor: Colors.white,
        child: colorMenuItem(Colors.green),
        onTap: () {
          setState(() {
            selectedColor = Colors.green;
          });
        },
        label: 'Color',
      ),
    );

    childButtons.add(
      SpeedDialChild(
        backgroundColor: Colors.white,
        child: colorMenuItem(Colors.blue),
        onTap: () {
          setState(() {
            selectedColor = Colors.blue;
          });
        },
        label: 'Color',
      ),
    );

    childButtons.add(
      SpeedDialChild(
        backgroundColor: Colors.white,
        child: colorMenuItem(Colors.pink),
        onTap: () {
          setState(() {
            selectedColor = Colors.pink;
          });
        },
        label: 'Color',
      ),
    );

    childButtons.add(
      SpeedDialChild(
        backgroundColor: Colors.white,
        child: colorMenuItem(Colors.yellow),
        onTap: () {
          setState(() {
            selectedColor = Colors.yellow;
          });
        },
        label: 'Color',
      ),
    );

    childButtons.add(
      SpeedDialChild(
        backgroundColor: Colors.white,
        child: colorMenuItem(Colors.red),
        onTap: () {
          setState(() {
            selectedColor = Colors.red;
          });
        },
        label: 'Color',
      ),
    );

    childButtons.add(
      SpeedDialChild(
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.clear,
          color: Colors.white,
          size: 25.0,
        ),
        onTap: () {
          setState(() {
            points.clear();
          });
        },
        label: 'Eliminar',
      ),
    );

    childButtons.add(
      SpeedDialChild(
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.opacity,
          color: Colors.white,
          size: 25.0,
        ),
        onTap: () {
          setState(() {
            _opacity();
          });
        },
        label: 'Opacidad de pintura',
      ),
    );

    childButtons.add(
      SpeedDialChild(
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.brush,
          color: Colors.white,
          size: 25.0,
        ),
        onTap: () {
          setState(() {
            _pickStroke();
          });
        },
        label: 'Trazo de pintura',
      ),
    );

    return SpeedDial(
      spacing: 15.0,
      icon: Icons.add,
      activeIcon: Icons.close,
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      children: childButtons,
    );
  }

  Future<void> _opacity() async {
    //Shows AlertDialog
    return showDialog<void>(
      context: context,

      //Dismiss alert dialog when set true
      barrierDismissible: true,

      builder: (BuildContext context) {
        //Clips its child in a oval shape
        return ClipOval(
          child: AlertDialog(
            //Creates three buttons to pick opacity value.
            actions: <Widget>[
              TextButton(
                child: const Icon(
                  Icons.opacity,
                  size: 24,
                ),
                onPressed: () {
                  //most transparent
                  opacity = 0.1;
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Icon(
                  Icons.opacity,
                  size: 40,
                ),
                onPressed: () {
                  opacity = 0.5;
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Icon(
                  Icons.opacity,
                  size: 60,
                ),
                onPressed: () {
                  //not transparent at all.
                  opacity = 1.0;
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickStroke() async {
    //Shows AlertDialog
    return showDialog<void>(
      context: context,

      //Dismiss alert dialog when set true
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        //Clips its child in a oval shape
        return ClipOval(
          child: AlertDialog(
            //Creates three buttons to pick stroke value.
            actions: <Widget>[
              //Resetting to default stroke value
              TextButton(
                child: const Icon(
                  Icons.clear,
                ),
                onPressed: () {
                  strokeWidth = 3.0;
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Icon(
                  Icons.brush,
                  size: 24,
                ),
                onPressed: () {
                  strokeWidth = 10.0;
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Icon(
                  Icons.brush,
                  size: 40,
                ),
                onPressed: () {
                  strokeWidth = 30.0;
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Icon(
                  Icons.brush,
                  size: 60,
                ),
                onPressed: () {
                  strokeWidth = 50.0;
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget colorMenuItem(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: ClipOval(
        child: Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          height: 36,
          width: 36,
          color: color,
        ),
      ),
    );
  }
}
