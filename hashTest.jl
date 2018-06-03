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
@test createHashArray(A, maxSize) == false   

A = Array{Int64,2}(10,10)
@test createHashArray(A, maxSize) == false 

A = Array{Int64,1}(1001)
hashArray = Array{Int}[]
for i in 1:maxSize
    push!(hashArray,[])
 end
@test createHashArray(A, maxSize) == hashArray    

A = Array{Int64,1}(10)
hashArray = Array{Int}[]
for i in 1:10
    push!(hashArray,[])
 end
@test createHashArray(A, maxSize) == hashArray  
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

@test placeInBucket!(hashArray, value_hash) == 10
end
