// // import 'package:flutter/widgets.dart';

// // class Status extends {
// //   // Status({Status status});
// //   bool _isLogin =false;
// //   @override
// //   Widget build(BuildContext context) {
// //     // TODO: implement build
// //     return null;
// //   }
  
// // }

// // import 'package:flutter/cupertino.dart';
// // import 'package:carigari/Arrangements/Drawer.dart';
// import 'package:flutter/cupertino.dart';

// class Status{
//   bool isLogin;
//   // String name;
//   // Status({this.isLogin,this.name});
//   // theDrawer(Status status);
  
// }


// class StatusProvider extends InheritedWidget
// {
//   final Status status;

//   StatusProvider({
//     Key key,
//     Status status,
//     Widget child,
//   })  : this.status = status ??Status(),
//         super(key: key, child: child);
//   @override
//   bool updateShouldNotify(_) =>true;

//   static of(BuildContext context) {
//   return (context.inheritFromWidgetOfExactType(StatusProvider) as StatusProvider).status;
//   }
  
// }