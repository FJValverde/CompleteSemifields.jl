using Test
using Revise# FVA: to enable revision during development of CSemifields, this should be incoked from .initjulia
using CompleteSemifields

@testset "CompleteSemifields.jl" begin
    # Write your tests here.
    a = Mmp.(rand(1.0:25.0, (1,5)))
    b = Mmp.(rand(1.0:25.0, (1,5)))
    @test a ⊕̇ b == min.(a, b)
    @test a ⊕̧ b == max.(a, b)
end
