"""
 A generic interface for semimodules
"""
module Bisemimodules
#using .CompleteSemifield
#using Tullio# For quick matrix operations mainly

export
    Bisemimodule# An abstract type
    # CAVEAT: this does not cover the algebra of MATRICES acting as left actions aka LINEAR TRANSFORMATIONS
    # on other matrices acting as vectors in the semimodule. 

    # ###########
    # #operations
    # ⊕̇, ⊗̇,#upper addition ''\oplus\dot'', multiplication ''\otimes\dot''
    # ⊕̧, ⊗̧,#lower addition ''\oplus\c'', multplication ''\otimes\c''
    # ∑̧, ∑̇,#upper and lower multiple sums '' \sum\c'' and ''\sum\dot'', resp
    # # TODO: try to actually find something like \oplus\ldot lower dot, instead of \c
    # top, #All top elements
    # ⊤,# The top element
    # ⊥, #also called zero, all bottom elements
    # ℯ #also called the unit, typically a diagonal matrix. 
    # # unit is also a special element.
    # # inv is the inversion operator,
    # # adjoint is the inversion, specially on vectors and matrices, where it transposes.
    #  # Show tries to represent ⊥, ⊤ and the unit in some special notation. 
    # ###########

    ############# FVA check the need for this.
    # Concrete types: they are typically implemented over matrices. 
    #MmpBisemimodule #our beloved Max-min-plus pairs. 
    # Bottom is represented as "⊥ₘ"
    # Top is represented as "⊤ₘ"
    ##############
   
"""
    abstract type Bisemimodule{T} <: CompleteSemifield  end

Abstract type for a complete bisemimodule over a complete semifield ``(S, ⊕̧, ⊕̇, ⊗̧, ⊗̇, inv, ⊥, ℯ, ⊤)``.
   
It has left and right actions by two algebras: e.g.
    - For (column) vectors n x 1 this is the left n x n matrix multiplication and the right scaling.
    - For row vectors, this are duals to the ones above.
    - For n x m matrices, this is left n x n, and right m x m square matrix multiplications.

    - For square matrices this renders them into an algebra where the transitive and transitive reflexive 
    closures are defined.

"""
abstract type Bisemimodule{T <: CompleteSemifield}
end#CompleteBisemimodules
# FVA: is this ever instantiated as a concrete type? Perhaps making an alias of Matrix{CompleteSemifield{T}}
# FVA: is the algebra completable to a CompleteSemifield of matrices?

#include("MmpMatrices.jl")

end#Bisemimodules module