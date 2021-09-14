# Name: Shopify Data Science Intern Challenge - Question #1
# Author: Brianna Drew                                              
# Date Created: September 10th, 2021
# Last Modified: September 14th, 2021

# Import package libraries
library(ggplot2)
library(hrbrthemes)

# Import and view CSV data file
sneaker_shops = read.csv("C:\\Users\\brian\\OneDrive\\Desktop\\Work\\Data Science\\datasciencechallenge.csv", header = TRUE)
View(sneaker_shops)

# Calculate and print AOV
print(sum(sneaker_shops$order_amount)/nrow(sneaker_shops))

# Create scatterplots
ggplot(sneaker_shops, aes(x=created_at, y=order_amount, color=shop_id)) + geom_point() + theme_modern_rc() + ggtitle("Sneaker Shop Order Amounts")
ggplot(sneaker_shops, aes(x=total_items, y=order_amount, color=shop_id)) + geom_point() + theme_modern_rc() + ggtitle("Sneaker Shop Order Amounts vs Item Quantity")

##### OPTION #1: CALCULATE APPROXIMATE COST PER ITEM INSTEAD #####

# Replicate data set
sneaker_shops_new <- sneaker_shops

# Add new column to data set containing total order amount divided by item quantity
sneaker_shops_new$per_item <- sneaker_shops_new$order_amount / sneaker_shops_new$total_items

# Calculate mean approximate item price
mean(sneaker_shops_new$per_item)

##### OPTION #2: REPLACE MAJOR OUTLIERS WITH MEDIAN #####

# Calculate median order amount
omedian <- median(sneaker_shops$order_amount)
print(omedian)

# Replace order amounts greater that $100,000 with the median order amount
sneaker_shops$order_amount[ sneaker_shops$order_amount>5000 ] <- omedian

# Calculate and print new AOV (with outliers handled)
print(sum(sneaker_shops$order_amount)/nrow(sneaker_shops))