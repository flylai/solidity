contract A {
    uint x;
    uint32 w;
}

contract C is A layout at 7 {
    uint128 y;
    uint z;

    function f() public returns(uint s, uint o) {
        assembly {
            s := x.slot
            o := x.offset
        }
    }
    function g() public returns(uint s, uint o) {
        assembly {
            s := w.slot
            o := w.offset
        }
    }
    function h() public returns(uint s, uint o) {
        assembly {
            s := y.slot
            o := y.offset
        }
    }
    function i() public returns(uint s, uint o) {
        assembly {
            s := z.slot
            o := z.offset
        }
    }
}
// ----
// f() -> 7, 0
// g() -> 8, 0
// h() -> 8, 4
// i() -> 9, 0
