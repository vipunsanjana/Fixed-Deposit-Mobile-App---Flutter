import 'package:flutter/material.dart';


void main()=>runApp(const MaterialApp(
  home: HomePage(),
  debugShowCheckedModeBanner: false,
));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

   double? interest;
   double? total;

  void calculation(){
  final cal1 = (double.parse(_controller2.text) / 100 / 12) * int.parse(_controller3.text);
  final cal2 = cal1 * int.parse(_controller1.text);
  setState(() {
    interest = cal2;
    total = int.parse(_controller1.text) + interest!;
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const Icon(Icons.notes,size: 30,color: Colors.white,),
      toolbarHeight: 30,
      backgroundColor: Colors.green,
        elevation: 0,
        actions: const [
         Padding(padding: EdgeInsets.only(right: 15.0),
           child: Icon(
             Icons.info,size: 30,color: Colors.white,),
         )
        ],
      ),
      body: SingleChildScrollView(
        child: body(),
      ),
    );
  }

  Widget body(){
    return Container(
      color: Colors.grey[100],
      child: Column(children: [
        Container(
          height: 150,
          decoration: const BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
          ),
          child:  const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                  "Fixed Deposit",
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontSize: 35,
                      color: Colors.white,
                    ),
                ),
                  Text(
                    "Calculator",
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30,10,40,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [inputForm(
              title: "Deposit Amount : ",
              controller: _controller1,
              hinttext: "e.g : 20000"
            ),
              inputForm(
                  title: "Annual Interest Rate(%) : ",
                  controller: _controller2,
                  hinttext: "e.g : 3"
              ),
              inputForm(
                  title: "Period(in month) : ",
                  controller: _controller3,
                  hinttext: "e.g : 3"
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (){
                  calculation();
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child:  const Center(
                    child: Text("CALCULATE",
                      style: TextStyle(
                        fontFamily: 'RobotoMono',
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
               interest != null? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Result : ",
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20,),
                Center(
                  child:  Text(
                    "Interest : RM ${interest?.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontFamily: 'RobotoMono',
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Center(
                  child:  Text("Total : RM ${total?.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontFamily: 'RobotoMono',
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
              ],
            ) : const SizedBox()],
          ),
        )
      ],),
    );
  }

  Widget inputForm({required String title, required TextEditingController controller, required String hinttext}){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
         Text(
          title,
          style: const TextStyle(
            fontFamily: 'RobotoMono',
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
         height: 60,
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(20),
         ),
          child: TextField(
            controller: controller,
            decoration:  InputDecoration(
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: hinttext,
            ),
          ),
        ),
        const SizedBox(height: 10,)
      ],
    );

  }
}
