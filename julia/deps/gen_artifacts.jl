using ArtifactUtils, Pkg.BinaryPlatforms

const tag = "rs-v0.1.3"
const artifacts_toml = joinpath(@__DIR__, "..", "Artifacts.toml")
const artifact_name = "keishis_sandbox"
const base_url = "https://github.com/KeishiS/keishis_sandbox/releases/download/$(tag)"

const targets = [
    Dict(:ARCH => "x86_64", :OS => "linux", :FILE => "target-linux-x86_64.tar.gz"),
    Dict(:ARCH => "aarch64", :OS => "linux", :FILE => "target-linux-aarch64.tar.gz"),
    Dict(:ARCH => "x86_64", :OS => "macos", :FILE => "target-macos-x86_64.tar.gz"),
    Dict(:ARCH => "aarch64", :OS => "macos", :FILE => "target-macos-aarch64.tar.gz"),
    Dict(:ARCH => "x86_64", :OS => "windows", :FILE => "target-windows-x86_64.tar.gz"),
    Dict(:ARCH => "aarch64", :OS => "windows", :FILE => "target-windows-aarch64.tar.gz")
]

for target in targets
    filename = "target-$(target[:OS])-$(target[:ARCH]).tar.gz"
    url = "$(base_url)/$(filename)"

    ArtifactUtils.add_artifact!(
        artifacts_toml,
        artifact_name,
        url;
        platform=Platform(target[:ARCH], target[:OS]),
        force=true
    )
    println("Added $(filename)")
end
