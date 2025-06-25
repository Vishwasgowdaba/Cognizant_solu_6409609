package com.ecommerce.search;


public class ProductSearch {

    // Linear Search - O(n)
    public static Product linearSearch(Product[] products, int targetId) {
        for (Product product : products) {
            if (product.getProductId() == targetId) {
                return product;
            }
        }
        return null;
    }

    // Binary Search - O(log n) - requires sorted array
    public static Product binarySearch(Product[] sortedProducts, int targetId) {
        int left = 0;
        int right = sortedProducts.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;
            Product midProduct = sortedProducts[mid];

            if (midProduct.getProductId() == targetId) {
                return midProduct;
            } else if (midProduct.getProductId() < targetId) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return null;
    }

    // Helper method to sort products by ID
    public static void sortProducts(Product[] products) {
        java.util.Arrays.sort(products);
    }
}