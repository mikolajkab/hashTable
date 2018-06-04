using Base.Test

include("C:\\Home\\OKNO\\TIWO\\hash\\hashSrc.jl")

@testset "calclHash" begin
@test calclHash(100, 10) == mod(100, 10)
@test calclHash(74, 4)   == mod(74, 4)
@test calclHash(873, 17) == mod(873, 17)
end

@testset "createHashArray" begin
maxSize = 100
A = Array{Int64,2}(4,9)
@test createEmptyHashArray(A, maxSize) == false   

A = Array{Int64,2}(10,10)  
@test createEmptyHashArray(A, maxSize) == false 

A = Array{Int64,1}(1001)
hashArray = Array{Int}[]
for i in 1:maxSize
    push!(hashArray,[])
 end
@test createEmptyHashArray(A, maxSize) == hashArray    

A = Array{Int64,1}(10)
hashArray = Array{Int}[]
for i in 1:10
    push!(hashArray,[])
 end
@test createEmptyHashArray(A, maxSize) == hashArray  
end

@testset "placeInBucket" begin
# input values
numOfBuckets = 100
hashArray = Array{Int}[]
for i in 1:numOfBuckets
   push!(hashArray,[])
end

value = 10
hash = 15
value_hash = (value, hash,0)
@test placeInBucket!(hashArray, value_hash) == false

value = 10
hash = 101
value_hash = (value, hash)
@test placeInBucket!(hashArray, value_hash) == false

value = 10
hash = 15
value_hash = (value, hash)
@test placeInBucket!(hashArray, value_hash) == true
end


@testset "creteHashTable" begin

maxSize = 100
inputArray = [1, 1, 2, 2, 3, 3, 4, 4]
hashArray = [[], [1,1], [2,2], [3,3], [4,4], [], [], []]
@test createHashArray(inputArray, maxSize) == hashArray

inputArray = [1, 2, 3, 4, 5, 6, 7, 8]
hashArray = [[8], [1], [2], [3], [4], [5], [6], [7]]
@test createHashArray(inputArray, maxSize) == hashArray

inputArray = [1, 1, 1, 1, 1, 1, 1, 1]
hashArray = [[], [1, 1, 1, 1, 1, 1, 1, 1], [], [], [], [], [], []]
@test createHashArray(inputArray, maxSize) == hashArray

maxSize = 2
inputArray = [1, 2, 3, 4, 5, 6, 7, 8]
hashArray = [[2, 4, 6, 8], [1, 3, 5, 7]]
@test createHashArray(inputArray, maxSize) == hashArray
end

@testset "returnVector" begin

hashArray = [[2, 4, 6, 8], [1, 3, 5, 7]]
vector = [2, 4, 6, 8]
@test returnVector(hashArray, 1) = vector

end