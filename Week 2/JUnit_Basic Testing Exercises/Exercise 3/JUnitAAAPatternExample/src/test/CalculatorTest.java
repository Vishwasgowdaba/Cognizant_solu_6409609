package com.example;

import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;

public class CalculatorTest {

    private Calculator calculator;

    @BeforeEach
    public void setUp() {
        // Setup: initialize resources
        calculator = new Calculator();
    }

    @AfterEach
    public void tearDown() {
        // Teardown: clean up resources
        calculator = null;
    }

    @Test
    public void testAddition() {
        // Arrange
        int a = 5, b = 3;

        // Act
        int result = calculator.add(a, b);

        // Assert
        assertEquals(8, result);
    }

    @Test
    public void testSubtraction() {
        // Arrange
        int a = 5, b = 3;

        // Act
        int result = calculator.subtract(a, b);

        // Assert
        assertEquals(2, result);
    }
}