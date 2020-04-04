import sys

from consumer_pkg import consumer

def test_consumer():
    # print the import paths
    for p in sys.path:
        print p
    # invoke a function in the cosumer that uses the protobuf package
    ret = consumer.do_something()
    assert ret


if __name__ == "__main__":
    test_consumer()
