import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Hasil extends StatelessWidget {
  final bmiModel;

  Hasil({this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(

            gradient: LinearGradient(

              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF73AEF5),
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                Color(0xFF398AE5),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
          width: double.infinity,

          height: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(

                height: 200,
                width: 200,
                child: bmiModel.normal ? SvgPicture.asset("assets/images/happy.svg", fit: BoxFit.contain,) : SvgPicture.asset("assets/images/sad.svg", fit: BoxFit.contain,) ,
              ),

              SizedBox(
                height: 8,
              ),
              Text("Nilai BMI Anda ${bmiModel.bmi.round()}", style: TextStyle(color: Colors.red[700], fontSize: 34, fontWeight: FontWeight.w700),),
              Text("${bmiModel.kesimpulan}", style: TextStyle(color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.w500),),

              SizedBox(height: 16,),

              bmiModel.normal ?
              Text("Hurray! Nilai BMI anda normal.", style: TextStyle(color: Colors.red[700], fontSize: 18, fontWeight: FontWeight.w700),)
                  :
              Text("Sadly! Nilai BMI anda tidak normal.", style: TextStyle(color: Colors.red[700], fontSize: 18, fontWeight: FontWeight.w700),),
              SizedBox(height: 16,),

              Container(
                child: FlatButton.icon(
                  onPressed: (){

                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                  label: Text("Hitung Lagi"),
                  textColor: Colors.white,
                  color: Colors.pink,

                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              )

            ],
          ),
        )
    );
  }
}