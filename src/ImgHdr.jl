module ImgHdr
export check

"""
    Read content of the file and returns collection of U8s

"""
function what(file)
    try  
        open(file, "r") do s 
            return read(s) # perform desired operations if file exists 
        end 
    catch 
        # either warn or print that the file doesn't exist 
        throw(MethodError("file is not present"))
    end 
end

#function what(file)
#   if isfile(file) == true
#       l=Mmap.mmap(file)
#       return l
#   else throw(MethodError("file is not present"))
#   end
#end



const tests = Function[]

function test_gif(f)
    h=what(f)
    if all(h[1:4] .== [0x47, 0x49, 0x46, 0x38])
        return "gif"
    end
end

push!(tests,test_gif)


function test_jpeg(f)
    h=what(f)
    if all(h[1:4] .== [0xff, 0xd8, 0xff, 0xe0]) 
        return "jpeg"
    end
end
     
push!(tests,test_jpeg)

function test_rgb(f)
    h=what(f)
    if all(h[1:2] .== [0x01, 0xd8])
        return "rgb"
    end
end

push!(tests,test_rgb)

function test_bmp(f)
    h=what(f)
    if all(h[1:2] .== [0x42, 0x4d])
        return "bmp"
    end
end

push!(tests,test_bmp)

function test_tiff(f)
    h=what(f)
    if all(h[1:4] .== [0x49, 0x49, 0x2a, 0x00]) 
        return "tiff"
    end
end

push!(tests,test_tiff)
   
function test_webp(f)
    h=what(f)
    if all(h[1:5] .== [0x52, 0x49, 0x46, 0x46,0x1c]) 
        return "webp"
    end
end

push!(tests,test_webp)

function test_png(f)
    h=what(f)
    if all(h[1:4] .== [0x89, 0x50, 0x4e, 0x47])
        return "png"
    end
end

push!(tests,test_png)
 
function test_exr(f)
    h=what(f)
    if all(h[1:4] .== [0x76, 0x2f, 0x31, 0x01])
        return "exr"
    end
end

push!(tests,test_exr)

 
function test_pgm(f)
    h=what(f)
    if all(h[1:3] .== [0x50, 0x35, 0x0a])  
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
