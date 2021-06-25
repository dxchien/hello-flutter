import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Demo2Screen extends StatefulWidget {
  final String title;

  const Demo2Screen({Key? key, required this.title}) : super(key: key);

  @override
  _Demo2ScreenState createState() => _Demo2ScreenState();
}

class _Demo2ScreenState extends State<Demo2Screen> {

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 1,
        leading: Icon(
          Icons.account_balance,
          size: 18,
          color: Colors.amber,
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('1');
            },
            icon: Icon(Icons.account_balance),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          hideKeyboard();
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          margin: EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20),
          ),
          width: double.infinity,
          height: 300,
          // child: Text(
          //   widget.title,
          //   style: TextStyle(
          //     fontSize: 24,
          //     color: Colors.red,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // child: Image.asset('assets/img_rocket.png', fit: BoxFit.cover,),
          // child: Image.network("https://photo-baomoi.zadn.vn/w700_r16x9/2021_06_22_20_39269426/710547426000895ed011.jpg", fit: BoxFit.cover),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(emailController.text);
                },
                child: Text("LOGIN"),
              ),
              Container(
                height: 60,
                child: TextField(
                  controller: emailController,
                  autocorrect: false,
                  keyboardType: TextInputType.datetime,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      labelText: "Username",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                      )
                  ),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                  onChanged: (value) {
                    // print('_Demo2ScreenState.build $value');
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('_Demo2ScreenState.build');
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  width: 100,
                  height: 100,
                  // color: Colors.blue,
                  child: Center(
                    child: Text("Button"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  void hideKeyboardAndUnFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  Widget blueBox() {
    return Container(
      color: Colors.blue,
      child: SizedBox(
        width: 50,
        height: 50,
      ),
    );
  }
}
