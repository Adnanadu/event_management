import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final cartProvider = ChangeNotifierProvider((ref) => CartProvider());

class FestivalDetailsPage extends HookConsumerWidget {
  const FestivalDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Festival Description Page'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Image(image: AssetImage("assets/images/user.jpg")),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(child: Text("Festival Name & Place")),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Description"),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Expanded(child: Text("Descrisdddddddption")),
            ),
            SizedBox(height: 16),

            ///Event Location in google Api Integration
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Event Location"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 48),
          ),
          onPressed: () {
            /// Add to cart
            // context.read<CartProvider>4().addTicketToCart(
            //       ticketId: "123",
            //       ticketName: "Ticket Name",
            //       ticketPrice: 100,
            //     );
            context.push("/dashboard");
          },
          child: const Text("Book Now"),
        ),
      ),
    );
  }
}
