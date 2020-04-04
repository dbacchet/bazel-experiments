from __future__ import division

from protos import common_pb2
from protos import state_pb2

def test_example1():
    """ basic example of python unit test """
    print('this is a python test')
    agent = state_pb2.Agent()
    assert True

def test_example2():
    """ basic example of python unit test """
    print('this is a python test')
    agent = state_pb2.Agent()
    assert True


if __name__ == "__main__":
    test_example()
