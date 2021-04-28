import 'package:conversor_moeda/app/componentes/currency_row.dart';
import 'package:conversor_moeda/app/controllers/home_controller.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  HomeController homeController;

  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();
  
  
  @override
  void initState() {
    
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 100,left: 20,right: 20,bottom: 20),
          child: SingleChildScrollView(
                      child: Column(

              children: [
                
                Image.asset('assets/imagens/logo.png',width: 150,height:150),
                SizedBox(height: 20,),
                CurrencyRow(
                  selectedItem: homeController.getToCurrency(),
                  controller: toText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model;
                    });
                  },),

                SizedBox(height: 10),

                CurrencyRow(
                  selectedItem: homeController.fromCurrency,
                  controller: fromText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model;
                    });
                  },),

                SizedBox(height: 25,),

                SizedBox(
                  height: 57,
                  width: 150,
                  child: ElevatedButton( onPressed: () {
                    homeController.convert();
                  }, child: Text('CONVERTER',),
                  style:  ButtonStyle(
                    
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 15,),),

                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)
                        
                      ),
                    ),
                  ),

                  
                  
                  ),
                ),


              ],

            ),
          ),
        ),
      ),
      
    );
  }
}