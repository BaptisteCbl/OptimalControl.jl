using Documenter
using OptimalControl

makedocs(
    sitename = "OptimalControl.jl",
    #format = Documenter.HTML(prettyurls = false),
    format = Documenter.HTML(     
        prettyurls = false,
        assets = ["assets/ct-crop.ico"],
        canonical = "https://baptistecbl.github.io/OptimalControl.jl/stable",
        ),
    pages = [
        "Introduction" => "index.md",
        "API" => "api.md"
    ]
)

deploydocs(
    #repo = "github.com/control-toolbox/OptimalControl.jl.git",
    repo = "github.com/BaptisteCbl/OptimalControl.jl"#,
    # devbranch = "main"
)