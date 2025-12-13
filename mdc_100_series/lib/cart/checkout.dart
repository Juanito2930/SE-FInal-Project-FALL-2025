// import 'package:flutter/material.dart';

// import 'cart.dart';

// class CheckoutPage extends StatefulWidget {
//   const CheckoutPage({Key? key}) : super(key: key);

//   @override
//   _CheckoutPageState createState() => _CheckoutPageState();

// }

// class _CheckoutPageState extends State <CheckoutPage>{
//   final _creditcardnumberController = TextEditingController();
//   final _nameoncardController = TextEditingController();
//   final _expirationdateController = TextEditingController();
//   final _cvcnumberController = TextEditingController();




// @override 
//   Widget build(BuildContext context){
//     return Scaffold( 
//       appBar: AppBar(
//         elevation: 0.0,
//         titleSpacing: 0.0,

//         title: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [ 
//           const Text('Checkout ', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold,)),
//               Image.asset('assets/shoppingcart.png', width: 20, height: 20),                

//         ]
//         ),

//       ),

      
//       body: Padding (
//         padding: const EdgeInsets.all(50.0),
//        child: ListView( 
//         children: [
//           const SizedBox(height: 10),
//       Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   '16 digit Credit Card Number',
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                 ),

//                 const SizedBox(height: 8),

//                 TextField(
//                   controller: _creditcardnumberController,
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration( 
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                     label: const Center(child: Text('0000-0000-0000-0000', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
//                     floatingLabelBehavior: FloatingLabelBehavior.never,
//                   ),
//                 ),
//               ],
//             ),

//       Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Name on Card',
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                 ),

//                 const SizedBox(height: 8),

//                 TextField(
//                   controller: _nameoncardController,
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration( 
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                     label: const Center(child: Text('John Doe', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
//                     floatingLabelBehavior: FloatingLabelBehavior.never,
//                   ),
//                 ),
//               ],
//             ),
            
//                   Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Expiration date',
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                 ),

//                 const SizedBox(height: 8),

//                 TextField(
//                   controller: _expirationdateController,
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration( 
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                     label: const Center(child: Text('mm/yy', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
//                     floatingLabelBehavior: FloatingLabelBehavior.never,
//                   ),
//                 ),
//               ],
//             ),

//                   Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'CVC number',
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                 ),

//                 const SizedBox(height: 8),

//                 TextField(
//                   controller: _cvcnumberController,
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration( 
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                     label: const Center(child: Text('000', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
//                     floatingLabelBehavior: FloatingLabelBehavior.never,
//                   ),
//                 ),
//               ],
//             ),

// ElevatedButton(
//   style: ElevatedButton.styleFrom(
//     elevation: 5.0,
//     padding: const EdgeInsets.symmetric(vertical: 16,),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(16),
//     ),
//   ),
//   onPressed: () async {
//     final cardnumber = _creditcardnumberController.text.trim();
//     final nameoncard = _nameoncardController.text.trim();
//     final expiration = _expirationdateController.text.trim();
//     final cvcnumber  = _cvcnumberController.text.trim();

//     if (cardnumber.isEmpty || nameoncard.isEmpty || expiration.isEmpty || cvcnumber.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please fill in all fields")),
//       );
//       return;
//     }

//  // add database?

//                     ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(
//                           "Checkout successful! Total: \$${CartModel.totalPrice}"),
//                       duration: const Duration(seconds: 3),
//                     ),
//                   );
//   // clear cart in database
//                       Navigator.popUntil(context, (route) => route.isFirst);
                    
//     },


//             child: const Text(
//               "CHECKOUT",
//               style: TextStyle(fontSize: 18,),
//             ),
//           )
//         ]
//        ) 
//         )
//     );
//   }

  
// }




import 'package:flutter/material.dart';
import 'cart_model.dart';
import '../services/hive_service.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _creditcardnumberController = TextEditingController();
  final _nameoncardController = TextEditingController();
  final _expirationdateController = TextEditingController();
  final _cvcnumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Checkout ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/shoppingcart.png', width: 20, height: 20),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ListView(
          children: [
            _buildField("16 digit Credit Card Number", _creditcardnumberController, "0000-0000-0000-0000"),
            _buildField("Name on Card", _nameoncardController, "John Doe"),
            _buildField("Expiration date", _expirationdateController, "mm/yy"),
            _buildField("CVC number", _cvcnumberController, "000"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5.0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () async {
                final cardnumber = _creditcardnumberController.text.trim();
                final nameoncard = _nameoncardController.text.trim();
                final expiration = _expirationdateController.text.trim();
                final cvcnumber = _cvcnumberController.text.trim();

                if (cardnumber.isEmpty ||
                    nameoncard.isEmpty ||
                    expiration.isEmpty ||
                    cvcnumber.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill in all fields")),
                  );
                  return;
                }

                // Save checkout info to Hive
                const loggedInUsername = "juan"; // Replace with actual session
                HiveService.addOrder(
                  loggedInUsername,
                  CartModel.items,
                  CartModel.totalPrice,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "Checkout successful! Total: \$${CartModel.totalPrice}"),
                    duration: const Duration(seconds: 3),
                  ),
                );

                CartModel.clear();
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text(
                "CHECKOUT",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            label: Center(
              child: Text(hint,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}