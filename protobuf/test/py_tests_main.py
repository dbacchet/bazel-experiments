import sys,os
import nose

# explicitly specify the base folder because the workin dir is different when invoked by bazel
base_folder = os.path.dirname(os.path.abspath(__file__))
nose.main(argv = ['', '-w',base_folder])
