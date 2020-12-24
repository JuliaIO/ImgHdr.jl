module ImgHdr
export check

using Mmap

"""
    Read content of the file and returns collection of U8s

"""
function what(file)
    if isfile(file) == true
        l=Mmap.mmap(file)
        return l
    else throw(MethodError("file is not present"))
    end
end



tests = []

function test_gif(f)
    h=what(f)
    if h[1] == 0x47 && h[2] == 0x49 && h[3] == 0x46 && h[4]== 0x38
        return "gif"
    end
end

push!(tests,test_gif)


function test_jpeg(f)
    h=what(f)
    if h[1] == 0xff && h[2] == 0xd8 && h[3] == 0xff && h[4]== 0xe0
        return "jpeg"
    end
end
     
push!(tests,test_jpeg)

function test_rgb(f)
    h=what(f)
    if h[1] == 0x01 && h[2] == 0xda
        return "rgb"
    end
end

push!(tests,test_rgb)

function test_bmp(f)
    h=what(f)
    if h[1] == 0x42 && h[2] == 0x4d
        return "bmp"
    end
end

push!(tests,test_bmp)

function test_tiff(f)
    h=what(f)
    if h[1] == 0x49 && h[2] == 0x49 && h[3] == 0x2a && h[4] == 0x00
        return "tiff"
    end
end

push!(tests,test_tiff)
   
function test_webp(f)
    h=what(f)
    if h[1] == 0x52 && h[2] == 0x49 && h[3] == 0x46 && h[4] == 0x46 && h[5] == 0x1c
        return "webp"
    end
end

push!(tests,test_webp)

function test_png(f)
    h=what(f)
    if h[1] == 0x89 && h[2] == 0x50 && h[3] == 0x4e && h[4] == 0x47
        return "png"
    end
end

push!(tests,test_png)
 
function test_exr(f)
    h=what(f)
    if h[1] == 0x76 && h[2] == 0x2f && h[3] == 0x31 && h[4] == 0x01
        return "exr"
    end
end

push!(tests,test_exr)

 
function test_pgm(f)
    h=what(f)
    if h[1] == 0x50 && h[2] == 0x35 && h[3] == 0x0a 
        return "pgm"
    end
end

push!(tests,test_pgm)


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
