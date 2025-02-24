contract A {
    uint x;
}

contract B is A {
    uint32 y;
}

contract C is B {
    uint160 w;
}

contract D is A, B, C layout at 2 {
    uint z;
    function f() public view returns (uint s, uint o) {
        assembly {
            s := x.slot
            o := x.offset
        }
    }
    function g() public view returns (uint s, uint o) {
        assembly {
            s := y.slot
            o := y.offset
        }
    }
    function h() public view returns (uint s, uint o) {
        assembly {
            s := w.slot
            o := w.offset
        }
    }
    function i() public view returns (uint s, uint o) {
        assembly {
            s := z.slot
            o := z.offset
        }
    }
}
// ----
// f() -> 2, 0
// g() -> 3, 0
// h() -> 3, 4
// i() -> 4, 0
