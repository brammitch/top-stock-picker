### Stock Picker

Takes in an array of stock prices, one for each hypothetical day. It returns a pair of days representing the best day to buy and the best day to sell.

```rb
stock_picker([17,3,6,9,15,8,6,1,10])

[1,4]  # for a profit of $15 - $3 == $12
```

Returns `nil` if no profit could be made.

```rb
stock_picker([11,9,6,4,1,0])

nil
```
