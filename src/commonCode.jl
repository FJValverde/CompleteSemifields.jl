# Common code for CompleteSemifields

# # FVA: this is a basis to eventually entwine semifields here
# @doc raw"""
#     abstract type Semiring end

# Abstract type for a semiring ``(S, \oplus, \otimes, inv, \bot, \euler, \top)``.
#     """
# abstract type Semiring{T} #<: Number#This is overspecifying
# end
# Don't know whether <: Number would make it to concrete to hold, e.g. matrix semirings.

#Base.REPLCompletions.latex_symbols["\\_max"] = "ₘₐₓ"
#Base.REPLCompletions.latex_symbols["\\_min"] = "ₘᵢₙ"
#abstract type Semifield <: Semiring end
# Should add division but fail on inverses for bot

@doc raw"""
    abstract type CompleteSemifield{T} end

Abstract type for a semiring ``(S, \oplus\c, \oplus\dot, \otimes\c, \otimes\dot inv, \bot, \euler, \top)``.
    """
abstract type CompleteSemifield{T} #<: Semifield 
end
# Should add top element

"""
    x ⊕̇ y (\\oplus\\dot)

Upper semifield addition.
"""
⊕̇

"""
    x ⊕̧ y (\\oplus\\c)

Lower semifield addition.
"""
⊗̧

"""
    x ⊗̇ y (\\otimes\\dot)

Upper semifield multiplication.
"""
⊗̇

"""
    x ⊗̧ y (\\otimes\\c)

Lower semifield multiplication.
"""
⊗̧

"""

Semifield inversion.
"""
inv

"""
Top element for a completed semifield ''⊤'' (get with \\top)
"""
top

""" 
⊤ an alias for the top element of a completed semifield. 
"""
⊤ 
 
"""
An alias for the bottom element of  a semifield ''⊥'' (get with \\bot)
"""
⊥

"""
Unit element for a completed semifield ''ℯ'' (get with \\euler)
"""
ℯ 

"""
    val(x::Semifield)

Return the "real" value / object wrapped in the semifield type
"""
val(x::CompleteSemifield) = x.val

"""
    Base.valtype(::Type{<:Semifield{T}}) where T

Return the type of the value wrapped by the semifield.
"""
Base.valtype(::Type{<:CompleteSemifield{T}}) where T = T

"""
        Overload the ''Base.zero'' unary constructor to work on elements as well as on types. 
"""
Base.zero(x::CompleteSemifield) = zero(typeof(x))

"""
        Overload the ''Base.one'' unary constructor to work on elements as well as on types. 
"""
Base.one(x::CompleteSemifield) = one(typeof(x))

"""
        Overload the ''top'' unary constructor to work on elements as well as on types. 
"""
top(x::CompleteSemifield) = top(typeof(x))

"""
Basic convert function for Semifields elements.
"""
Base.convert(T::Type{<:CompleteSemifield}, x::Number) = T(x)

"""
Basic output primitive for semifield elements.

To output specific notation, these should be redefined for more concrete types. 
"""
Base.show(io::IO, x::CompleteSemifield) = print(io, val(x))
