load("@grpc//bazel:python_rules.bzl", "py_proto_library")
load("//var/bazel/rules:custom_proto_rules.bzl", "py_proto_package")

proto_library(
    name = 'protos',
    srcs = glob(['**/*.proto']),
    strip_import_prefix = '',
    deps = ['@com_google_protobuf//:timestamp_proto',
           ],
)

cc_proto_library(
    name = 'protos_cc',
    deps = [':protos'],
    visibility = ['//visibility:public'],
)

py_proto_package(
    name = 'protos_pkg',        # name of the rule
    package_name = 'protos',    # generated package name
    protos = [':protos'],       # protobuf files to package (`proto_library` rule)
    deps = ['another_file.py'], # additional files to package
    visibility = ['//visibility:public'],
)
