import 'package:kalkulatorbmi/model/bmi_model.dart';
import 'package:kalkulatorbmi/ui/hasil_perhitungan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  double _tinggi = 100.0;
  double _berat = 40.0;

  double _bmi = 0;

  bmi_model _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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

          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(

                height: 200,
                width: 200,
                child: SvgPicture.asset("assets/images/heart.svg", fit: BoxFit.contain,),

              ),
              SizedBox(
                height: 8,
              ),
              Text("Kalkulator BMI",
                style: TextStyle
                  (color: Colors.red[700],
                    fontSize: 34,
                    fontWeight: FontWeight.w700),
              ),
              Text("",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),

              SizedBox(
                height: 32,
              ),

              Text("Tinggi (cm)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),

              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 80.0,
                  max: 250.0,
                  onChanged: (height){
                    setState(() {
                      _tinggi = height;
                    });
                  },
                  value: _tinggi,
                  divisions: 100,
                  activeColor: Colors.white,
                  label: "$_tinggi",
                ),
              ),


              Text("$_tinggi cm",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 24,),

              Text("Berat (kg)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),

              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 30.0,
                  max: 120.0,
                  onChanged: (height){
                    setState(() {
                      _berat = height;
                    });
                  },
                  value: _berat,
                  divisions: 100,
                  activeColor: Colors.white,
                  label: "$_berat",
                ),
              ),

              Text(
                "$_berat kg",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18, fontWeight:
                FontWeight.w900),
              ),

              SizedBox(height: 16,),

              Container(
                child: FlatButton.icon(
                  onPressed: (){
                    setState(() {
                      _bmi = _berat/((_tinggi/100)*(_tinggi/100));

                      if(_bmi >= 18.5 && _bmi <= 25){
                        _bmiModel = bmi_model(bmi: _bmi, normal: true, kesimpulan: "Tubuh kamu ideal");
                      }else if(_bmi < 18.5){
                        _bmiModel = bmi_model(bmi: _bmi, normal: false, kesimpulan: "Berat badan anda kurang");
                      }else if(_bmi > 25 && _bmi <= 30){
                        _bmiModel = bmi_model(bmi: _bmi, normal: false, kesimpulan: "anda kelebihan berat badan");
                      }else{
                        _bmiModel = bmi_model(bmi: _bmi, normal: false, kesimpulan: "Anda obesitas");
                      }
                    });

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Hasil(bmiModel: _bmiModel,)
                    ));
                  },
                  icon: Icon(Icons.favorite, color: Colors.white,),
                  label: Text("Perhitungan",
                  style: TextStyle(
                    fontSize: 20
                  )
                  ),
                  textColor: Colors.white,
                  color: Colors.pink,

                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              )

            ],
          ),
        ),
      ),
    );
  }
}