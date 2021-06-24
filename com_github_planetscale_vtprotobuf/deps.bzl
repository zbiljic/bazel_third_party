"""Provides the repository macro to import com_github_planetscale_vtprotobuf."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def com_github_planetscale_vtprotobuf_dependencies():
    maybe(
        http_archive,
        name = "io_bazel_rules_go",
        sha256 = "69de5c704a05ff37862f7e0f5534d4f479418afc21806c887db544a316f3cb6b",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.27.0/rules_go-v0.27.0.tar.gz",
            "https://github.com/bazelbuild/rules_go/releases/download/v0.27.0/rules_go-v0.27.0.tar.gz",
        ],
    )
    http_archive(
        name = "com_github_planetscale_vtprotobuf",
        patch_args = ["-p1"],
        patches = [
            # gazelle args: -repo_root . -go_prefix github.com/planetscale/vtprotobuf -go_naming_convention import_alias -proto disable
            "@com_github_zbiljic_bazel_third_party//com_github_planetscale_vtprotobuf:gazelle.patch",
        ],
        sha256 = "c8fd57ebbfbff7f61b024e5c34df47bca5cedec685dc76d5eec3b4c3a8fb9a47",
        strip_prefix = "vtprotobuf-6bcb78e80dd64844a35956f54d95b88b127a7015",
        url = "https://github.com/planetscale/vtprotobuf/archive/6bcb78e80dd64844a35956f54d95b88b127a7015.zip",
    )
