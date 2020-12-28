# com_github_twitchtv_twirp

Bazel rule for [`github.com/twitchtv/twirp`](https://github.com/twitchtv/twirp).

## Setup and usage

`WORKSPACE` file:

```bzl
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "com_github_zbiljic_bazel_third_party",
    commit = "<commit>",
    remote = "https://github.com/zbiljic/bazel_third_party.git",
    shallow_since = "<bla>",
)

load("@com_github_zbiljic_bazel_third_party//com_github_twitchtv_twirp:deps.bzl", "com_github_twitchtv_twirp_dependencies")

com_github_twitchtv_twirp_dependencies()
```

This project includes additional rule, which provides compiler for Go Twirp code.

Use it in `BUILD.bazel` file for the proto , inside of `go_proto_library` by adding it to list of `compilers`:

```bzl
proto_library(
    name = "example_proto",
    srcs = ["example.proto"],
    visibility = ["//visibility:public"],
)

go_proto_library(
    name = "example_go_proto",
    compilers = [
        "@io_bazel_rules_go//proto:gogo_proto",
        "@com_github_zbiljic_bazel_third_party//com_github_twitchtv_twirp:go_proto_twirp",
    ],  # keep
    importpath = "<proto_importpath>",
    proto = ":example_proto",
    visibility = ["//visibility:public"],
)
```

Note that `# keep` comment that protect parts of build files from being modified
should be added to the `compilers` option (when `gazelle` is used).
