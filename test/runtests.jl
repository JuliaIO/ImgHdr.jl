using ImgHdr
using ImgHdr: imgtype
using Test: @testset, @test, @test_throws

@testset "test_images_types" begin
    png = "images/example.png"
    gif = "images/example.gif"

    @test ImgHdr.isa_png(png)
    @test imgtype(png) == "png"
    @test imgtype(png) != "gif"

    @test ImgHdr.isa_gif(gif)
    @test imgtype(gif) == "gif"
    @test imgtype(gif) != "png"

    jpeg = "images/example.jpeg"
    @test ImgHdr.isa_jpeg(jpeg)
    @test imgtype(jpeg) == "jpeg"
    @test imgtype(jpeg) != "pgn"

    exr = "images/example.exr"
    @test ImgHdr.isa_exr(exr)
    @test imgtype(exr) == "exr"
    @test imgtype(exr) != "gif"

    tiff = "images/example.tiff"
    @test ImgHdr.isa_tiff(tiff)
    @test imgtype(tiff) == "tiff"
    @test imgtype(tiff) != "png"

    webp = "images/example.webp"
    @test ImgHdr.isa_webp(webp)
    @test imgtype(webp) == "webp"
    @test imgtype(webp) != "gif"

    pbm = "images/example.pbm"
    @test ImgHdr.isa_pbm(pbm)
    @test imgtype(pbm) == "pbm"
    @test imgtype(pbm) != "png"

    xbm = "images/example.xbm"
    @test ImgHdr.isa_xbm(xbm)
    @test imgtype(xbm) == "xbm"
    @test imgtype(xbm) != "gif"

    bmp = "images/example.bmp"
    @test ImgHdr.isa_bmp(bmp)
    @test imgtype(bmp) == "bmp"
    @test imgtype(bmp) != "png"

    pgm = "images/example.pgm"
    @test ImgHdr.isa_pgm(pgm)
    @test imgtype(pgm) == "pgm"
    @test imgtype(pgm) != "gif"

    ppm = "images/example.ppm"
    @test ImgHdr.isa_ppm(ppm)
    @test imgtype(ppm) == "ppm"
    @test imgtype(ppm) != "png"

    rast = "images/example.ras"
    @test ImgHdr.isa_rast(rast)
    @test imgtype(rast) == "rast"
    @test imgtype(rast) != "gif"

    rgb = "images/example.rgb"
    @test ImgHdr.isa_rgb(rgb)
    @test imgtype(rgb) == "rgb"
    @test imgtype(rgb) != "png"
    
    not = "images/not-a-image.txt"
    @test ImgHdr.isa_ppm(not) == false
    @test imgtype(not) == nothing
end 
