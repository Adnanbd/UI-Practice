import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_practice_21_oct_2022/Widgets/flip_card_payment.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController msgController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController.text = "\$10,000";
    msgController.text = "I BELEVE IN YOU!";
  }

  @override
  Widget build(BuildContext context) {
    var heightMain = MediaQuery.of(context).size.height;
    var widthMain = MediaQuery.of(context).size.width;
    var heightTop = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: heightMain,
        width: widthMain,
        child: Column(
          children: [
            SizedBox(
              height: heightTop,
            ),
            Container(
              width: widthMain,
              padding: EdgeInsets.all(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 18,
                      color: Colors.black.withOpacity(.6),
                    ),
                  ),
                  Text(
                    "Payment",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Icon(
                    Icons.more_horiz,
                    size: 24,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 95,
                  width: 95,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(.1)),
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/profile-pic-demo.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Adnan  ",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "Switch",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.purple,
                      //height: 0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlipCardPayment(),
            SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  width: widthMain * .8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Amount",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black.withOpacity(.5),
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Balance",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black.withOpacity(.5),
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      Text(
                        "\$94,999.55",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: widthMain * .8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/msg-icon.svg",
                        height: 18,
                        width: 18,
                        fit: BoxFit.scaleDown,
                        color: Colors.black.withOpacity(.6),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Message",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black.withOpacity(.5),
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: msgController,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            MaterialButton(
              height: 60,
              minWidth: widthMain*.8,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    //builder: (BuildContext context) => CreateProfileScreen(),
                    builder: (BuildContext context) => PaymentScreen(),
                  ),
                );
              },
              elevation: 0,
              color: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Back this project",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
