module OptimalControl

using ForwardDiff: jacobian, gradient, ForwardDiff # automatic differentiation
using LinearAlgebra # for the norm for instance
using Printf # to print iterations results
using Interpolations: linear_interpolation, Line, Interpolations
using Reexport
using Parameters # @with_kw
using StaticArrays, LabelledArrays

# todo: use RecipesBase instead of plot
import Plots: plot, plot!, Plots # import instead of using to overload the plot and plot! functions, to plot ocp solution

#
# method to compute gradient and Jacobian
∇(f::Function, x) = ForwardDiff.gradient(f, x)
Jac(f::Function, x) = ForwardDiff.jacobian(f, x)

#
# dev packages
using CTOptimization
import CTOptimization: solve, CTOptimization
@reexport using ControlToolboxTools
const ControlToolboxCallbacks = Tuple{Vararg{ControlToolboxCallback}}
@reexport using HamiltonianFlows
import HamiltonianFlows: flows, HamiltonianFlows
#

# --------------------------------------------------------------------------------------------------
# Aliases for types
const MyNumber = Real
const MyVector = Union{Vector{<:MyNumber}, StaticArray{S, <:MyNumber, N} where {S, N}, DenseArray{<:MyNumber, N} where {N}}

const Time = MyNumber
const Times = MyVector
const TimesDisc = Union{MyVector,StepRangeLen}

const States = Vector{MyVector}
const Adjoints = Vector{MyVector}
const Controls = Vector{MyVector}

const State = MyVector
const Adjoint = MyVector # todo: ajouter type adjoint pour faire par exemple p*f(x, u) au lieu de p'*f(x,u)
const Dimension = Integer

#
include("./utils.jl")
include("./default.jl")
#
include("model.jl")
include("problem.jl")
include("solve.jl")
#
include("direct/simple-shooting/init.jl")
include("direct/simple-shooting/utils.jl")
include("direct/simple-shooting/problem.jl")
include("direct/simple-shooting/solution.jl")
include("direct/simple-shooting/interface.jl")
include("direct/simple-shooting/plot.jl")

export solve

# model
export AbstractOptimalControlModel, OptimalControlModel
export Model, time!, constraint!, objective!, state!, control!
export remove_constraint!
export constraint

# problems
export AbstractOptimalControlProblem, AbstractOptimalControlSolution, AbstractOptimalControlInit
export UncFreeXfProblem, UncFreeXfInit, UncFreeXfSolution
export UncFixedXfProblem, UncFixedXfInit, UncFixedXfSolution
#
export OptimalControlProblem

#
export plot, plot!

end
