import 'package:flutter/material.dart';
import 'package:to_do_c10_monday/my_theme.dart';

abstract class BaseConnector {
  //connector
  showLoading({String? message});
  showMessage({String? message});
  hideLoading();
}

class BaseViewModel<C extends BaseConnector> extends ChangeNotifier {
  //T: Template //C: Class
  C? connector;
}

abstract class BaseView<S extends StatefulWidget, VM extends BaseViewModel>
//take VM inherit BaseViewModel
    extends State<S> implements BaseConnector {
  late VM viewModel;

  VM initMyViewModel();
  @override
  void initState() {
    //we must initialize viewModel
    // TODO: implement initState
    super.initState();
    viewModel = initMyViewModel();
  }

  @override
  hideLoading() {
    Navigator.pop(context);
  }

  @override
  showLoading({String? message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  @override
  showMessage({String? message}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error!"),
            content: Text(message ?? ""),
            actions: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Try Again!"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyThemeData.primaryColor),
              )
            ],
            backgroundColor: MyThemeData.backgroundColor,
          );
        });
  }
}
