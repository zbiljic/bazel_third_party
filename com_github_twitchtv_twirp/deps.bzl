load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def com_github_twitchtv_twirp_dependencies():
    maybe(
        http_archive,
        name = "io_bazel_rules_go",
        sha256 = "7904dbecbaffd068651916dce77ff3437679f9d20e1a7956bff43826e7645fcc",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.25.1/rules_go-v0.25.1.tar.gz",
            "https://github.com/bazelbuild/rules_go/releases/download/v0.25.1/rules_go-v0.25.1.tar.gz",
        ],
    )
    http_archive(
        name = "com_github_twitchtv_twirp",
        patch_args = ["-p1"],
        patches = [
            # gazelle args: -repo_root . -go_prefix github.com/twitchtv/twirp -go_naming_convention import_alias -proto disable
            "@com_github_zbiljic_bazel_third_party//com_github_twitchtv_twirp:gazelle.patch",
        ],
        sha256 = "4e16045adb43223d5cc5907e00557ac8725379f9ab5b4338659ade9b2ccb0a97",
        strip_prefix = "twirp-7.1.0",
        url = "https://github.com/twitchtv/twirp/archive/v7.1.0.tar.gz",
    )
