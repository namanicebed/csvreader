import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';

class StoreInfo extends StatefulWidget {
  final String country;
  final String licenseNumber;
  final String operationType;
  final String establishmentType;
  final String entityName;
  final String dbaName;
  final String streetNumber;
  final String streetName;
  final String addressLine2;
  final String addressLine3;
  final String city;
  final String state;
  final String zipCode;
  final String squareFootage;

  StoreInfo(
      this.country,
      this.licenseNumber,
      this.operationType,
      this.establishmentType,
      this.entityName,
      this.dbaName,
      this.streetNumber,
      this.streetName,
      this.addressLine2,
      this.addressLine3,
      this.city,
      this.state,
      this.zipCode,
      this.squareFootage);

  @override
  _StoreInfoState createState() => _StoreInfoState();
}

class _StoreInfoState extends State<StoreInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff262626),
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Color(0xff5E72EE),
      ),
      body: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
          margin: EdgeInsets.all(7),
          elevation: 5,
          color: Color(0xff444444),
          child: Container(
            alignment: Alignment.center,
            height: 250,
            child: Column(
              children: <Widget>[
                new Text(widget.country),
                new Text(widget.licenseNumber),
                new Text(widget.establishmentType),
                new Text(widget.entityName),
                new Text(widget.dbaName),
                new Text(widget.streetName),
                new Text(widget.streetNumber),
                new Text(widget.addressLine2),
                new Text(widget.addressLine3),
                new Text(widget.city),
                new Text(widget.state),
                new Text(widget.zipCode),
                new Text(widget.squareFootage),
              ],
            ),
          )),
    );
  }
}
