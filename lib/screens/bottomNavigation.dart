import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

Widget bottomnavigation(BuildContext context,int index) {

 
      return BottomNavigationBar(
        onTap:(index)
           {
             switch(index)
             {
               case 0:
               {
                 Navigator.pushNamed(context, 'HomeScreen');
                 break;
               }
               case 1:
               {
                 Navigator.pushNamed(context, 'ContactUs');
                 break;
               }
               
               case 2:
               {
                 Navigator.pushNamed(context, 'Cart');
                 break;
               }
   
             }
   
   
           },
   
         type: BottomNavigationBarType.fixed,
         currentIndex: index,
         items: 
        //  <BottomNavigationBarItem>
         [
             BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home'),),
             BottomNavigationBarItem(
                 icon: Icon(Icons.contacts), title: Text('Contact us')),
             BottomNavigationBarItem(
                 icon: Icon(Icons.shopping_cart), title: Text('Cart')),
           ],
           fixedColor: Colors.orange,
          
                  
               );
               
             
           
         

}