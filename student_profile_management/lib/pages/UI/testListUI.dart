import 'package:flutter/material.dart';
import 'package:student_profile_management/pages/UI/testAdmin_page.dart';
import 'package:student_profile_management/pages/UI/testProfileUI.dart';
import 'package:student_profile_management/pages/widgets/header_page.dart';

class TestStudentUI extends  StatefulWidget{
  static const String testStudentUIRoute = '/testStudentUI';

  const TestStudentUI({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TestStudentUIState();
  }
}

class _TestStudentUIState extends State<TestStudentUI>{

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  List names = ["Gota", "Basila", "Chamala", "Maina"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 210, 10, 0),
              itemCount: names.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>Container (
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 55.0,
                              height: 55.0,
                              color: Colors.white,
                              child: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2019/11/17/Pictures/gotabaya-rajapaksa_45b00c0c-0920-11ea-9981-1b3e40a63bbf.jpg"
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(names[index], style: const TextStyle(color: Colors.black, fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        Row(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                                child: FlatButton(
                                  onPressed: (){
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => const TestProfileUIPage()
                                        ),
                                            (Route<dynamic> route) => false
                                    );
                                  },
                                  color: Colors.red[200],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: const Text("View", style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                                child: FlatButton(
                                  onPressed: (){},
                                  color: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: const Text("Delete", style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ]
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              child: const HeaderWidget(
                  150, true, Icons.face),
            ),
            IconButton(
              padding: const EdgeInsets.fromLTRB(20, 50, 10, 0),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const TestAdminPage()
                    ),
                        (Route<dynamic> route) => false
                );
              },
              icon: const Icon(Icons.arrow_back_ios_rounded),
              color: Colors.white,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: const Text(
                'Students',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}