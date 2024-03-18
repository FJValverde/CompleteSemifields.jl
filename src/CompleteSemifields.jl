"""
        module CompleteSemifields: A module to capture the concept of a complete 
        semifield and provide most notorious examples.

        This is intended to model *positive* semifields, where the order is compatible
        with both the product and addition (i.e. you can never change and ordering constraint
        by adding an element or multiplying by an element).

        Positive semifields always have a bottom element which acts as zero for multiplication.

        Complete *positive* semifields are have a top and bottom, and always come in (dually-ordered)
        pairs, e.g. max-plus and min-plus; max-times and min-times, etc. 

        This generates some notational "anxiety" if you want to mix expressions stemming from
        residuation a problem which was solved in convex analysis with the use of the dotted-notation
        
        So for the pair on max-min-plus completed semifields we have:
        - upper addition and multiplication refer to min-plus operations
        - lower addition and multiplication refer to max-plus operations.
        - ⊥ is the bottom of the direct semifield, max-plus.
        - ⊤ is the bottom of the inverse semifield, min-plus.
"""
module CompleteSemifields

using Tullio# For matrix operations mainly

export
    # Types: Typically stemming from Numbers! Fix this!
    #AbstractSemiring, AbstractSemifield, AbstractCompleteSemifield,
    CompleteSemifield, 

    ###########
    #operations
    ⊕̇, ⊗̇,#upper addition ''\oplus\dot'', multiplication \otimes\dot 
    ⊕̧, ⊗̧,#lower addition ''\oplus\c'', multplication \otimes\c 
    # TODO: try to actually find something like \oplus\ldot lower dot, instead of \c
    top, 
    ⊤,# The top element
    ⊥, #also called zero
    ℯ, #also called the unit
    # unit is also a special element.
    # inv is the inversion operator,
    # adjoint is the inversion, specially on vectors and matrices, where it transposes.
     # Show tries to represent ⊥, ⊤ and the unit in some special notation. 
    ###########

    #############
    # Concrete types:
    Mmp #our beloved Max-min-plus pairs. 
    # Bottom is represented as "⊥ₘ"
    # Top is represented as "⊤ₘ"
    ##############

include("commonCode.jl")#Type definitions and little else
include("maxMinPlus.jl")#Includes the Max-min-plus complete semifield.
#include("Semimodules.jl")#Actually matrix semimodules!
end
