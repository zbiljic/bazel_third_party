"""Provides the repository macro to import com_github_twitchtv_twirp."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def com_github_twitchtv_twirp_dependencies():
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
        name = "com_github_twitchtv_twirp",
        patch_args = ["-p1"],
        patches = [
            # gazelle args: -repo_root . -go_prefix github.com/twitchtv/twirp -go_naming_convention import_alias -proto disable
            "@com_github_zbiljic_bazel_third_party//com_github_twitchtv_twirp:gazelle.patch",
        ],
        sha256 = "ad44b22ca53ab8b281a8482826701a2d6b2de26209ee3f84cb47a5f52d747e32",
        strip_prefix = "twirp-8.0.0",
        url = "https://github.com/twitchtv/twirp/archive/v8.0.0.tar.gz",
    )
