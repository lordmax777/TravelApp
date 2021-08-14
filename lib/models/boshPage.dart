import 'package:asosiysi/models/homePage.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

List<String> ola = [
  "assets/images/000.jpg",
  "assets/images/111.png",
  "assets/images/222.jpg",
  "assets/images/333.jpg",
  "assets/images/444.jpg",
  "assets/images/555.jpg",
];
class BoshPage extends StatefulWidget {
  int index;
  BoshPage(this.index);
  @override
  _BoshPageState createState() => _BoshPageState();
}

class _BoshPageState extends State<BoshPage> {
  bool? hammasi = false;
  bool hammasi2 = false;
  bool? hammasi22 = false;
  bool hammasi222 = false;
  String jins = "";
  String? kiritilganText = "";

  int activeStep = 0;
  int dotCount = 5;
  @override
  Widget build(BuildContext context) {
    final String? image = HomePage.hammaMalumotlar[widget.index].rasimlar.toString();
    final String? title = HomePage.hammaMalumotlar[widget.index].titellar.toString();
    final String? davlatlar = HomePage.hammaMalumotlar[widget.index].davlatlar.toString();
    final String? malumotlar = HomePage.hammaMalumotlar[widget.index].malumotlar.toString();
    final String? hotellar = HomePage.hammaMalumotlar[widget.index].hotellar.toString();
    return Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverAppBar(
              expandedHeight: 300.0,
              floating: true,
              snap: true,
              pinned: true,
              stretch: true,
              title: Text("${title}"),
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ola[activeStep]),fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    )
                  ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            child: Align(
                              alignment: Alignment.center,
                              child: IconButton(
                                  onPressed: (){
                                    if (activeStep > 0) {
                                      setState(() {
                                        activeStep--;
                                      });
                                    }
                                  },
                                  icon: Icon(Icons.arrow_back_ios),),
                            ),
                          ),
                          CircleAvatar(
                            child: IconButton(
                              onPressed: (){
                                if (activeStep < dotCount - 1) {
                                  setState(() {
                                    activeStep++;
                                  });
                                }
                              },
                              icon: Icon(Icons.arrow_forward_ios_rounded),),
                          ),
                        ],
                      ),
                    )),
                titlePadding: EdgeInsets.only(right: 160.0, bottom: 13.0,left: 45.0),
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                ],
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        height: 30.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Text("${davlatlar}",style: TextStyle(fontSize: 14.0),)),
                    DotStepper(
                      tappingEnabled: true,
                      dotCount: dotCount,
                      dotRadius: 10,
                      activeStep: activeStep,
                      shape: Shape.pipe,
                      spacing: 15,
                      indicator: Indicator.worm,
                      onDotTapped: (tappedDotIndex) {
                        setState(() {
                          activeStep = tappedDotIndex;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                  [
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              maxLength: 150,
                              onSubmitted: (e){
                                setState(() {
                                  kiritilganText = e;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: "Malumot Kiriting ...",
                                  labelText: "Malumot",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0)),
                                  prefixIcon: Icon(Icons.edit, color: Colors.red),
                                  filled: true,
                                  fillColor: Colors.grey[300]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                            child: Container(
                              height: 150.0,
                              width: 400.0,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: ListView(
                                      padding: EdgeInsets.all(0),
                                      children: [
                                        Text("$kiritilganText",style: TextStyle(fontSize: 18.0),),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 150.0,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CheckboxListTile(
                              value: hammasi,
                              onChanged: (b){
                                setState(() {
                                  hammasi = b;
                                  hammasi2 = b!;
                                });
                              },
                              activeColor: Colors.red,
                              checkColor: Colors.yellow,
                              title: Text("Oilaviy"),
                              selected: hammasi2,
                              selectedTileColor: Colors.black12,
                              secondary: Icon(Icons.family_restroom),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CheckboxListTile(
                              value: hammasi22,
                              onChanged: (b){
                                setState(() {
                                  hammasi22 = b;
                                  hammasi222 = b!;
                                });
                              },
                              activeColor: Colors.red,
                              checkColor: Colors.yellow,
                              title: Text("Bitta Ozingiz"),
                              selected: hammasi222,
                              selectedTileColor: Colors.black12,
                              secondary: Icon(Icons.person),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 180.0,
                      width: 400.0,
                      child: Column(
                        children: [
                          Text("Jinsingizni belgilang", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                          RadioListTile<String>(
                            secondary: CircleAvatar(
                              backgroundImage: AssetImage("assets/images/11.jpg"),
                            ),
                            value: "Erkak",
                            groupValue: jins,
                            onChanged: (e){
                              setState(() {
                                jins = e!;
                              });
                            },
                            title: Text("Erkak"),
                            subtitle: Align(
                              child: Icon(Icons.female),
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                          RadioListTile<String>(
                            secondary: CircleAvatar(
                              backgroundImage: AssetImage("assets/images/22.jpg"),
                            ),
                            value: "Ayol",
                            groupValue: jins,
                            onChanged: (e){
                              setState(() {
                                jins = e!;
                              });
                            },
                            title: Text("Ayol"),
                            subtitle: Align(
                              child: Icon(Icons.female),
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 300.0,
                        width: 400.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text("${malumotlar}")),
                        ),
                      ),
                    )
                  ]
              ),
            ),
          ],
        )
    );
  }
}