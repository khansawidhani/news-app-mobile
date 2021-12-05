import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

headingTextStyle(){
  return GoogleFonts.breeSerif(
    color: Colors.black,
    fontSize: 19, 
  );
}
authorTextStyle(){
  return GoogleFonts.robotoSlab(
    fontWeight: FontWeight.w600,
    fontSize: 15.0,
    color: Colors.red[700],

  );
}
descriptionTextStyle(){
  return GoogleFonts.karla(
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    color: Colors.blueGrey,
    );
}
publishedAtTextStyle(){
  return GoogleFonts.poppins(
    fontStyle: FontStyle.italic,
    color: Colors.blueGrey
  );
}
contentTextStyle(){
  return const TextStyle();
}