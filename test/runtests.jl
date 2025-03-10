using Test
using Revise# FVA: to enable revision during development of CSemifields, this should be incoked from .initjulia
using CompleteSemifields

@testset "Max-min-plus completed semifield" begin
    # Write your tests here.
    #a = Mmp.(rand(1.0:25.0, (1,5)))#This is a matrix
    #b = Mmp.(rand(1.0:25.0, (1,5)))#This is also a matrix.
    @test ⊤ == top(Mmp{Float64})
    @test ⊥ == zero(Mmp{Float64})
    @test one(Mmp{Float64}) == Mmp(0.0) == ⌶
    @test zero(Mmp{Float64}) == Mmp(-Inf)
    @test top(Mmp{Float64}) == Mmp(Inf)
    @test inv(Mmp(1.0)) == Mmp(-1.0)
    @test inv(one(Mmp{Float64})) ≈ one(Mmp{Float64})#Don't understand why equality does not work here. 
    @test inv(⊤) == ⊥
    @test inv(⊥) == ⊤
    @test inv(⌶) ≈ ⌶
    a = Mmp(1.0)
    b = Mmp(2.0)
    @test a ⊕̇ b == min(a, b)
    @test a ⊕̧ b == max(a, b)
    @test a ⊗̇ b == Mmp(a.val + b.val)
    @test a ⊗̧ b == Mmp(a.val + b.val)
    @test a ⊗̇ b ≈ Mmp(a.val + b.val)
    @test a ⊗̧ b ≈ Mmp(a.val + b.val)
    #@test ∑̇([a, b]) == a + b#FVA: this is not defined in the module yet
    #@test ∑̧([a, b]) == a + b#FVA
end

@testset "Max-min-plus matrix algebra" begin
    print(names(CompleteSemifields))
    a = Mmp.(rand(1.0:25.0, (2,5)))#This is a row matrix
    b = Mmp.(rand(1.0:25.0, (2,5)))#This is also a row matrix.
    @test adjoint(a) == a' && adjoint(b) == b'
end