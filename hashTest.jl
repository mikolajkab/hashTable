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
fill!(A , 0)
@test createHashArray(A, maxSize) == false   

A = Array{Int64,2}(10,10)
fill!(A , 0)
@test createHashArray(A, maxSize) == false 

A = Array{Int64,1}(1001)
B = Array{Int64,1}(maxSize)
fill!(B , 0)
@test createHashArray(A, maxSize) == B    

A = Array{Int64,1}(10)
B = Array{Int64,1}(10)  
fill!(B , 0)
@test createHashArray(A, maxSize) == B  

end

