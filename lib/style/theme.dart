import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primary_color = const Color(0xff20272F);
const Color secondary_color = const Color(0xFF37444F);
const Color third_color = const Color(0xff8593A3);
const Color blue_color = const Color(0xff6DB5FE);
const Color white_color = Colors.white;
EdgeInsets item_list_padding = EdgeInsets.fromLTRB(40, 0, 0, 0);
TextStyle blue_text =
    GoogleFonts.varelaRound(textStyle: TextStyle(color: blue_color));
TextStyle white_text =
    GoogleFonts.varelaRound(textStyle: TextStyle(color: white_color));
TextStyle secondary_color_text = GoogleFonts.varelaRound(
    textStyle: TextStyle(
  color: third_color,
));

const blue_border = UnderlineInputBorder(
    borderSide:
        BorderSide(color: blue_color, width: 1.0, style: BorderStyle.solid));
const white_border = UnderlineInputBorder(
    borderSide:
        BorderSide(color: white_color, width: 1.0, style: BorderStyle.solid));

const Color inventory_card_color = const Color(0xFF37444F);
TextStyle inventory_card_text = GoogleFonts.redHatDisplay(
    fontWeight: FontWeight.bold, textStyle: TextStyle(color: white_color));
const Color floating_button_color = const Color(0xff6DB5FE);
Image logo = Image.asset('assets/images/eye4_logo.png');
