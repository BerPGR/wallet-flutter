import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_ui/util/my_card.dart';
import 'package:wallet_ui/util/my_button.dart';
import 'package:wallet_ui/util/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon(Icons.monetization_on),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings))
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'My',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' Cards',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),

                  //plus button
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey[400]),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 25,
            ),

            //cards
            Container(
              height: 190,
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: [
                  MyCard(
                    balance: 5250.25,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.deepPurple[400],
                  ),
                  MyCard(
                    balance: 342.23,
                    cardNumber: 12345678,
                    expiryMonth: 11,
                    expiryYear: 23,
                    color: Colors.blue[400],
                  ),
                  MyCard(
                    balance: 420.42,
                    cardNumber: 12345678,
                    expiryMonth: 8,
                    expiryYear: 22,
                    color: Colors.green[400],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 25,
            ),

            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(activeDotColor: Colors.grey.shade700),
            ),

            SizedBox(height: 40),
            // 3 buttons -> send + pay + bills
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Send button
                  MyButton(
                      buttonText: 'Send',
                      iconImagePath: 'assets/icons/send-money.png'),

                  //Pay button
                  MyButton(
                      buttonText: 'Pay',
                      iconImagePath: 'assets/icons/credit-card.png'),

                  //bills button
                  MyButton(
                      buttonText: 'Bills',
                      iconImagePath: 'assets/icons/bill.png')
                ],
              ),
            ),

            SizedBox(height: 25),

            // column -> stats + transactions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  MyListTile(
                    iconImagePath: 'assets/icons/statistics.png',
                    title: 'Statistics',
                    subtitle: 'Payments and income',
                  ),
                  MyListTile(
                    iconImagePath: 'assets/icons/transaction.png',
                    title: 'Transactions',
                    subtitle: 'Transaction History',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
