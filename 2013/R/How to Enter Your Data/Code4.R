vec1 <- c(30, 6, 15, 16, 0, 45, 6, 4, TRUE)
vec2 <- c(30, 6, 15, 16, 0, 45, 6, 4, "a")
vec3 <- c(30, 6, 15, 16, 0, 45, 6, 4, 1 + 3i)

class(vec)

# OUTPUT
[1] "numeric"

class(vec1)

# OUTPUT
[1] "numeric"

class(vec2)

# OUTPUT
[1] "character"

class(vec3)

# OUTPUT
[1] "complex"
