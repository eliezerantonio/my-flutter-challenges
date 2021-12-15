import 'package:atm/user/user_manager.dart';
import 'package:atm/widgets/logo_widget.dart';
import 'package:atm/account/account_manger.dart';
import 'package:flutter/material.dart';
import 'credit_cards_concept_detail_page.dart';
import 'credit_card_widget.dart';
import 'package:provider/provider.dart';

//ignore: must_be_immutable
class CreditCardConceptPage extends StatelessWidget {
  final pageNotifier = ValueNotifier(0);
  int _lastPage = 0;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserManager>().user;
    final creditCards = context.watch<AccountManager>().creditCards;
    final textTheme = Theme.of(context).textTheme;
    const padding = EdgeInsets.all(18.0);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              child: LogoWidget(),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Cartões",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        elevation: 0,
        actions: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                user.pic,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
      body: creditCards.isEmpty
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cartões',
                        style: textTheme.headline4.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Saldo',
                        style: textTheme.subtitle2.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 3),
                      ValueListenableBuilder<int>(
                          valueListenable: pageNotifier,
                          builder: (context, snapshot, _) {
                            final currentCard = creditCards[snapshot];
                            final lastCard = creditCards[_lastPage];
                            return TweenAnimationBuilder<double>(
                              tween: Tween<double>(
                                begin: lastCard?.amount,
                                end: currentCard?.amount,
                              ),
                              duration: const Duration(milliseconds: 500),
                              builder: (_, value, ___) => Text(
                                value.toStringAsFixed(2),
                                style: textTheme.headline6.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (page) {
                      _lastPage = pageNotifier.value;
                      pageNotifier.value = page;
                    },
                    controller: PageController(
                      viewportFraction: 0.7,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: creditCards.length,
                    itemBuilder: (_, index) => Align(
                      child: Transform.translate(
                        offset: Offset(-30.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CreditCardWidget(
                            onTap: () {
                              final page = CreditCardsConceptDetailPage(
                                card: creditCards[index],
                              );
                              Navigator.of(context).push(
                                PageRouteBuilder<Null>(
                                  pageBuilder: (BuildContext context,
                                      Animation<double> animation, _) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: page,
                                    );
                                  },
                                  transitionDuration:
                                      Duration(milliseconds: 900),
                                ),
                              );
                            },
                            card: creditCards[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
              ],
            ),
    );
  }
}
