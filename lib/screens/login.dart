import 'package:flutter/material.dart';



class Login extends StatelessWidget {
  //const Login({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Login'),
            ),
            body: Container(
                color:Theme.of(context).primaryColorDark,
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.center ,
                    children:<Widget>[
                      Card(
                          elevation : 8,
                          margin:EdgeInsets.only(left:16.0,right:16.0),
                          child:Padding(
                              padding:EdgeInsets.all(16.8),
                              child: Column(
                                  children:<Widget>[
                                    TextField(
                                        keyboardType: TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            labelText: 'Email'
                                        )
                                    ),
                                    TextField(
                                        keyboardType: TextInputType.visiblePassword,
                                        decoration: InputDecoration(
                                            labelText: 'Password'
                                        )
                                    ),
                                    ElevatedButton(
                                        onPressed: ()=>print('Login Clicked'),
                                        child: Text('Login'),
                                        style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 36))
                                    ),
                                    Padding(
                                      padding:EdgeInsets.only(top:20),
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.pushNamed(context, '/register');
                                        },
                                        child:Text('Register New User')
                                      )
                                    )
                                  ]
                              )
                          )
                      )
                    ]
                )
            )
        )
    );
  }
}
