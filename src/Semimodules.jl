#
# Matrices as Semifields
#
# But they are actually:
# - semimodules, i.e. vectors spaces with left and right actions.
# - algebras, i.e. what multiplies left and right semimodules.
using Tullio

import Base: transpose, inv, isless, isequal

Base.transpose(a::Matrix{AbstractCompleteSemifield}) =
    permutedims(a,[2,1])

"""
    Iterated lower addition in semifields
    #Candidates: suml, ∑̧ \sum\c(cedilla)
"""
function ∑̧(x::Vector{AbstractCompleteSemifield{T}}; init=zero(AbstractCompleteSemifield{T})) where T
    @tullio (⊕̧) S := x[i] init=(init)
end

""" 
    Upper sum: iterated upper addition.
    # Candidates: sumu, ⨃ bigcupdot, ∑̇ \sum\dot
"""
function ∑̇(x::Vector{AbstractCompleteSemifield{T}}; init=top(AbstractCompleteSemifield{T})) where T
    @tullio (⊕̇) S := x[i] init=(init)
end

"""
    Upper addition of matrices over complete 
"""
function ⊕̇(a::Matrix{AbstractCompleteSemifield{T}}, b::Matrix{AbstractCompleteSemifield{T}}) where T
    @assert size(a) == size(b)
    @tullio res[i,j] := a[i,j] ⊕̇ b[i,j]
end

"""
    Lower addition of matrices over complete semifields.
"""
function ⊕̧(a::Matrix{AbstractCompleteSemifield{T}}, b::Matrix{AbstractCompleteSemifield{T}}) where T
    @assert size(a) == size(b)
    @tullio res[i,j] := a[i,j] ⊕̧ b[i,j]
end

"""
    Upper multiplication of matrices
"""
function ⊗̇(a::Matrix{AbstractCompleteSemifield{T}}, b::Matrix{AbstractCompleteSemifield{T}}) where T
    #@assert size(a) == size(b)
    @tullio (⊕̇) res[i,j] := a[i,k] ⊗̇ b[k,j] init=top(AbstractCompleteSemifield{T})
end

"""
    Lower multiplication of matrices.
"""
function ⊗̧(a::Matrix{AbstractCompleteSemifield{T}}, b::Matrix{AbstractCompleteSemifield{T}}) where T
    #@assert axes(a,2) == axes(b,1)
    @tullio (⊕̧) res[i,j] := a[i,k] ⊗̧ b[k,j] init=zero(AbstractCompleteSemifield{T})
end

