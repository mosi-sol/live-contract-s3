# Swap Value

### for example we have 2 uint variables, like:
- x = 10
- y = 15
- ---
- the binary representation of 10 is 1010
- and the binary representation of 15 is 1111
- ---
- x = x ^ y => 1010 ^ 1111 => 0101
- y = x ^ y => 0101 ^ 1111 => 1010
- y = (1010 ^ 1111) ^ 1111 
- y = 1010 ^ (1111 ^ 1111)
- y = 1010 ^ 0  
- since x ^ 0 = x
- y = 1010
- x = 0101 ^ 1010 => (1111 ^ 1010) ^ 1010 => 1111 ^ (1010 ^ 1010) => 1111 ^ 0 => 1111

NOW `x = 15` AND `y = 10` .

