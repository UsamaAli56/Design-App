import 'package:design/components/background.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class TrackService extends StatefulWidget {
  const TrackService({Key key}) : super(key: key);

  @override
  State<TrackService> createState() => _TrackServiceState();
}

class _TrackServiceState extends State<TrackService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 10, right: 15),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Wednesday, 15th,',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'June, 2022.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Order ID: XYZ.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[200],
                thickness: 1,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Service Tracking:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 5.5,
                      child: IconStepper(
                        direction: Axis.vertical,
                        enableNextPreviousButtons: false,
                        enableStepTapping: false,
                        stepColor: Colors.green,
                        activeStepBorderColor: Colors.white,
                        activeStepBorderWidth: 0.0,
                        activeStepBorderPadding: 0.0,
                        lineColor: Colors.black,
                        lineLength: 50,
                        lineDotRadius: 2,
                        stepRadius: 15,
                        alignment: Alignment.centerLeft,
                        icons: const [
                          Icon(
                            Icons.radio_button_checked,
                            color: Colors.green,
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: const ListTile(
                                title: Text(
                                  'Verify Property',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Text(
                                  'Verified',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: const ListTile(
                                title: Text(
                                  'Verify Payments',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Text(
                                  'Verified',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: const ListTile(
                                title: Text(
                                  'Scheduled Meeting',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Text(
                                  'Processed',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: const ListTile(
                                title: Text(
                                  'NOC Document',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Text(
                                  'Recived',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
