# using MultiDocumenter

# clonedir = mktempdir()

# docs = [
#     MultiDocumenter.DropdownNav(
#         "Debugging",
#         [
#             MultiDocumenter.MultiDocRef(
#                 upstream = joinpath(clonedir, "CTBase"),
#                 path = "ctbase",
#                 name = "CTBase",
#                 giturl = "https://github.com/control-toolbox/CTBase.jl.git",
#             ),
#             MultiDocumenter.MultiDocRef(
#                 upstream = joinpath(clonedir, "CTProblems"),
#                 path = "ctproblems",
#                 name = "CTProblems",
#                 giturl = "https://github.com/control-toolbox/CTProblems.jl.git",
#             ),
#         ],
#     ),
# ]

# outpath = mktempdir()
# #outpath = joinpath(@__DIR__, "build")
# MultiDocumenter.make(
#     outpath,
#     docs;
#     rootpath = "/OptimalControl.jl/",
# )

# gitroot = normpath(joinpath(@__DIR__, ".."))
# run(`git pull`)
# outbranch = "gh-pages"
# has_outbranch = true
# if !success(`git checkout $outbranch`)
#     has_outbranch = false
#     if !success(`git switch --orphan $outbranch`)
#         @error "Cannot create new orphaned branch $outbranch."
#         exit(1)
#     end
# end
# for file in readdir(gitroot; join = true)
#     endswith(file, ".git") && continue
#     rm(file; force = true, recursive = true)
# end
# for file in readdir(outpath)
#     cp(joinpath(outpath, file), joinpath(gitroot, file))
# end
# run(`git add .`)
# if success(`git commit -m 'Aggregate documentation'`)
#     @info "Pushing updated documentation."
#     if has_outbranch
#         run(`git push`)
#     else
#         run(`git push -u origin $outbranch`)
#     end
#     run(`git checkout main`)
# else
#     @info "No changes to aggregated documentation."
# end

using Documenter, LibGit2, Pkg
using MultiDocumenter

clonedir = mktempdir()

# Ordering Matters!
docsmodules = [
    "Base and Utilities" => ["CTBase", "CTFlows"],
    "Solvers" => ["CTDirect", "CTDirectShooting"],
    "Examples" => ["CTProblems"]
]

docs = Any[MultiDocumenter.MultiDocRef(upstream = joinpath(clonedir, "Home"),
                                       path = "Overview",
                                       name = "Home",
                                       giturl = "https://github.com/BaptisteCbl/OptimalControl.jl.git")]

for group in docsmodules
    docgroups = []
    for mod in group[2]
        url = "https://github.com/control-toolbox/$mod.jl.git"
        push!(docgroups,
                MultiDocumenter.MultiDocRef(upstream = joinpath(clonedir, mod),
                                            path = mod,
                                            name = mod,
                                            giturl = url,
                                            branch = mod ∈ usemain ? "main" : "gh-pages"))
    end
    push!(docs, MultiDocumenter.MegaDropdownNav(group[1], docgroups))
end

outpath = joinpath(@__DIR__, "build")

MultiDocumenter.make(outpath, docs;
                     assets_dir = "docs/src/assets",
                     search_engine = MultiDocumenter.SearchConfig(index_versions = [
                                                                      "stable",
                                                                  ],
                                                                  engine = MultiDocumenter.FlexSearch),
                     brand_image = MultiDocumenter.BrandImage("https://control-toolbox.org/",
                                                              joinpath("assets",
                                                                       "ct-crop.svg")))