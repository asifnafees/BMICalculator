import 'package:bmi_1/constants.dart';
import 'package:bmi_1/details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var htController =TextEditingController();
  var wtController =TextEditingController();
  var result="";
  var bgColor=Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: bgColor,
      appBar: AppBar(flexibleSpace: SafeArea(
        child: Container(
          height: 60,width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff5EB183),Color(0xff8FBF75)
            ])
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Icon(Icons.settings,color: Colors.white,),
            Text('BMI Calculator',style: TextStyle(
                color: Colors.white,fontWeight: FontWeight.w700),),
            Icon(Icons.history,color: Colors.white,)
          ],),
        ),
      ),),
      body: ListView(
        children: [
        Container( margin: EdgeInsets.only(left: 10,right: 10,top: 30),
          height: 250,width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xffFDFFF4),//box white color
              boxShadow: [
                BoxShadow(color: Colors.black,
                    blurRadius: 10)
              ],
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(children: [
            SizedBox(height: 50,),
            Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Height',style: headTextStyle,),
                Container( width: 150,height: 40,
                  child:  TextFormField( controller: htController,
                    decoration: InputDecoration(
                        hintText: 'Height',
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                        )
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container( height: 30,width: 30,
                  decoration: BoxDecoration(
                      color: Color(0xff268759),
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Center(child: Text('cm',
                    style: TextStyle(color: Colors.white),)),)
              ],),//textField
            SizedBox(height: 15,),
            Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Weight',style: headTextStyle,),
                Container( width: 150,height: 40,
                  child:  TextFormField( controller: wtController,
                    decoration: InputDecoration(
                        hintText: 'Weight',
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                        )
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container( height: 30,width: 30,
                  decoration: BoxDecoration(
                      color: Color(0xff268759),
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Center(child: Text('kg',
                    style: TextStyle(color: Colors.white),)),)
              ],),//textField
          ],),
        ),//header
        SizedBox(height: 20,),
        Details(),//details
        SizedBox(height: 20,),
        InkWell( onTap: () {
          var wt=wtController.text.toString();
          var ht=htController.text.toString();
          if(wt!=""&&ht!=""){
             var iht=int.parse(ht);
             var iwt=int.parse(wt);
             //conversion
            var changeMeter=iht/(3.281);
            // bmi logic
            var bmi=iwt/(changeMeter*changeMeter);
            var msg="";
            if(bmi>25){
              msg="You're overweight !";
              bgColor=Colors.orange.shade200;
            }else if(bmi<18){
              msg="You're underweight !";
              bgColor=Colors.red.shade200;
            }
            else{
              msg="You're healthy !";
              bgColor=Colors.green.shade200;
            }
            setState(() {
              result="$msg\nYour BMI is: ${bmi.toStringAsFixed(2)}";
            });
          }else{
            print('asif');
            setState(() {
              result="Please fill all the fields!";
            });
          }
        },
          child: Container(
            height: 40,width:60,
          decoration: BoxDecoration(
            color: Color(0xff0D631C),
            borderRadius: BorderRadius.circular(10)
          ),
            child: Center(
              child: Text('CALCULATE',style: TextStyle(
                  color: Colors.white),),
            ),
          ),
        ),//Button
    Container( height: 50,width: double.infinity,
      child: Center(child: Text(result.toString(),
        style: TextStyle(color: Colors.white,fontSize: 20),)),)//result show
      ],)
    );
  }
}
