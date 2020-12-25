using ImgHdr, Test

@testset "test_images" begin
    @test check("images/example.png") == "png"
    @test check("images/example.gif") == "gif"
    @test check("images/example.jpeg") == "jpeg"
    @test check("images/example.exr") == "exr"
    @test check("images/example.tiff") == "tiff"
    @test check("images/example.webp") == "webp"
    @test check("images/example.pbm") == "pbm"
    @test check("images/example.xbm") == "xbm"
    @test check("images/example.bmp") == "bmp"
    @test check("images/example.pgm") == "pgm"
    @test check("images/example.ppm") == "ppm"
    @test check("images/example.ras") == "rast"
    @test_throws MethodError check("ait")
end 
