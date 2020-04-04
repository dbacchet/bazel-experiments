workspace(name = "build_experiments_conan_bazel")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

http_archive(
    name = "googletest",
    urls = ["https://storage.googleapis.com/voy-build-packages/bazel_external_deps/googletest-release-1.10.0.tar.gz"],
    sha256 = "9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb",
    strip_prefix = "googletest-release-1.10.0",
)

http_archive(
    name = "rules_proto",
    urls = ["https://storage.googleapis.com/voy-build-packages/bazel_external_deps/rules_proto-f6b8d89b90a7956f6782a4a3609b2f0eee3ce965.tar.gz"],
	sha256 = "4d421d51f9ecfe9bf96ab23b55c6f2b809cbaf0eea24952683e397decfbd0dd0",
    strip_prefix = "rules_proto-f6b8d89b90a7956f6782a4a3609b2f0eee3ce965",
)
load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")
rules_proto_dependencies()
rules_proto_toolchains()

# GRPC has a build rule for Python protocol buffers (py_proto_library)
http_archive(
    name = "grpc",
    urls = ["https://github.com/grpc/grpc/archive/v1.27.2.tar.gz"],
    sha256 = "49c1cca77d07877b878b396b42655c71a412dc14bb95d4f959d6c8971a6bb908",
    strip_prefix = "grpc-1.27.2",
)
# grpc has an implicit dependency on //external:protocol_compiler, which we set up here
bind(
    name = "protocol_compiler",
    actual = "@com_google_protobuf//:protoc",
)


http_archive(
    name = "pybind11",
    urls = ["https://storage.googleapis.com/voy-build-packages/bazel_external_deps/pybind11-v2.4.3.tar.gz"],
    sha256 = "1eed57bc6863190e35637290f97a20c81cfe4d9090ac0a24f3bbf08f265eb71d",
    build_file = "//bazel_external_deps:BUILD.pybind11",
)

http_archive(
    name = "eigen",
    urls = ["https://storage.googleapis.com/voy-build-packages/bazel_external_deps/eigen-3.3.7.tar.gz"],
    sha256 = "d56fbad95abf993f8af608484729e3d87ef611dd85b3380a8bad1d5cbc373a57",
    build_file = "//bazel_external_deps:BUILD.eigen",
)


http_archive(
    name = "spdlog",
    urls = ["https://github.com/gabime/spdlog/archive/v1.5.0.tar.gz"],
    sha256 = "b38e0bbef7faac2b82fed550a0c19b0d4e7f6737d5321d4fd8f216b80f8aee8a",
    build_file = "//bazel_external_deps:BUILD.spdlog",
)

# TODO: replace the following 2 local repository declarations with repo rules
# python 2.7 on linux (tested on ubuntu 16.04)
new_local_repository(
    name = "python_runtime_linux",
    path = "/usr",
    build_file = "//bazel_external_deps:BUILD.python_runtime_linux",
)

# python 2.7 on OSX (tested on MacOS 10.14)
new_local_repository(
    name = "python_runtime_macos",
    path = "/System/Library/Frameworks/Python.framework/Versions/2.7",
    build_file = "//bazel_external_deps:BUILD.python_runtime_macos",
)

