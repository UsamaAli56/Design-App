import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'recepits_upload_success.dart';

class ServiceDetails extends StatefulWidget {
  const ServiceDetails({Key key}) : super(key: key);

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  File image;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    final imageTemporary = File(image.path);
    this.image = imageTemporary;
  }
  bool isVoucherGenerated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Service Details And Voucher',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: DataTable(
                columns: const [
                  DataColumn(
                    label: Text('Name',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Charges',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Security',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(
                        Text(
                          'Design Approval',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      DataCell(
                        Text(
                          'Rs.70,000',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      DataCell(
                        Text(
                          'Rs.30,000',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: FlatButton(
                onPressed: () {
                setState(() {
                  isVoucherGenerated = true;
                });
                },
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Generate Voucher',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.document_scanner,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
                color: isVoucherGenerated == true ? Colors.grey : Colors.green,
                shape: const StadiumBorder(),
              ),
            ),
            isVoucherGenerated == true ? _uploadRecipet() : Container(),
          ],
        ),
      ),
    );
  }
  Widget _uploadRecipet(){
    return Column(
      children: [
        SizedBox(height: 20,),
        Text('Voucher Has been Downloaded.',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.green),),
        Text('Please Pay The Amount In Bank,XYZ.',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.red),),
        Text('Upload Pictures Of Paid Voucher Receipts.',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.blue)),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20,),
          child: FlatButton(
            onPressed: () {
              pickImage();
              Navigator.push(context, MaterialPageRoute(builder: (context)=> RecepitsUploadSuccessfull()));
            },
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Upload Voucher Receipts',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.upload_file,
                  color: Colors.white,
                  size: 30,
                )
              ],
            ),
            color: Colors.green,
            shape: const StadiumBorder(),
          ),
        ),
      ],
    );
  }
}
