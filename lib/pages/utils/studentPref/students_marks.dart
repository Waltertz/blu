import 'package:flutter/material.dart';
import 'package:amis/main.dart';

class StudentMarks extends StatelessWidget {

  final TextEditingController controller;

  const StudentMarks({ Key key,this.controller }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _marks1 = TextEditingController();
    final _marks2 = TextEditingController();
    final _marks3 = TextEditingController();

    final _tot= TextEditingController();

    final _avg= TextEditingController();
    final _grade= TextEditingController();


    int result;
    double average;

    int sum;


    var size = MediaQuery.of(context).size;


    return Scaffold(

      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding:EdgeInsets.symmetric(horizontal: 15,vertical: 20),

              child: Column(
                  children: [
                  Text("Student Marks Calcuation",style: TextStyle(fontSize: 30, color: Colors.red)),
              SizedBox(height: 15,),
              TextField(
                controller: _marks1,
                decoration: InputDecoration(
                    labelText: "Marks 1",
                    labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade400),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                  controller: _marks2,

                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade400),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),
              ),
            SizedBox(height: 15,),
            TextField(
              controller: _marks3,

              decoration: InputDecoration(
                  labelText: "Marks 3",
                  labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade400),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),

            ),
            SizedBox(height: 15,),
            TextField(
              controller: _tot,
              decoration: InputDecoration(
                  labelText: "Total",
                  labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade400),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: _avg,
              decoration: InputDecoration(
                  labelText: "Avg",
                  labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade400),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),

            ),
            SizedBox(height: 15,),
            TextField(
              controller: _grade,
              decoration: InputDecoration(
                  labelText: "Grade",
                  labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade400),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),
            ),
            GestureDetector
              (
              onTap: ()
              {
                sum = int.parse(_marks1.text) + int.parse( _marks2.text)+ int.parse( _marks3.text);
                result = sum;
                _tot.text = result.toString();


                average = result/3;


                _avg.text = average.toString();

                if(average > 50)
                {

                  _grade.text = "Pass";
                }
                else
                {
                  _grade.text = "Fail";
                }

              },
              child: Container(
                alignment: Alignment.center,




                height: size.height / 14,
                width: size.width,
                decoration: BoxDecoration(color: Colors.red,
                    borderRadius: BorderRadius.circular(5)),
                child: Text("Add",
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold),),


              ),
            )


         ] ,
          )
      ),
          )
      ),

    );

  }
}

