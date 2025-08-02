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
                  Text("""
                 \n بعض المعلومات حول اعربلي :
1. لتفادي الأخطاء يرجى كتابة الجملة بلغةٍ عربيةٍ صحيحة. \n
 \n2. اعربلي حصل علي نسبة إعراب صحيح ب 99.6% (جمل عربية صحيحة 100%)
3. اعربلي قائم سيرفر ضعيف لذلك عندما يكون هنالك ضغط قوي علي الموقع سيتم تحويل الاعراب اللي موديل اقل ذكائا (يأتي بنسبة اعراب صحيح 64%) \n
                  
           Developed by Youssef pplo \n
           Designed by Toka Alaa
                  """,
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
