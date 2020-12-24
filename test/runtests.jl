using ImgHdr, Test

@testset "test_images" begin
    @test check("images/example.png") == "png"
    @test check("images/example.gif") == "gif"
    @test check("images/example.jpeg") == "jpeg"
    @test check("images/example.exr") == "exr"
    @test check("images/example.tiff") == "tiff"
    @test check("images/example.webp") == "webp"
    @test check("images/example.pgm") == "pgm"
    @test_throws MethodError check("ait")
end 
