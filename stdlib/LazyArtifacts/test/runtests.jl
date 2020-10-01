using LazyArtifacts
using Test

mktempdir() do tempdir
    LazyArtifacts.Artifacts.with_artifacts_directory(tempdir) do
        socrates_dir = artifact"socrates"
        @test isdir(socrates_dir)
        ex = @test_throws ErrorException artifact"c_simple"
        @test startswith(ex.value.msg, "Artifact \"c_simple\" was not installed correctly. ")
    end
end
