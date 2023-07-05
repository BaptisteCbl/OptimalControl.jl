using Documenter
using OptimalControl

makedocs(
    sitename = "OptimalControl.jl",
    format = Documenter.HTML(prettyurls = false),
    pages = [
        "Introduction" => "index.md",
        "API" => "api.md"
    ]
)

# deploydocs(
#     repo = "github.com/control-toolbox/OptimalControl.jl.git",
#     devbranch = "main"
# )

using MultiDocumenter

clonedir = mktempdir()

docs = [
    MultiDocumenter.DropdownNav(
        "Debugging",
        [
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "CTBase"),
                path = "ctbase",
                name = "CTBase",
                giturl = "https://github.com/control-toolbox/CTBase.jl.git",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "CTProblems"),
                path = "ctproblems",
                name = "CTProblems",
                giturl = "https://github.com/control-toolbox/CTProblems.jl.git",
            ),
        ],
    ),
]

#outpath = mktempdir()
outpath = joinpath(@__DIR__, "build")
MultiDocumenter.make(
    outpath,
    docs;
    rootpath = "/OptimalControl.jl/",
)