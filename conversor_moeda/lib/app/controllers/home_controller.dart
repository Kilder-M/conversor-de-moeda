import 'package:conversor_moeda/app/model/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<CurrencyModel> currencies;

  final TextEditingController toText; 
  final TextEditingController fromText; 

  CurrencyModel toCurrency;
  CurrencyModel fromCurrency;

  HomeController({this.toText, this.fromText}){
    currencies = CurrencyModel.getCurrencies();

    setToCurrency(currencies[0]);
    fromCurrency = currencies[1];
     
    
  }
  
  CurrencyModel getToCurrency(){
    return this.toCurrency;
  }

  void setToCurrency(CurrencyModel cm){
    this.toCurrency = cm;
  }

  

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text) ?? 1.0;
    double returnValue = 0;

    if(fromCurrency.name == 'Real'){
      returnValue = value * toCurrency.real;
    } else if(fromCurrency.name == 'Dolar'){
      returnValue = value * toCurrency.dolar;
    } else if(fromCurrency.name == 'Euro'){
      returnValue = value * toCurrency.euro;
    } else if(fromCurrency.name == 'bitcoin'){
      returnValue = value * toCurrency.bitcoin;
    }

    fromText.text = returnValue.toStringAsFixed(2);


  }

}