import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:i3rbly/widgets/i3rbly_text.dart';

import '../widgets/info_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  String result = "";
  bool isLoading = false;

  Future<void> geti3rab(String sentence) async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse('https://i3rbly.com/chat');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"message": sentence}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        result = data['response'];

      });
    } else {
      setState(() {
        result = "حدث خطأ في الإتصال";
      });
    }

    setState(() {
      isLoading = false;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        surfaceTintColor: Colors.grey.shade900 ,
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

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: controller,
                    cursorColor: Colors.white,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(

                      hintText: 'اكتب أي جملة للحصول على إعرابها',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        geti3rab(controller.text);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                      ),
                      child: Text('أعربلي',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                !isLoading
                    ? result.isNotEmpty
                    ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    color: Colors.grey[850],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding:  EdgeInsets.all(16.0),
                      child: Html(
                        data: result,
                        style: {
                          "body": Style(
                            color: Colors.white,
                            fontSize: FontSize(18),
                            textAlign: TextAlign.right,
                          ),
                          "p": Style(margin: Margins.only(top: 8, bottom: 8)),
                          ".word": Style(
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                          ),
                          "center": Style(
                            color: Colors.red,
                            fontSize: FontSize.small,
                            textAlign: TextAlign.center,
                          ),
                        },
                      ),
                    ),
                  ),
                )
                    : SizedBox.shrink()
                    : CircularProgressIndicator(color: Colors.white),


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
