#
# Code for defining the Max-min-plus (Mmp) Complete Semifield.

raw"
    The complete Max-min-plus (Mmp) Semifield.

    This semifield is not naturally complete, but can be completed in the
    usual form by adding a top element. 
"
struct Mmp{T <: AbstractFloat} <: CompleteSemifield{T}
    val::T
    # # Are these constructors needed here?
    # Mmp{T}(x) where T = new{T}(T(x))
    # function Mmp(x::T) where T
    #     new{T}(x)
    # end
    # #This is a transparent constructor: the identity
    # function Mmp{T}(x::Mmp{T}) where T
    #     x
    # end
end

Base.show(io::IO, (; val)::Mmp) =
    Base.print(io, 
     val == -Inf ? "⊥ₘ" :
     val == Inf ?  "⊤ₘ" : 
     val == 0.0 ? ℯ : "$(val)")
#       (x.val == -Inf ? "⊥ₘ" : (x.val == Inf ? "⊤ₘ" : ))
#      (x.val == -Inf ? "⊥ₘ" : (x.val == Inf ? "⊤ₘ" : "$(x.val)ₘ")))
#FVA: this printing makes impossible to recover from a scanning of a string the bottom or top elmts. 
Base.zero(::Type{Mmp{T}}) where T = Mmp(typemin(T))
#Base.zero(::Mmp{T}) where T = zero(Mmp{T})#FVA: already defined in commonCode

Base.one(::Type{Mmp{T}}) where T <: AbstractFloat = Mmp(0.0)
#Base.one(::Mmp{T}) where T = one(Mmp{T})#FVA: already defined in commonCode

top(::Type{Mmp{T}}) where T = Mmp(typemax(T))
#top(::Mmp{T}) where T = top(Mmp{T})#FVA: already defined in commonCode

# We have special notation for the zero and top in completed 
# Semifields.
⊥ = zero(Mmp{Float64})
⊤ = top(Mmp{Float64})

# Individual number inversion
Base.inv(x::Mmp) = Mmp(-x.val)
Base.adjoint((;val)::Mmp{T}) where T = Mmp{T}(-val)

# The *direct* ordering: these should be generalized to General semifields
Base.isless(a::Mmp{T}, b::Mmp{T}) where T = isless(a.val,b.val)
Base.isequal(a::Mmp{T}, b::Mmp{T}) where T = isequal(a.val,b.val)

# Operator set for all Mmp numbers
# 1) lower operators \oplusl  \otimesl
# ⨴(a::Mmp{T}, b::Mmp{T}) where T = 
#     a == zero(a) ? a :
#     b == zero(b) ? b : 
#     Mmp{T}(a.val + b.val)
# ⨭(a::Mmp{T}, b::Mmp{T}) where T = isless(a.val , b.val) ? b : a #maximum
function ⊕̧(a::Mmp{T}, b::Mmp{T}) where T
    isless(a.val , b.val) ? b : a# 1 de-structuring, no construction
end
⊗̧(a::Mmp{T}, b::Mmp{T}) where T = # with early termination for sparse computations.
    a == zero(a) ? a :
    b == zero(b) ? b : 
    Mmp{T}(a.val + b.val)
# 2) upper operators
#> \otimesrhrim
# ⨵(a::Mmp{T}, b::Mmp{T}) where T = 
#     a == top(a) ? a :
#     b == top(b) ? b : 
#     Mmp{T}(a.val + b.val)
⊗̇(a::Mmp{T}, b::Mmp{T}) where T = # with early termination for sparse computations.
    a == top(a) ? a :
    b == top(b) ? b : 
    Mmp{T}(a.val + b.val)
#\oplusrhrim
#⨮(a::Mmp{T}, b::Mmp{T}) where T = a.val < b.val ? a : b #minimum
function ⊕̇(a::Mmp{T}, b::Mmp{T}) where T
    a.val < b.val ? a : b# 1 de-structuring, no construction
end #the minimum
