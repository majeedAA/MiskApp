class Rate {
  final String rateId;
  final int customerRateDriver;
  final int customerRateMarket;
  final int marketRateCustomer;
  final int drivrtRateCustomer;

  Rate(
      {this.rateId,
      this.customerRateDriver,
      this.customerRateMarket,
      this.marketRateCustomer,
      this.drivrtRateCustomer});
}

class RateData {
  final String rateId;
  final int customerRateDriver;
  final int customerRateMarket;
  final int marketRateCustomer;
  final int drivrtRateCustomer;

  RateData(
      {this.rateId,
      this.customerRateDriver,
      this.customerRateMarket,
      this.marketRateCustomer,
      this.drivrtRateCustomer});
}
