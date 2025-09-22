import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.pink[100] ,
        title: Text("Rosalia".tr(),
        style: TextStyle(color: Color(0xffCF525E),
        fontSize: 28),
        ),
        actions: [
    IconButton(
      icon: const Icon(Icons.language),
      onPressed: () {
        if (context.locale.languageCode == 'en') {
          context.setLocale(const Locale('ar', 'EG'));
        } else {
          context.setLocale(const Locale('en', 'US'));
        }
      },
    ),
  ],
      ),
   body: Container(
    color: Colors.pink[100],
    child: SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight:MediaQuery.of(context).size.height,
        ),
        child: Column(
          children: [
            Container(
              height: 500,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width,
                    ),
                    child: Image.asset("assets/images/welcomePic.jpeg",                                     
                    fit: BoxFit.cover,),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width,
                    ),
                    child: Image.network("https://images.unsplash.com/photo-1582794543139-8ac9cb0f7b11?q=80&w=627&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                     // width: 400,
                     fit: BoxFit.cover,),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                      color: Colors.white.withOpacity(0.8),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Welcom to Rosalia'.tr(),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[900],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "welcome_sentence".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(fontSize: 15),
                                    backgroundColor: Colors.pink[200],
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  )
                                  ,onPressed:(){
                                  Navigator.pushReplacementNamed(context, '/sign_up');
                                } , child: Text("Sign up".tr())),
                                SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, '/sign_in');
                                },
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(fontSize: 15),
                                  backgroundColor: Colors.pink[200],
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text('sign In'.tr()),
                              ),
                              ],
                            )
                          ]
                        ),
                      )
              ),
            )  ,                   
          ],
        ),
      ),
    ),
   ),
    );
  }
}