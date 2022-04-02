// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Login extends StatelessWidget {
  
//   GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   bool _autoValidate = false;
//   bool passshow = false;
//   String _pass;
//   String _email;
//   String user1;
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   Login({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Form(
//               key: _formkey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     onSaved: (value) {
//                       _email = value.toString();
//                     },
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: const InputDecoration(
//                       labelText: 'EMAIL',
//                       contentPadding: EdgeInsets.all(5),
//                       labelStyle: TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                           color: Colors.grey),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.green,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20.0),
//                   TextFormField(
//                     obscuringCharacter: '*',
//                     onSaved: (val) {
//                       _pass = val.toString();
//                     },
//                     decoration: InputDecoration(
//                         suffix: passshow == false
//                             ? IconButton(
//                                 onPressed: () {
//                                   passshow = true;
//                                 },
//                                 icon: Icon(Icons.lock_open),
//                               )
//                             : IconButton(
//                                 onPressed: () {
//                                   passshow = true;
//                                 },
//                                 icon: Icon(Icons.lock),
//                               ),
//                         labelText: 'PASSWORD',
//                         contentPadding: EdgeInsets.all(5),
//                         labelStyle: const TextStyle(
//                             fontFamily: 'Montserrat',
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             color: Colors.grey),
//                         focusedBorder: const UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.green))),
//                     obscureText: passshow == false ? true : false,
//                   ),
//                 ],
//               )),
//         ],
//       ),
//     );
//   }
// }
