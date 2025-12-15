#!/bin/bash

# Simple Interest Calculator
# Formula: SI = (P × R × T) / 100

echo "========================================"
echo "     SIMPLE INTEREST CALCULATOR"
echo "========================================"

# Get user input
echo -n "Enter the Principal amount: "
read principal

echo -n "Enter the Rate of Interest (in %): "
read rate

echo -n "Enter the Time Period (in years): "
read time

# Validate input
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Please enter valid numbers only."
    exit 1
fi

# Calculate simple interest
# Using bc for floating point arithmetic
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate total amount
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display results
echo ""
echo "========================================"
echo "             CALCULATION RESULTS"
echo "========================================"
printf "Principal Amount:      %' .2f\n" $principal
printf "Rate of Interest:      %' .1f%%\n" $rate
printf "Time Period:           %' .1f years\n" $time
echo "----------------------------------------"
printf "Simple Interest:       %' .2f\n" $simple_interest
printf "Total Amount:          %' .2f\n" $total_amount
echo "========================================"
