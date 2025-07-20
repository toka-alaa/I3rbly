import 'package:flutter/material.dart';
import 'package:i3rbly/widgets/i3rbly_text.dart';
import 'package:i3rbly/widgets/text_field.dart';

import '../widgets/button.dart';
import '../widgets/info_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        actions: [
          InfoIcon()
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100),

                I3rblyText(),

                SizedBox(height: 30),

                Text(
                  'لتفادي الأخطاء يرجى كتابة الجملة بتشكيل و لغة عربية صحيحة',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 10),

               Field(),

                SizedBox(height: 20),

                Button(),

                SizedBox(height: 200,),

                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'يمكن أن يخطئ أعربلي ليس دقيقًا بنسبة 100%\nصنع في مصر',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
