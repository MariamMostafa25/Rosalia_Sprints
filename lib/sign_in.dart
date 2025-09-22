 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rosalia_sprints/sign_up.dart';
import 'package:rosalia_sprints/home.dart';

class sign_in extends StatefulWidget {
  const sign_in({super.key});

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
 final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      floatingActionButton: FloatingActionButton(
    backgroundColor: Colors.pinkAccent,
    child: const Icon(Icons.language),
    onPressed: () {
      if (context.locale.languageCode == 'en') {
        context.setLocale(const Locale('ar', 'EG'));
      } else {
        context.setLocale(const Locale('en', 'US'));
      }
    },
  ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/signPic.jpeg",
          fit: BoxFit.cover,),
          Container(color: Colors.black.withOpacity(0.3),),
          Positioned(
      top: 40,
      left: 10,
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/welcome");
        },
      ),
    ),
          Center(
            child: SingleChildScrollView(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                  ),
                  color: Color(0xffFEF2F2).withOpacity(0.7),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  elevation: 8,
                  child: Padding(padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Sign In Rosalia".tr(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffCF525E)
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _emailController,
                             style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.white,fontSize: 14),
                                filled: true,
                                fillColor: Color(0xffE6879A).withOpacity(0.3),                             
                                labelText: "Email",
                               enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:  BorderSide(
      color:Color(0xffCF525E).withOpacity(0.2), // لون الحافة العادي
      width: 1.0,
    ),
                                ),
                                focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
       color: Color(0xffCF525E).withOpacity(0.2), // لون الحدود عند التركيز على الحقل
        width: 2.0,
        
      ),
      ),             
                              ),
                            validator: (value) {
                              if(value==null ||value.isEmpty){
                                return "Email is required";
                              }
                              if(!value.contains("@")){
                                return "Invalid email format";
                              }
                            },
                            ),
                          ),     
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller:_passwordController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.white,fontSize: 14),
                                filled: true,
                                fillColor: Color(0xffE6879A).withOpacity(0.3),
                                labelText: "Password",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:  BorderSide(
      color:Color(0xffCF525E).withOpacity(0.2), // لون الحافة العادي
      width: 1.0,
    ),
                                ),           
                                       
      focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
       color: Color(0xffCF525E).withOpacity(0.2), // لون الحدود عند التركيز على الحقل
        width: 2.0,
        
      ),
      ),             
                              ),
                            validator: (value) {
                              if(value==null ||value.isEmpty){
                                return "Password is required";
                              }
                              if(value.length<6){
                                return "Password should contain at least 6 characters";
                              }
                            },
                            ),                            
                          ),   
                          const SizedBox(height: 20,),
                          SizedBox(
                            width: 320, 
                            height: 56,  
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffC6323F).withOpacity(0.6),
                                 foregroundColor: Colors.white,
                              ),
                              onPressed: (){
                              if(_formKey.currentState!.validate()){
                                showDialog(context: context,
                                 builder: (_)=>AlertDialog(
                                title: Text("Success".tr()),
                                content:  Text("Welcome Back To Rosalia".tr()),
                                actions: [
                                  TextButton(onPressed: () {
  // تحقق من البيانات + نجاح التسجيل
  if (_formKey.currentState!.validate()) {
    // هنا بقى الانتقال مع Animation
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (_, __, ___) => const home(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
},

                                   child: Text("Ok".tr()))
                                ],
                                 ));
                              }
                            }, child: Text("sign In".tr(),
                            style: TextStyle(fontSize: 20),)),
                          ),   
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text("Do not have an account?".tr(),
                              style: TextStyle(color: Color(0xffCF525E),fontSize: 18),),
                              TextButton(onPressed: (){
                                Navigator.pushReplacementNamed(context,'/sign_up');
                              }, child:  Text("Sign up".tr(),
                              style: TextStyle(color: Color(0xffC3455E),fontWeight: FontWeight.bold),))
                            ],
                          )                        
                      ]
                    )
                  )
                  )
              )
            )
          )
        ]
      )
                       );
  }
}