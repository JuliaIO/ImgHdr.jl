# ImgHdr

[![Build Status](https://travis-ci.org/Agent-Hellboy/ImgHdr.jl.svg?branch=main)](https://travis-ci.org/Agent-Hellboy/ImgHdr.jl)
[![Coverage](https://codecov.io/gh/Agent-Hellboy/ImgHdr.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/Agent-Hellboy/ImgHdr.jl)

Library to Check Type of Image
    

## Using

```julia
julia> using ImgHdr

julia> imgtype("path/to/file.png")
"png"

julia> ImgHdr.isa_png("path/to/file.png")
true
```
