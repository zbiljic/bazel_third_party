"""Provides the repository macro to import com_github_twitchtv_twirp."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def com_github_twitchtv_twirp_dependencies():
    maybe(
        http_archive,
        name = "io_bazel_rules_go",
        sha256 = "f2dcd210c7095febe54b804bb1cd3a58fe8435a909db2ec04e31542631cf715c",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.31.0/rules_go-v0.31.0.zip",
            "https://github.com/bazelbuild/rules_go/releases/download/v0.31.0/rules_go-v0.31.0.zip",
        ],
    )
    http_archive(
        name = "com_github_twitchtv_twirp",
        patch_args = ["-p1"],
        patches = [
            # gazelle args: -repo_root . -go_prefix github.com/twitchtv/twirp -go_naming_convention import_alias -proto disable
            "@com_github_zbiljic_bazel_third_party//com_github_twitchtv_twirp:gazelle.patch",
        ],
        sha256 = "0f15219ebc5dbe77137e5b02603ceedd737dc295d5f87736d06b9a20802d3295",
        strip_prefix = "twirp-8.1.2",
        url = "https://github.com/twitchtv/twirp/archive/v8.1.2.tar.gz",
    )
