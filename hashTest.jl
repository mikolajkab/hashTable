using Base.Test

include("C:\\Home\\OKNO\\TIWO\\hash\\hashSrc.jl")

@testset "Hash tests" begin
    @test calclHash(100,10)==mod(100,10)
end
