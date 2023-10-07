//SPDX-License-Identifier: MIT
pragma solidity >= 0.0.7 < 0.9.0;
contract ENUM{
    enum user {
        allowed, // 0 will be written 
        not_allowed, // 1 will be written
        wait // 2 will be written
    }
    user public u1 = user.allowed;
    user public u2 = user.not_allowed;
    user public u3 = user.wait;
}
// enums are used to enhnace readibity of code, and used over small sets
