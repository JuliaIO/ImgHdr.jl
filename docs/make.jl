using Documenter
using ImgHdr

makedocs(
    sitename = "ImgHdr",
    format = Documenter.HTML(),
    modules = [ImgHdr]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "https://github.com/Agent-Hellboy/ImgHdr.jl.git"
)
