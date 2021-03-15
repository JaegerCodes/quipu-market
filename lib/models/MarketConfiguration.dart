
class MarketConfiguration {
  int id;
  bool isDark;
  int background;

  MarketConfiguration({ this.id = -1, this.isDark = false, this.background = 0xffffffff });
}

MarketConfiguration dummyConfiguration = MarketConfiguration(
  id: 1,
  isDark: true,
  background: 0xff61ef91
);

