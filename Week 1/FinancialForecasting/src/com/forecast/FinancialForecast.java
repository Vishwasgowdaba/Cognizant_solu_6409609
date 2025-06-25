package com.forecast;

public class FinancialForecast {

    // Recursive method to calculate future value
    public static double calculateFutureValue(double presentValue, double rate, int years) {
        if (years == 0) {
            return presentValue;
        }
        return (1 + rate) * calculateFutureValue(presentValue, rate, years - 1);
    }

    public static void main(String[] args) {
        double presentValue = 10000; // Initial investment
        double rate = 0.08;          // 8% annual growth
        int years = 5;

        double futureValue = calculateFutureValue(presentValue, rate, years);
        System.out.printf("Future value after %d years: %.2f\n", years, futureValue);
    }
}

