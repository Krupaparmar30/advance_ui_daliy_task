import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController selectTimeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text("Material & Cupertino ",style: TextStyle(color: Colors.white),),
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height:30,            ),
              SizedBox(
                height: 150,
                width: 350,
                child: TextField(
                    controller: selectTimeController,
                    decoration: InputDecoration(
                        labelText: "Date",
                        labelStyle: TextStyle(
                          color: Colors.blue.shade900
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue.shade900),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue.shade900),
                        ),
                        helperText: "MM/DD/YYYY",
                        helperStyle: TextStyle(
                            color: Colors.blue.shade900,
                          fontSize: 12
                        ),
                        hintText: (selDate == null)
                            ? '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
                            : '${selDate!.day}/${selDate!.month}/${selDate!.year}/',
                        suffixIcon: InkWell(
                          onDoubleTap: () {
                            Future<TimeOfDay?> selectTime = showTimePicker(
                                builder: (context, child) {
                                  return Theme(
                                      data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                        primary: Colors.blue.shade900,
                                        onSurface: Colors.black,
                                        primaryContainer: Colors.blue.shade800,
                                            surface: Colors.blue.shade50
                                      )),
                                      child: child!);
                                },
                                initialTime: TimeOfDay.now(),
                                context: context);
                          },
                          onTap: () async {
                            selDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1952),
                              lastDate: DateTime.now(),
                              builder: (context, child) => Theme(
                                  data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: Colors.blue.shade500,
                                        onSurface: Colors.black,
                                        primaryContainer: Colors.blue.shade400,
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                              foregroundColor:
                                                  Colors.blue.shade800))),
                                  child: child!),
                            );
                            setState(() {});
                          },
                          child: Icon(Icons.calendar_today_outlined,size: 22,color: Colors.blue.shade900,),
                        ))),
              ),
              CupertinoDialogAction(
                child: Text("Ringtones!!!",style:TextStyle(color: Colors.blue.shade900,fontSize: 22) ,),
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Phone ringtone",
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Divider(
                            color: Colors.blue.shade900,
                            height: 4,
                          ),
                          Container(
                            height: 200,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RadioMenuButton(
                                  value: true,
                                  groupValue: false,
                                  onChanged: (value) {},
                                  child: Text("None"),
                                ),
                                RadioMenuButton(
                                  value: true,
                                  groupValue: true,
                                  onChanged: (value) {},
                                  child: Text("Callisto"),
                                ),
                                RadioMenuButton(
                                  value: true,
                                  groupValue: false,
                                  onChanged: (value) {},
                                  child: Text("Ganymede"),
                                ),
                                RadioMenuButton(
                                  value: true,
                                  groupValue: false,
                                  onChanged: (value) {},
                                  child: Text("Luna"),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.blue.shade900,
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.blueAccent),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "OK",
                                    style: TextStyle(color: Colors.blue),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                isDestructiveAction: true,
              ),
              SizedBox(
                height: 250,
                child: CupertinoDatePicker(
                  onDateTimeChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 30),
              child: FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CupertinoTimerPicker(
                            onTimerDurationChanged: (value) {},
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Icon(Icons.lock_clock,color: Colors.blue.shade900,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) => CupertinoActionSheet(
                      title:  Text('Favorite Dessert',style: TextStyle(
                        color: Colors.blue.shade900
                      ),),
                      message:  Text(
                          '\n\n Pleas Select the best Dessert From the \n Option below.',style: TextStyle(
                          color: Colors.blue.shade900
                      )),
                      actions: <CupertinoActionSheetAction>[
                        CupertinoActionSheetAction(
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child:  Text('Profiteroles',style: TextStyle(
                          color: Colors.blue.shade900
                          )),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child:  Text('Cannolis',style: TextStyle(
                          color: Colors.blue.shade900
                          )),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child:  Text('Trifle',style: TextStyle(
                  color: Colors.blue.shade900
                  )),
                        ),
                        CupertinoActionSheetAction(
                          isDestructiveAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child:  Text('Cancel',style: TextStyle(
                  color: Colors.blue.shade900
                  )),
                        ),
                      ],
                    ),
                  );
                },
                child: Icon(Icons.lock_clock,color: Colors.blue.shade900,),
              ),
            ),
          ],
        ));
  }
}

DateTime? selDate;
