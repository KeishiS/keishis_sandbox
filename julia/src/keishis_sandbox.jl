module keishis_sandbox

using Libdl, Artifacts

export mysum

const PKG_NAME = "keishis_sandbox"
const artifact_root = @artifact_str"keishis_sandbox"
const lib = joinpath(artifact_root, "lib$(PKG_NAME)." * Libdl.dlext)

function mysum(a::Int, b::Int)::Int
    return ccall((:mysum, lib), Int, (Int, Int), a, b)
end

end # module keishis_sandbox
