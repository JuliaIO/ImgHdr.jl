module ImgHdr
export check

"""
    Read content of the file and returns collection of U8s

"""
function what(file)
    try  
        open(file, "r") do s 
            return read(s,String)  
        end 
    catch 
        throw(MethodError("file is not present"))
    end 
end


const tests = Function[]

function test_gif(f)
    h=what(f)
    if h[1:6] == "GIF87a" || h[1:6] == "GIF89a"
        return "gif"
    end
end

push!(tests,test_gif)


function test_jpeg(f)
    h=what(f)
    if h[7:10] == "JFIF" || h[7:10] =="Exif"
        return "jpeg"
    end
end
     
push!(tests,test_jpeg)

function test_rgb(f)
    h=what(f)
    """SGI image library"""
    if startswith(h,"\001\332")
        return "rgb"
    end
end

push!(tests,test_rgb)



function test_tiff(f)
    h=what(f)
    if h[1:2] == "MM" || h[1:2] == "II"
        return "tiff"
    end
end

push!(tests,test_tiff)
   
function test_webp(f)
    h=what(f)
    if startswith(h, "RIFF") && h[9:12] == "WEBP"
        return "webp"
    end
end

push!(tests,test_webp)

function test_png(f)
    h=what(f)
    if startswith(h,"\x89PNG\r\n\x1a\n")
        return "png"
    end
end

push!(tests,test_png)
 
function test_exr(f)
    h=what(f)
    if startswith(h,"\x76\x2f\x31\x01")
        return "exr"
    end
end

push!(tests,test_exr)

function test_xbm(f)
    """X bitmap (X10 or X11)"""
    h=what(f)
    if startswith(h,"#define ")
        return "xbm"
    end
end
push!(tests,test_xbm)

function test_pbm(f)
    """PBM (portable bitmap)"""
    h=what(f)
    if length(h) >= 3 && h[1] == 'P' && occursin(h[2],"14") && occursin(h[3],"\t\n\r")
        return "pbm"
    end
end

push!(tests,test_pbm)

function test_rast(f)
    """Sun raster file"""
    h=what(f)
    if startswith(h,"\x59\xA6\x6A\x95")
        return "rast"
    end
end

push!(tests,test_rast)

function test_bmp(f)
    h=what(f)
    if startswith(h,"BM")
        return "bmp"
    end
end

push!(tests,test_bmp)


function test_pgm(f)
    """PGM (portable graymap)"""
    h=what(f)
    if length(h) >= 3 && h[1] == 'P' && occursin(h[2],"25") && occursin(h[3],"\t\n\r")
        return "pgm"
    end
end

push!(tests,test_pgm)

function test_ppm(f)
    """PPM (portable pixmap)"""
    h=what(f)
    if length(h) >= 3 && h[1] == 'P' && occursin(h[2],"36") && occursin(h[3],"\t\n\r")
        return "ppm"
    end
end

push!(tests,test_ppm)

println(length(tests))

"""
       ImgHdr.check(path/to/file)

       Checks image type

       # Examples
       ```
       julia>ImgHdr.check("example.gif") 
       "gif"
       ```
"""
function check(filename::String)
    for i in tests
        p=i(filename)
        if p != nothing
            return p
        end
    end
end

end
