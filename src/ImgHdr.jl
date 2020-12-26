"Check image headers to determine image format."
module ImgHdr

export imgtype


"Read content of the file and data as `Array{UInt8}`."
function _read(file)
    try  
        open(file, "r") do s 
            return read(s,String)  
        end 
    catch 
        throw(MethodError("file is not present"))
    end 
end

const tests = Function[]


function isa_gif(f)
    h=_read(f)
    if h[1:6] == "GIF87a" || h[1:6] == "GIF89a"
        return true
    end
    return false
end

push!(tests,isa_gif)


function isa_jpeg(f)
    h=_read(f)
    if h[7:10] == "JFIF" || h[7:10] =="Exif"
        return true
    end
    return false
end
     
push!(tests,isa_jpeg)


"SGI image library"
function isa_rgb(f)
    h=_read(f)
    if startswith(h,"\001\332")
        return true
    end
    return false
end

push!(tests,isa_rgb)


function isa_tiff(f)
    h=_read(f)
    if h[1:2] == "MM" || h[1:2] == "II"
        return true
    end
    return false
end

push!(tests,isa_tiff)
   

function isa_webp(f)
    h=_read(f)
    if startswith(h, "RIFF") && h[9:12] == "WEBP"
        return true
    end
    return false
end

push!(tests,isa_webp)


function isa_png(f)
    h=_read(f)
    if startswith(h,"\x89PNG\r\n\x1a\n")
        return true
    end
    return false
end

push!(tests,isa_png)
 

function isa_exr(f)
    h=_read(f)
    if startswith(h,"\x76\x2f\x31\x01")
        return true
    end
    return false
end

push!(tests,isa_exr)


"X bitmap (X10 or X11)"
function isa_xbm(f)
    h=_read(f)
    if startswith(h,"#define ")
        return true
    end
    return false
end
push!(tests,isa_xbm)


"PBM (portable bitmap)"
function isa_pbm(f)
    h=_read(f)
    if length(h) >= 3 && h[1] == 'P' && occursin(h[2],"14") && occursin(h[3],"\t\n\r")
        return true
    end
    return false
end

push!(tests,isa_pbm)


"Sun raster file"
function isa_rast(f)
    h=_read(f)
    if startswith(h,"\x59\xA6\x6A\x95")
        return return true
    end
    return false
end

push!(tests,isa_rast)


function isa_bmp(f)
    h=_read(f)
    if startswith(h,"BM")
        return true
    end
    return false
end

push!(tests,isa_bmp)


"PGM (portable graymap)"
function isa_pgm(f)
    h=_read(f)
    if length(h) >= 3 && h[1] == 'P' && occursin(h[2],"25") && occursin(h[3],"\t\n\r")
        return true
    end
    return false
end

push!(tests,isa_pgm)


"PPM (portable pixmap)"
function isa_ppm(f)
    h=_read(f)
    if length(h) >= 3 && h[1] == 'P' && occursin(h[2],"36") && occursin(h[3],"\t\n\r")
        return true
    end
    return false
end

push!(tests,isa_ppm)


# println(length(tests))

"""
       ImgHdr.check(path/to/file)

       Checks image type

       # Examples
       ```
       julia>ImgHdr.check("example.gif") 
       "gif"
       ```
"""
function imgtype(filename::String)
    for f in tests
        p=f(filename)
        if p
            return split(string(f), '_')[2]
        end
    end
    return nothing  # just make it explicit
end

end
