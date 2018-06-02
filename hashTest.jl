using Base.Test

include("C:\\Home\\OKNO\\TIWO\\hash app\\hashSrc.jl")

@testset "Hash app tests" begin
    @test createHashTable(100)=true 
end
