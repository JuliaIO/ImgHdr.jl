# ImgHdr


[![Build Status](https://github.com/JuliaIO/ImgHdr.jl/workflows/CI/badge.svg)](https://github.com/JuliaIO/ImgHdr.jl/actions)
[![Coverage](https://codecov.io/gh/JuliaIO/ImgHdr.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/JuliaIO/ImgHdr.jl)

Library to Check Type of Image
    

## Using

```julia
julia> using ImgHdr

julia> imgtype("path/to/file.png")
"png"

julia> ImgHdr.isa_png("path/to/file.png")
true
```
