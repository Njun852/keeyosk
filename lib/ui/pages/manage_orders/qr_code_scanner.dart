// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/constants/routes.dart';
import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/data/models/order.dart';
import 'package:keeyosk/data/repositories/cart_repo.dart';
import 'package:keeyosk/data/repositories/order_repo.dart';
import 'package:keeyosk/data/services/socket_service.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScanner extends StatefulWidget {
  const QRCodeScanner({super.key});

  @override
  State<QRCodeScanner> createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? _result;
  Order? _order;
  QRViewController? _controller;
  @override
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller?.pauseCamera();
    } else if (Platform.isIOS) {
      _controller?.resumeCamera();
    }
    _controller?.toggleFlash();
  }

  @override
  Widget build(BuildContext context) {
    if (_order == null) {
      RouteSettings rs = ModalRoute.of(context)!.settings;
      setState(() {
        _order = rs.arguments as Order;
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              color: lightblue,
              height: 138,
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Scan QR Code',
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: 120,
                    child: Text(
                      'Scan the QR Code of your dining table',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(
                          120,
                          120,
                          120,
                          1,
                        ),
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: 300,
              height: 300,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;
    _controller?.toggleFlash();
    _controller?.scannedDataStream.listen((scanData) {
      setState(() {
        _result = scanData;
      });
      if (tables.contains(_result!.code) && _order != null) {
        SocketService socket = SocketService();
        final cartRepo = CartRepo();
        final carts = cartRepo.getAll();
        for (Cart selected in _order!.carts) {
          carts.removeWhere((element) => element.id == selected.id);
        }
        _order!.tableId = _result!.code;
        _controller?.pauseCamera();
        socket.emit("send order", _order!.toJSON());
        Navigator.of(context).pushNamedAndRemoveUntil(
          orderSuccess,
          (route) => false,
          arguments: _order!,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}
