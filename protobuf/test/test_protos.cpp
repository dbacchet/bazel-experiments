#include <gtest/gtest.h>

#include "common.pb.h"
#include "vehicle/state.pb.h"

TEST(ProtosCpp, Example) {
    vehicle::State state;
    state.mutable_twist()->mutable_lin()->set_x(12.3);

    ASSERT_DOUBLE_EQ(state.twist().lin().x(), 12.3);
    ASSERT_EQ(-1, -1);
}

