import 'package:flutter/material.dart';

class DisasterCard extends StatelessWidget {
  final String disasterImagePath;
  final String disaster;

  DisasterCard({
    required this.disasterImagePath,
    required this.disaster,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(255, 255, 255, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 75,
                      child: Image.asset(disasterImagePath),
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          disaster,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0), 
                child: Icon(Icons.arrow_circle_right_rounded, size: 50,),
              ),
          ],),
        ),
      ),
      )
    );
  }
}