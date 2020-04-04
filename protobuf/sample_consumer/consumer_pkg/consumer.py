from __future__ import division

from protos import common_pb2
from protos import state_pb2

def do_something():
    """ basic example of consumer of proto files """
    print('do something with the protos...')
    pos = common_pb2.Vec3()
    pos.x = 12
    print('pos val:',pos.x, pos.y, pos.z)
    
    agent = state_pb2.Agent()
    print(agent.id)
    agent.pose.pos.CopyFrom(pos)
    print('agent pose.pos:', agent.pose.pos)
    print('agent pose', agent.pose)
    agent.id = 123123
    print(agent.id)
    return True


if __name__ == "__main__":
    do_something()
