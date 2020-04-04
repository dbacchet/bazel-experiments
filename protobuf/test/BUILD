cc_test(
    name = 'test_protos_cpp',
    srcs = ['test_protos.cpp'],
    deps = ['//protobuf/protos:protos_cc',
            '@googletest//:gtest_main'],
)

py_test(
    name = 'test_protos_py',
    srcs = ['test_protos.py',
            'test_protos_v2.py',
            'py_tests_main.py',
            ],
    main = 'py_tests_main.py',
    deps = [
            '//protobuf/protos:protos_pkg',
            ],
    python_version = 'PY2',
)

py_test(
    name = 'test_consumer_py',
    srcs = ['test_consumer.py',
            ],
    main = 'test_consumer.py',
    deps = [
            '//protobuf/protos:protos_pkg',
            '//protobuf/sample_consumer:consumer_pkg',
            ],
    python_version = 'PY2',
)
