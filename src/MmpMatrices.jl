"""
    Mmp Matrices as Semimodules#
But they are actually:
- semimodules, i.e. vectors spaces with left and right commuting actions (by 'scalars')
- algebras, i.e. what multiplies left and right semimodules. This is the actual 
structure with multiplication!
"""
using Tullio, CompleteSemifields

import Base: transpose, inv, isless, isequal

"""
    Iterated lower addition in semifields
    #Candidates: suml, ∑̧ \sum\c(cedilla)
"""
function ∑̧(x::Vector{CompleteSemifield{T}}; init=zero(CompleteSemifield{T})) where {T}
    @tullio (⊕̧) res := x[i] init = (init)
end

""" 
    Upper sum: iterated upper addition.
    # Candidates: sumu, ⨃ bigcupdot, ∑̇ \sum\dot
"""
function ∑̇(x::Vector{CompleteSemifield{T}}; init=top(CompleteSemifield{T})) where {T}
    @tullio (⊕̇) res := x[i] init = (init)
end

"""
    Upper addition of matrices over complete 
"""
function ⊕̇(a::Matrix{CompleteSemifield{T}}, b::Matrix{CompleteSemifield{T}}) where {T}
    @assert size(a) == size(b)
    @tullio res[i, j] := a[i, j] ⊕̇ b[i, j]
end

"""
    Lower addition of matrices over complete semifields.
"""
function ⊕̧(a::Matrix{CompleteSemifield{T}}, b::Matrix{CompleteSemifield{T}}) where {T}
    @assert size(a) == size(b)
    @tullio res[i, j] := a[i, j] ⊕̧ b[i, j]
end

"""
    Upper multiplication of matrices
"""
function ⊗̇(a::Matrix{CompleteSemifield{T}}, b::Matrix{CompleteSemifield{T}}) where {T}
    @assert size(a,2) == size(b,1)
    @tullio (⊕̇) res[i, j] := a[i, k] ⊗̇ b[k, j] init = top(CompleteSemifield{T})
end

"""
    Lower multiplication of matrices.
"""
function ⊗̧(a::Matrix{CompleteSemifield{T}}, b::Matrix{CompleteSemifield{T}}) where {T}
    @assert axes(a,2) == axes(b,1)
    @tullio (⊕̧) res[i, j] := a[i, k] ⊗̧ b[k, j] init = zero(CompleteSemifield{T})
end

"""
    C-G conjugate on matrices.
"""
function inv(a::Matrix{CompleteSemifield{T}}) where {T}
    @tullio res[i,j] := inv(a[j,i])#Tranposition inverse
end
