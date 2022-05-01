"""Provides the repository macro to import com_github_planetscale_vtprotobuf."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def com_github_planetscale_vtprotobuf_dependencies():
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
        name = "com_github_planetscale_vtprotobuf",
        patch_args = ["-p1"],
        patches = [
            # gazelle args: -repo_root . -go_prefix github.com/planetscale/vtprotobuf -go_naming_convention import_alias -proto disable
            "@com_github_zbiljic_bazel_third_party//com_github_planetscale_vtprotobuf:gazelle.patch",
        ],
        sha256 = "2656ccdfc33ed94d9ee9f1d519d5d1fea2731e3283a0dbee11fbca2451893ab2",
        strip_prefix = "vtprotobuf-0.3.0",
        url = "https://github.com/planetscale/vtprotobuf/archive/refs/tags/v0.3.0.zip",
    )
