import 'package:companyproject/providers/ContactProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/Contacts.dart';

class ContactListScreen extends StatefulWidget {
  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  ContactProvider provider;

  getcontacts() async {
    await provider.contactlist(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ContactProvider>(context, listen: false);
    getcontacts();
  }

  singleItem(index) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 150,
                      width: 120,
                      child: new Image.network(
                        provider.alldata[index].userimage.toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "ID : " + provider.alldata[index].id.toString().toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        (provider.alldata[index].name != "")?Text("Name : " + provider.alldata[index].name.toString(),style: GoogleFonts.lato(),): SizedBox(height: 0),
                        SizedBox(
                          height: 10.0,
                        ),
                        (provider.alldata[index].email != "")
                            ? Text("Email : " +
                                provider.alldata[index].email.toString(),style:GoogleFonts.aBeeZee(),)
                            : SizedBox(height: 0),
                        SizedBox(
                          height: 10.0,
                        ),
                        (provider.alldata[index].address != "")
                            ? Text("Address : " +
                                provider.alldata[index].address.toString())
                            : SizedBox(height: 0),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [

                            Text("F",
                                style: TextStyle(fontWeight: (provider.alldata[index].gender == "female") ? FontWeight.bold : FontWeight.normal)),
                            Text("/"),
                            Text("M", style: TextStyle(fontWeight: (provider.alldata[index].gender == "male") ? FontWeight.bold : FontWeight.normal)),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Contact No:"),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    (provider.alldata[index].phone.mobile != "")
                                        ? Text(
                                            "Mobile : " + provider.alldata[index].phone.mobile.toString(),
                                            style: TextStyle(fontSize: 12.0),):SizedBox(height: 0),
                                    (provider.alldata[index].phone.home != "") ? Text("Home : " + provider.alldata[index].phone.home.toString(), style: TextStyle(fontSize: 12.0),): SizedBox(height: 0),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  provider.alldata.removeAt(index);
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 30.0,
                color: Colors.red,
                alignment: Alignment.center,
                child: Text("REMOVE", style: TextStyle(color: Colors.white,fontSize: 15,letterSpacing:1)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ContactProvider>(context, listen: true);
    return Scaffold(
        body: (provider.alldata != null)
            ? ListView.builder(
                itemCount: provider.alldata.length,
                itemBuilder: (context, index) {
                  return singleItem(index);
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
