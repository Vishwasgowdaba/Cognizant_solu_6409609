package com.ecommerce.search;



public class Main {

    public static void main(String[] args) {
        // Create sample products
        Product[] products = {
            new Product(101, "Wireless Mouse", "Electronics", 25.99),
            new Product(205, "Bluetooth Headphones", "Electronics", 59.99),
            new Product(307, "Organic Cotton T-shirt", "Clothing", 19.99),
            new Product(412, "Stainless Steel Water Bottle", "Home", 15.49),
            new Product(523, "Programming Book", "Books", 39.99)
        };

        // Test linear search
        System.out.println("=== Linear Search ===");
        Product found = ProductSearch.linearSearch(products, 307);
        System.out.println("Found: " + found);

        // Sort products for binary search
        ProductSearch.sortProducts(products);
        
        // Test binary search
        System.out.println("\n=== Binary Search ===");
        found = ProductSearch.binarySearch(products, 412);
        System.out.println("Found: " + found);

        // Performance comparison
        System.out.println("\n=== Performance Comparison ===");
        compareSearchPerformance(products);
    }

    private static void compareSearchPerformance(Product[] products) {
        // Create a large array for testing
        final int SIZE = 1000000;
        Product[] largeArray = new Product[SIZE];
        for (int i = 0; i < SIZE; i++) {
            largeArray[i] = new Product(i + 1, "Product " + (i + 1), "Category", (i + 1) * 0.99);
        }

        // Sort the large array
        ProductSearch.sortProducts(largeArray);

        // Search for the last element (worst case for linear search)
        int targetId = SIZE;

        // Time linear search
        long startTime = System.nanoTime();
        ProductSearch.linearSearch(largeArray, targetId);
        long linearTime = System.nanoTime() - startTime;

        // Time binary search
        startTime = System.nanoTime();
        ProductSearch.binarySearch(largeArray, targetId);
        long binaryTime = System.nanoTime() - startTime;

        System.out.printf("Linear Search Time: %,d ns%n", linearTime);
        System.out.printf("Binary Search Time: %,d ns%n", binaryTime);
        System.out.printf("Binary Search was %d times faster%n", linearTime / binaryTime);
    }
}