#=
    Matrices over complete semifields, with the following operations:
    - upper and lower addition
    - upper and lower multiplication
    - upper and lower multiple sums
    - inversion
    - conjugate
    - adjoint
    - show
    - isless, isequal, isapprox

But they are actually:
- semimodules, i.e. vectors spaces with left and right commuting actions (by 'scalars')
- algebras, i.e. what multiplies left and right semimodules. This is the actual 
structure with multiplication!
=#

using Tullio#, CompleteSemifields#?? why this Module here?

import Base: transpose, inv, isless, isequal, conj, adjoint

raw"""
    inv(a::Matrix{CompleteSemifield{T}}) where {T} → Matrix{CompleteSemifield{T}}

Pointwise inverse on matrices over complete semifields.
"""
function Base.inv(a::Matrix{CompleteSemifield{T}}) where {T}
    @tullio res[i,j] := inv(a[i,j])#Pointwise inverse
end

raw"""
    conj(a::Matrix{CompleteSemifield{T}}) where {T} → Matrix{CompleteSemifield{T}}

Cuninghame-Green conjugate (inverse transpose) on matrices over complete semifields, relevant to Boolean, Max-min-plus 
and Max-min-times  algebras, at least.
"""
function Base.conj(a::Matrix{CompleteSemifield{T}}) where {T}
    @tullio res[i,j] := inv(a[j,i])#Tranposition inverse
end
Base.adjoint(a::Matrix{CompleteSemifield{T}}) where {T} = conj(a)
#Candidates: suml, ∑̧ \sum\c(cedilla)
raw"""
    ∑̧(x::Vector{CompleteSemifield{T}}; init=zero(CompleteSemifield{T})) where {T} → CompleteSemifield{T}

Lower sum (\sum\c(cedilla)): Iterated lower addition over vectors in complete semifields.
"""
function ∑̧(x::Vector{CompleteSemifield{T}}; init=zero(CompleteSemifield{T})) where {T}
    @tullio (⊕̧) res := x[i] init = (init)
end

 # Candidates: sumu, ⨃ bigcupdot, ∑̇ \sum\dot
raw""" 
    ∑̇(x::Vector{CompleteSemifield{T}}; init=top(CompleteSemifield{T})) where {T}

Upper sum (\sum\dot): iterated upper addition over vectors in complete semifields.
"""
function ∑̇(x::Vector{CompleteSemifield{T}}; init=top(CompleteSemifield{T})) where {T}
    @tullio (⊕̇) res := x[i] init = (init)
end

raw"""
     ⊕̇(a::Matrix{CompleteSemifield{T}}, b::Matrix{CompleteSemifield{T}}) where {T} → Matrix{CompleteSemifield{T}}

Upper addition of conformant matrices over complete semifields.
"""
function ⊕̇(a::Matrix{CompleteSemifield{T}}, b::Matrix{CompleteSemifield{T}}) where {T}
    size(a) == size(b) || DimensionMismatch("Nonconformant matrices")
    @tullio res[i, j] := a[i, j] ⊕̇ b[i, j]
end

raw"""
    ⊕̧(a::Matrix{CompleteSemifield{T}}, b::Matrix{CompleteSemifield{T}}) where {T} → Matrix{CompleteSemifield{T}}

Lower addition of conformant matrices over complete semifields.
"""
function ⊕̧(a::Matrix{CompleteSemifield{T}}, b::Matrix{CompleteSemifield{T}}) where {T}
    size(a) == size(b) || DimensionMismatch("Nonconformant matrices")
    @tullio res[i, j] := a[i, j] ⊕̧ b[i, j]
end

raw"""
    ⊗̇(a::Matrix{CompleteSemifield{T}}, b::Matrix{CompleteSemifield{T}}) where {T} → Matrix{CompleteSemifield{T}}

Upper multiplication of conformant matrices over complete semifields.
"""
function ⊗̇(a::Matrix{CompleteSemifield{T}}, b::Matrix{CompleteSemifield{T}}) where {T}
    size(a,2) == size(b,1) || DimensionMismatch("Nonconformant matrices")
    @tullio (⊕̇) res[i, j] := a[i, k] ⊗̇ b[k, j] init = top(CompleteSemifield{T})
end

raw""" 
    ⊗̧(a::Matrix{CompleteSemifield{T}}, b::Matrix{CompleteSemifield{T}}) where {T} → Matrix{CompleteSemifield{T}}

Lower multiplication of conformant matrices over complete semifields.
"""
function ⊗̧(a::Matrix{CompleteSemifield{T}}, b::Matrix{CompleteSemifield{T}}) where {T}
    axes(a,2) == axes(b,1) || DimensionMismatch("Nonconformant matrices")
    @tullio (⊕̧) res[i, j] := a[i, k] ⊗̧ b[k, j] init = zero(CompleteSemifield{T})
end

