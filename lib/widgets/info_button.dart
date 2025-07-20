import 'package:flutter/material.dart';

class InfoIcon extends StatefulWidget {
  const InfoIcon({super.key});

  @override
  _InfoIconState createState() => _InfoIconState();
}

class _InfoIconState extends State<InfoIcon> {
  bool isSelected = false;

  void _showHelpDialog() async {
    setState(() {
      isSelected = true;
    });

    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text("# put your help text here",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    setState(() {
      isSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isSelected ? Icons.cancel : Icons.help,
        color: Colors.cyan,
        size: 30,
      ),
      onPressed: () {
        if (!isSelected) {
          _showHelpDialog();
        }
      },
    );
  }
}
