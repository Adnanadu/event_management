import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            // borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    // const SizedBoxW(
                    //     size: BoxSize.s), // Spacing between containers
                    Flexible(
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            // borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1000,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.push("/eventpage");
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        // borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Item $index',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
