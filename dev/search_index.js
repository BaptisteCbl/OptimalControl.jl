var documenterSearchIndex = {"docs":
[{"location":"api.html","page":"API","title":"API","text":"CurrentModule = ControlToolbox ","category":"page"},{"location":"api.html","page":"API","title":"API","text":"Pages = [\"api.md\"]","category":"page"},{"location":"api.html#API","page":"API","title":"API","text":"","category":"section"},{"location":"api.html","page":"API","title":"API","text":"This page is a dump of all the docstrings found in the code. ","category":"page"},{"location":"api.html","page":"API","title":"API","text":"Modules = [ControlToolbox]\nOrder = [:module, :type, :function, :macro]","category":"page"},{"location":"api.html#Base.show-Tuple{IO, RegularOCPFinalCondition}","page":"API","title":"Base.show","text":"Base.show(io::IO, ocp::RegularOCPFinalCondition)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#Base.show-Tuple{IO, RegularOCPFinalConstraint}","page":"API","title":"Base.show","text":"Base.show(io::IO, ocp::RegularOCPFinalConstraint)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#Base.showerror-Tuple{IO, AmbiguousDescription}","page":"API","title":"Base.showerror","text":"Base.showerror(io::IO, e::AmbiguousDescription)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#Base.showerror-Tuple{IO, InconsistentArgument}","page":"API","title":"Base.showerror","text":"Base.showerror(io::IO, e::InconsistentArgument)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#Base.showerror-Tuple{IO, IncorrectMethod}","page":"API","title":"Base.showerror","text":"Base.showerror(io::IO, e::IncorrectMethod)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.BFGS-NTuple{6, Any}","page":"API","title":"ControlToolbox.BFGS","text":"BFGS(sᵢ, dᵢ, gᵢ, gᵢ₊₁, Hᵢ, Iₙ)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.adjoint-NTuple{5, Any}","page":"API","title":"ControlToolbox.adjoint","text":"adjoint(xₙ, pₙ, T, U, f)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.backtracking-NTuple{5, Any}","page":"API","title":"ControlToolbox.backtracking","text":"backtracking(x, d, g, f, s₀)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.bissection-NTuple{6, Any}","page":"API","title":"ControlToolbox.bissection","text":"bissection(x, d, g, f, ∇f, s₀)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.convert-Tuple{RegularOCPFinalCondition, DataType}","page":"API","title":"ControlToolbox.convert","text":"convert(ocp::RegularOCPFinalCondition, ocp_type::DataType)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.descent2ocp_solution-Tuple{ControlToolbox.DescentSol, RegularOCPFinalConstraint, Union{StepRangeLen, Vector{<:Number}}, Number}","page":"API","title":"ControlToolbox.descent2ocp_solution","text":"descent2ocp_solution(sd_sol::DescentSol, ocp::RegularOCPFinalConstraint, grid_size::Integer, penalty_constraint::Number)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.descent_solver-Tuple{ControlToolbox.DescentProblem, ControlToolbox.DescentInit}","page":"API","title":"ControlToolbox.descent_solver","text":"descent_solver(sdp::DescentProblem, \ninit::DescentInit; \ndirection::Symbol=__direction(), \nline_search::Symbol=__line_search(),\niterations::Integer=__iterations(), \nstep_length::Union{Number, Nothing}=__step_length(),\nabsoluteTolerance::Number=__absoluteTolerance(), \noptimalityTolerance::Number=__optimalityTolerance(), \nstagnationTolerance::Number=__stagnationTolerance(),\ndisplay::Bool=__display(),\ncallbacks::CTCallbacks=__callbacks())\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.get-Tuple{DescentOCPSol, Union{Symbol, Tuple{Symbol, Integer}}}","page":"API","title":"ControlToolbox.get","text":"get(ocp_sol::DescentOCPSol, xx::Union{Symbol, Tuple{Symbol, Integer}})\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.model-NTuple{4, Any}","page":"API","title":"ControlToolbox.model","text":"model(x0, T, U, f)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.printDescent-NTuple{6, Any}","page":"API","title":"ControlToolbox.printDescent","text":"printDescent(i, sᵢ, dᵢ, xᵢ, gᵢ, fᵢ)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.printOCPDescent-NTuple{6, Any}","page":"API","title":"ControlToolbox.printOCPDescent","text":"printOCPDescent(i, sᵢ, dᵢ, Uᵢ, gᵢ, fᵢ)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.print_convergence-Tuple{ControlToolbox.DescentSol}","page":"API","title":"ControlToolbox.print_convergence","text":"print_convergence(ocp_sol::DescentOCPSol)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.read-Tuple{Tuple{Vararg{Symbol}}}","page":"API","title":"ControlToolbox.read","text":"read(method::Description)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.solve_by_descent-Tuple{RegularOCPFinalCondition, Vararg{Any}}","page":"API","title":"ControlToolbox.solve_by_descent","text":"solve_by_descent(ocp::RegularOCPFinalCondition, args...; kwargs...)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.stop_iterations-NTuple{11, Any}","page":"API","title":"ControlToolbox.stop_iterations","text":"stop_iterations(i, sᵢ, dᵢ, xᵢ, gᵢ, fᵢ, \nng₀, optimalityTolerance, absoluteTolerance, stagnationTolerance, iterations)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.stop_optimality-NTuple{11, Any}","page":"API","title":"ControlToolbox.stop_optimality","text":"stop_optimality(i, sᵢ, dᵢ, xᵢ, gᵢ, fᵢ, \nng₀, optimalityTolerance, absoluteTolerance, stagnationTolerance, iterations)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#ControlToolbox.stop_stagnation-NTuple{11, Any}","page":"API","title":"ControlToolbox.stop_stagnation","text":"stop_stagnation(i, sᵢ, dᵢ, xᵢ, gᵢ, fᵢ, \nng₀, optimalityTolerance, absoluteTolerance, stagnationTolerance, iterations)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#RecipesBase.plot!-Tuple{Plots.Plot, DescentOCPSol, Union{Symbol, Tuple{Symbol, Integer}}, Union{Symbol, Tuple{Symbol, Integer}}, Vararg{Any}}","page":"API","title":"RecipesBase.plot!","text":"Plots.plot!(p::Plots.Plot{<:Plots.AbstractBackend}, ocp_sol::DescentOCPSol, \nxx::Union{Symbol, Tuple{Symbol, Integer}}, \nyy::Union{Symbol, Tuple{Symbol, Integer}}, args...; kwargs...)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#RecipesBase.plot-Tuple{DescentOCPSol, Union{Symbol, Tuple{Symbol, Integer}}, Union{Symbol, Tuple{Symbol, Integer}}, Vararg{Any}}","page":"API","title":"RecipesBase.plot","text":"Plots.plot(ocp_sol::DescentOCPSol, \nxx::Union{Symbol, Tuple{Symbol, Integer}}, \nyy::Union{Symbol, Tuple{Symbol, Integer}}, args...; kwargs...)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"api.html#RecipesBase.plot-Tuple{DescentOCPSol, Vararg{Any}}","page":"API","title":"RecipesBase.plot","text":"Plots.plot(ocp_sol::DescentOCPSol, args...; \nstate_style=(), \ncontrol_style=(), \nadjoint_style=(), kwargs...)\n\nTBW\n\n\n\n\n\n","category":"method"},{"location":"index.html#ControlToolbox.jl","page":"Introduction","title":"ControlToolbox.jl","text":"","category":"section"},{"location":"index.html#Overview","page":"Introduction","title":"Overview","text":"","category":"section"},{"location":"index.html","page":"Introduction","title":"Introduction","text":"This package is ...","category":"page"}]
}
