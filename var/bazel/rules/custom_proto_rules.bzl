load("@bazel_skylib//lib:paths.bzl", "paths")
load("@grpc//bazel:python_rules.bzl", "py_proto_library")

def _proto_package_impl(ctx):
    package_name = ctx.label.name
    package_name = ctx.attr.package_name
    all_outputs = []
    init_file = ctx.actions.declare_file(paths.join(package_name,'__init__.py'))
    ctx.actions.write(init_file, "")
    all_outputs.append(init_file)
    for d in ctx.attr.deps:
        for f in d.files.to_list():
            out = ctx.actions.declare_file(paths.join(package_name, f.basename))
            all_outputs.append(out)
            ctx.actions.run_shell(
                outputs=[out],
                inputs=depset([f]),
                arguments=[f.path, out.path, paths.dirname(out.path)],
                command="mkdir -p $3 && cp $1 $2"
            )
    return [DefaultInfo(files = depset(all_outputs), runfiles = ctx.runfiles(all_outputs)),
            PyInfo(transitive_sources = depset(), imports = depset(direct = [paths.dirname(ctx.build_file_path)]))
            ]

proto_package = rule(
    implementation = _proto_package_impl,
    attrs = {
        "package_name": attr.string(mandatory=True),
        "deps": attr.label_list(allow_files=True),
    },
)

# macro to create a regular python package with protobuf files
def py_proto_package(name, package_name, protos, deps, visibility=['visibility://private']):
    # step 1: codegen the python protobuf files. Instead of re-implementing the rule, we piggy-back on the one shipped with GRPC
    py_proto_library_name = '{}_py_proto_library'.format(name)
    py_proto_library(
        name = py_proto_library_name,
        deps = protos,
        visibility = ['//visibility:private'],
    )
    # step 2: create the package and move the generated files in it
    proto_package_name = '{}_proto_package'.format(name)
    proto_package(
        name = proto_package_name,
        package_name = package_name,
        deps = [':{}'.format(py_proto_library_name)] + deps,
        visibility = ['//visibility:private'],
    )
    # step 3: create a python library so we can use it in other build targets (like unit tests)
    native.py_library(
        name = name,
        srcs = [':{}'.format(proto_package_name)],
        imports = ['.'],
        deps = ['@com_google_protobuf//:protobuf_python'], # we depend directly on protobuf instead of :py_proto_library_name to remove all the import paths generated by grpc
        visibility = visibility,
    )

    