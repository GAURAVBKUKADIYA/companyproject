import 'package:companyproject/model/Contacts.dart';
import 'package:companyproject/resources/UrlResources.dart';
import 'package:companyproject/utility/ApiHandler.dart';
import 'package:companyproject/utility/ErrorHandler.dart';
import 'package:companyproject/utility/NoConaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier{

  List<Contacts> alldata;

  var isinserted = false;

  contactlist(context)async{

    try
    {
    await ApiHandler.post(UrlResources.CONTACT_API).then((json){
      alldata =json["contacts"].map<Contacts>((obj)=>Contacts.fromJson(obj)).toList();
      notifyListeners();
    });
    }
    on ErrorHandler catch(ex)
    {
      if(ex.code.toString()=="500")
        {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>NoConaction())
          );
        }
    }

  }


}