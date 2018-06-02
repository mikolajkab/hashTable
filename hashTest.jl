using Base.Test

include("C:\\Home\\OKNO\\TIWO\\hash\\hashSrc.jl")

@testset "calclHash" begin
@test calclHash(100, 10) == mod(100, 10)
@test calclHash(74, 4)   == mod(74, 4)
@test calclHash(873, 17) == mod(873, 17)
end

@testset "createHashArray" begin
@test createHashArray(Array(100)) = Array(100)    
@test createHashArray(Array(1000)) = Array(1000)    
@test createHashArray(Array(1001)) = Array(1000)    
@test createHashArray(Array(9999)) = Array(1000)    

end

