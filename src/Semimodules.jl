"""
 A generic interface for semimodules
"""
module CompleteBisemimodules

    export
    CompleteBisemimodules

    ###########
    #operations
    ⊕̇, ⊗̇,#upper addition ''\oplus\dot'', multiplication \otimes\dot 
    ⊕̧, ⊗̧,#lower addition ''\oplus\c'', multplication \otimes\c 
    # TODO: try to actually find something like \oplus\ldot lower dot, instead of \c
    top, #All top elements
    ⊤,# The top element
    ⊥, #also called zero, all bottom elements
    ℯ, #also called the unit, typically a diagonal matrix. 
    # unit is also a special element.
    # inv is the inversion operator,
    # adjoint is the inversion, specially on vectors and matrices, where it transposes.
     # Show tries to represent ⊥, ⊤ and the unit in some special notation. 
    ###########

    #############
    # Concrete types: they are typically implemented over matrices. 
    MmpBisemimodule #our beloved Max-min-plus pairs. 
    # Bottom is represented as "⊥ₘ"
    # Top is represented as "⊤ₘ"
    ##############
   
    @doc raw"""
    abstract type CompleteBisemimodule{T} end

    Abstract type for a complete bisemimodule over a complete semifield ``(S, \oplus\c, \oplus\dot, \otimes\c, \otimes\dot inv, \bot, \euler, \top)``.
   
    It has left and right actions by two algebras: e.g.
    - For (column) vectors n x 1 this is the left n x n matrix multiplication and the right scaling.
    - For row vectors, this are duals to the ones above.
    - For n x m matrices, this is left n x n, and right m x m square matrix multiplications.

    - For square matrices this renders them into an algebra where the transitive and transitive reflexive 
    elements are defined.

    """
    abstract type CompleteBisemimodule{T} where T <: CompleteSemifield 
    end
#

    include("MmpMatrices.jl")

 end#CompleteBisemimodules
